<Cabbage>
form size(540, 300), caption("Partikkel starter synth"), pluginId("pss1")
image bounds(-2, 0, 540, 300),  colour(40, 40, 50)

rslider channel("Rate"), bounds(5, 8, 70, 70), text("Rate"), range(1, 4000, 100, 0.35, 0.1), identChannel("Rate_id")
rslider channel("Pitch"), bounds(80, 8, 70, 70), text("Pitch"), range(0.2, 4, 1, 0.35, 0.001), identChannel("Pitch_id")
rslider channel("Delay"), bounds(155, 8, 70, 70), text("Delay"), range(0.0, 1, 0, 1, 0.001)
rslider channel("Amp"), bounds(310, 85, 70, 70), text("Amp"), range(-96, 0, -5, 3, 0.001)

csoundoutput bounds(5,165,530,150)

<CabbageIncludes>
partikkel_basic_settings_efx.inc
</CabbageIncludes>


</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-n -d -m0 
</CsOptions>
<CsInstruments>

  ;sr   = 44100
  ksmps   = 10
  nchnls   = 2
  0dbfs  = 1


 ; live input buffer table for granular effects processing
 giLiveFeedLen = 524288
 giLiveFeedLenSec = giLiveFeedLen/sr
 giLiveFeed ftgen 0, 0, giLiveFeedLen+1, 2, 0 ; create empty buffer for live input

 ; classic waveforms
 giSine ftgen 0, 0, 65537, 10, 1 ; sine wave
 giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 ; cosine wave
 giTri ftgen 0, 0, 8193, 7, 0, 2048, 1, 4096, -1, 2048, 0 ; triangle wave

 ; grain envelope tables
 giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1 ; rising sigmoid
 giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 ; falling sigmoid
 giExpFall ftgen 0, 0, 8193, 5, 1, 8193, 0.00001 ; exponential decay
 giTriangleWin ftgen 0, 0, 8193, 7, 0, 4096, 1, 4096, 0 ; triangular window


;***************************************************
;record input to buffer
instr 1

 a1 inch 1 ; signal input

 aFeed chnget "partikkelFeedback" ; feedback from partikkel audio output
 a1 = a1 + aFeed ; mix feedback with live input

; write audio to table
 iAudioTable = giLiveFeed
 iLength = ftlen(iAudioTable)
 aenv linsegr 1, 1, 1, 0.1, 0
 a1 *= aenv
 gkstartFollow init 0
 gkstartFollow tablewa iAudioTable, a1, 0 ; write audio a1 to table
 gkstartFollow = (gkstartFollow > (giLiveFeedLen-1) ? 0 : gkstartFollow) ; reset kstart when table is full
 tablegpw iAudioTable ; update table guard point (for interpolation)
 chnset gkstartFollow, "kstartFollow" ; output the buffer position to chn

endin

;******************************************************
; partikkel instr
instr 2

#include "partikkel_basic_settings_efx.inc"

; a selection of parameters to start experimentation with partikkel
 kamp chnget "Amp"
 kamp = ampdbfs(kamp) ; amp
 kgrainrate chnget "Rate" ; number of grains per second
 kwavfreq chnget "Pitch" ; playback speed inside each grain
 kRelDur = 1 ; grain duration
 kduration = (kRelDur*1000)/kgrainrate ; grain dur in milliseconds, relative to grain rate
 krandommask = 0 ; random muting of single grains
 ksamplepos1 chnget "Delay" ; in granular effect processing, this parameter will set the "grain delay" time, as a fraction of the input buffer length
 kfeedback = 0.7
  
 ; if samplepos is close to zero, see to it that grain playback does not cross the record pointer border,
 ; as this will delay the (live feed) sound for the length of a livefeed sample buffer.
 ; So, check grain duration and transpose, limit samplepos accordingly
 ksamplepos1 limit ksamplepos1, (kduration*kwavfreq)/(giLiveFeedLenSec*1000), 1

 ; make samplepos follow the record pointer instead of staying at a stationary value, makes live follow samplepos into "grain delay time"
 kstartFollow chnget "kstartFollow" ; the current buffer write position for live follow mode
 ksamplepos1 = (kstartFollow/giLiveFeedLen) - ksamplepos1 ; move samplepos in parallel with the write pointer for the input buffer
 ksamplepos1 = (ksamplepos1 < 0 ? ksamplepos1+1 : ksamplepos1) ; wrap around on undershoot
 ksamplepos1 = (ksamplepos1 > 1 ? ksamplepos1-1 : ksamplepos1) ; wrap around on overshoot
 asamplepos1 upsamp ksamplepos1 ; upsample

 a1,a2,a3,a4,a5,a6,a7,a8 partikkel \ ; (beginner)
 kgrainrate, \ ; grains per second *
 kdistribution, idisttab, async, \ ; synchronous/asynchronous
 kenv2amt, ienv2tab, ienv_attack, ienv_decay, \ ; grain envelope (advanced)
 ksustain_amount, ka_d_ratio, kduration, \ ; grain envelope *
 1, \ ; amp *
 igainmasks, \ ; gain masks (advanced)
 kwavfreq, \ ; grain pitch (playback frequency) *
 ksweepshape, iwavfreqstarttab, iwavfreqendtab, \ ; grain pith sweeps (advanced)
 awavfm, ifmamptab, ifmenv, \ ; grain pitch FM (advanced)
 icosine, kTrainCps, knumpartials, kchroma, \ ; trainlets
 ichannelmasks, \ ; channel mask (advanced)
 krandommask, \ ; random masking of single grains *
 kwaveform1, kwaveform2, kwaveform3, kwaveform4, \ ; set source waveforms * (using only waveform 1)
 iwaveamptab, \ ; mix source waveforms
 asamplepos1, asamplepos2, asamplepos3, asamplepos4, \ ; read position for source waves  * (using only samplepos 1)
 kwavekey1, kwavekey2, kwavekey3, kwavekey4, \ ; individual transpose for each source
 imax_grains ; system parameter (advanced)

; audio feedback in granular processing
 aSum sum a1,a2,a3,a4,a5,a6,a7,a8
 aSum dcblock aSum
 chnset aSum*kfeedback, "partikkelFeedback"

; audio out
 outs a1*kamp, a2*kamp
endin

</CsInstruments>
<CsScore>
;  start  dur
i1   0     86400
i2   0     86400
</CsScore>
</CsoundSynthesizer>
