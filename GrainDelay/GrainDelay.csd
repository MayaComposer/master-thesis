<Cabbage> bounds(0, 0, 0, 0)
form caption("Grain Delay") size(900, 675), guiMode("queue") pluginId("def2") colour("beige") textColour("black") fontColour("black")

vslider bounds(-60, 64, 240, 180) channel("GrainRateSlider") range(1, 150, 100, 1, 1) text("Grain Rate") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255) 

vslider bounds(360, 64, 240, 180) channel("DurSlider") range(0.1, 7.0, 1.0, 1, 0.01) text("Duration") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)

vslider bounds(520, 64, 240, 180) channel("FeedbackSlider") range(0.0, 0.8, 0.0, 1, 0.01) text("Feedback") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)

vslider bounds(672, 64, 240, 180) channel("RndMaskSlider") range(0.0, 1.0, 0.0, 1, 0.01) text("RndMask") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)

vslider bounds(72, 64, 240, 180) channel("DelaySlider") range(0.0, 2500.0, 0.1, 1, 0.01) text("Delay") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)

vslider bounds(210, 64, 240, 180) channel("FreqSlider") range(0.1, 80, 1.0, 0.5, 0.01) text("Freq") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)

; button bounds(2, 4, 80, 40) channel("mute"), text("Muted", "Unmuted"), corners(5), value(0) colour:1(22, 106, 15, 255) colour:0(226, 74, 74, 255)
; button bounds(92, 4, 80, 40) channel("mute2"), text("Muted", "Unmuted"), corners(5), value(0) colour:1(22, 106, 15, 255) colour:0(226, 74, 74, 255)

vmeter bounds(812, 488, 36, 180) channel("vu1") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
vmeter bounds(850, 488, 36, 180) channel("vu2") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1)

csoundoutput bounds(8, 450, 399, 217) channel("csoundoutput10010"), fontColour("white")

combobox bounds(8, 8, 85, 40), mode("resize"), value(3)
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-m0 -n -d 
</CsOptions>
<CsInstruments>

 ; needs 0dbfs = 1, to keep recording and
 ; playback in same range
 0dbfs = 1 
 ksmps = 128
 nchnls = 2 

 ; audio buffer table for granular effects processing
 giLiveFeedLen = 524288 ; 11.8 seconds buffer at 44.1
 giLiveFeedLenSec = giLiveFeedLen/sr
 giLiveFeed ftgen 0, 0, giLiveFeedLen+1, 2, 0

 ; other tables
 giSine ftgen 0, 0, 65536, 10, 1 
 giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 
 giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1 
 giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 
 giSigmoWin ftgen 0, 0, 8193, 19, 1, 0.5, 270, 0.5		

; this UDO is needed to upsample the samplepos pointer
; with interpolation
; simply using interp will give artifacts
; when the time pointer wraps around (from 1 to 0)
; UpsampPhasor ensures correct interpolation across
; the wraparound boundary,

 gikr = kr
 opcode UpsampPhasor, a,k
 kval xin
 setksmps 1
 kold init 0
 if (abs(kold-kval)<0.5) && (abs(kold-kval)>0) then
 reinit interpolator
 elseif abs(kold-kval)>0.5 then; when phasor restarts 
 kold = kold-1
 reinit interpolator
 endif
 interpolator:
 aval linseg i(kold), 1/gikr, i(kval), 1/gikr, i(kval)
 rireturn
 kold = kval
 xout aval
 endop

;******************************************************
;record input to buffer
 instr 1
 a1 inch 1 
 aFeed chnget "partikkelFeedback" 
 kFeed chnget "FeedbackSlider" ;= 0.7
 printk2 kFeed, 4

 a1 = a1 + (aFeed*kFeed) 
 kdry = 0.0
 aout = a1 * kdry 
 outs aout, aout

 iLength = ftlen(giLiveFeed)
 gkstartFollow tablewa giLiveFeed, a1, 0 
 ; reset kstart when table is full
 gkstartFollow = (gkstartFollow > (giLiveFeedLen-1) ? 
 0 : gkstartFollow) 
 ; update table guard point (for interpolation)
 tablegpw giLiveFeed 

 endin

;******************************************************
; grain reverb
 instr 2
    gkGrainRateSlider chnget "GrainRateSlider"

    gkPlaybackSpeed chnget "PlaybackSpeedSlider"

    gkDurSlider chnget "DurSlider"

    gkFeedbackSlider chnget "FeedbackSlider"

    gkRndMaskSlider chnget "RndMaskSlider"

    gkDelaySlider chnget "DelaySlider"

    gkFreqSlider chnget "FreqSlider"

    ; grain clock
    kGrainRate = gkGrainRateSlider
    async  = 0.0 

    ; grain shape
    kGrainDur = gkDurSlider
    kduration = (kGrainDur*1000)/kGrainRate 

    ; grain pitch (transpose, or "playback speed")
    kwavfreq = gkFreqSlider
    kfildur1 = tableng(giLiveFeed) / sr  
    kwavekey1 = 1/kfildur1 
    awavfm = 0  

    ; automation of the grain delay time

    /* delaytimeSec = delaytime ms/1000
    delaytimeSec= samplepos * bufferlengthin sec
    samplepos = delaytime (sec) / bufferlength (sec)
    */
    kdelayTimeSec = gkDelaySlider / 1000
    printk2 kdelayTimeSec, 4

    ksampleDelay = kdelayTimeSec / giLiveFeedLenSec
    ksamplepos1 = ksampleDelay ;0.0 to 1.0
    kpos1Deviation randh 0.003, kGrainRate
    ksamplepos1 = ksamplepos1 + kpos1Deviation

    ; Avoid crossing the record boundary 
    ksamplepos1 limit ksamplepos1, 
        (kduration*kwavfreq)/(giLiveFeedLenSec*1000),1
    ; make samplepos follow the record pointer 
    ksamplepos1  = 
        (gkstartFollow/giLiveFeedLen) - ksamplepos1 
    asamplepos1 UpsampPhasor ksamplepos1
    asamplepos1 wrap asamplepos1, 0, 1

    ; channel masking table, send grains alternating to
    ; left and right output, for stereo reverb
    ichannelmasks ftgentmp 0, 0, 16, -2, 0, 1, 0, 1

    ; activate all 4 source waveforms
    iwaveamptab ftgentmp 0, 0, 32, -2, 0, 0, 1,1,1,1,0    

    a1, a2 partikkel kGrainRate, 0, -1, async, 0, -1, 
    giSigmoRise, giSigmoFall, 0, 0.5, kduration, 0.5, -1, 
    kwavfreq, 0.5, -1, -1, awavfm, 
    -1, -1, giCosine, 1, 1, 1, 
    ichannelmasks, 0, 
    giLiveFeed, giLiveFeed, giLiveFeed, giLiveFeed, -1,
    asamplepos1,asamplepos1,asamplepos1,asamplepos1, 
    kwavekey1, kwavekey1, kwavekey1, kwavekey1, 100

    ; audio feedback in granular processing 
    aFeed dcblock a1
    chnset aFeed, "partikkelFeedback" 

    outs a1*ampdbfs(-6), a2*ampdbfs(-6)

  
  ;add sound to meter
  k1 rms a1, 20
  k2 rms a2, 20

  cabbageSetValue "vu1", portk(k1*10, .25), metro(10)
  cabbageSetValue "vu2", portk(k2*10, .25), metro(10)

 endin

;******************************************************

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
i1 0 86400 ; record live input 
i2 0 86400 ; granular reverb
</CsScore>
</CsoundSynthesizer>
