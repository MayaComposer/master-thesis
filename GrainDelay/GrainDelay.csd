
<Cabbage> bounds(0, 0, 0, 0)
form caption("Grain Delay") size(900, 675), guiMode("queue") pluginId("def1") colour("beige") textColour("black") fontColour("black")
vmeter bounds(1060, 400, 40, 160) channel("vu1") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 

vslider bounds(-60, 64, 240, 180) channel("GrainRateSlider") range(1, 150, 1, 1, 1) text("Grain Rate") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255) 
vslider bounds(214, 64, 240, 180) channel("SpeedSlider") range(0.1, 10, 1, 1, 0.01) text("Playback speed") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)
vslider bounds(360, 64, 240, 180) channel("DurSlider") range(0.1, 10, 1, 1, 0.01) text("Duration") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)
vslider bounds(520, 64, 240, 180) channel("FeedbackSlider") range(0, 0.9, 0, 1, 0.01) text("Feedback") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)
vslider bounds(672, 64, 240, 180) channel("RndMaskSlider") range(0, 1, 0, 1, 0.01) text("RndMask") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)
vslider bounds(72, 64, 240, 180) channel("DelaySlider") range(0.1, 1000.0, 0, 1, 0.01) text("Delay") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)
button bounds(2, 4, 80, 40) channel("mute"), text("Muted", "Unmuted"), corners(5), value(0) colour:1(22, 106, 15, 255) colour:0(226, 74, 74, 255)
button bounds(92, 4, 80, 40) channel("mute2"), text("Muted", "Unmuted"), corners(5), value(0) colour:1(22, 106, 15, 255) colour:0(226, 74, 74, 255)
</Cabbage>
<CsoundSynthesizer>
-n
<CsInstruments>

; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1
 
; audio buffer table for granular effects processing
giLiveFeedLen = 524288 ; 11.8 seconds buffer at 44.1
giLiveFeedLenSec = giLiveFeedLen/sr
giLiveFeed ftgen 0, 0, giLiveFeedLen+1, 2, 0

; other tables
giSine ftgen 0, 0, 65536, 10, 1 
giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 
giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1 
giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 

giSoundFile   ftgen   0, 0, 0, 1, "loop.wav", 0, 0, 0

; this UDO is needed to upsample the samplepos pointer with interpolation
; simply using interp will give artifacts when the time pointer wraps around (from 1 to 0)
; UpsampPhasor ensures correct interpolation across the wraparound boundary,
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

;record input to buffer
instr 1
  ;mic on or off
  kMute cabbageGetValue "mute"
  if (kMute == 1) then
    a1 inch 1 
  elseif (kMute == 0) then
    a1 = 0
  endif
  
  aFeed chnget "partikkelFeedback" 
  kFeed cabbageGetValue "FeedbackSlider"
  a1 = a1 + (aFeed*kFeed) 
  kdry = 0.0
  aout = a1 * kdry 
  out aout

  iLength = ftlen(giLiveFeed)
  gkstartFollow tablewa giLiveFeed, a1, 0 
  ; reset kstart when table is full
  gkstartFollow = (gkstartFollow > (giLiveFeedLen-1) ? 
  0 : gkstartFollow) 
  ; update table guard point (for interpolation)
  tablegpw giLiveFeed 
endin

;******************************************************
; grain delay
instr 2
  ; grain clock
  kGrainRate cabbageGetValue "GrainRateSlider"
  async  = 0.0 

  ; grain shape
  kGrainDur cabbageGetValue "DurSlider"
  kduration = (kGrainDur*1000)/kGrainRate 

  kRandomMask cabbageGetValue "RndMaskSlider"

  ; different pitch for each source waveform
  kwavfreq cabbageGetValue "SpeedSlider"
  kfildur1 = tableng(giLiveFeed) / sr  
  kwavekey1 = 1/kfildur1 
  kwavekey2 = semitone(-5)/kfildur1 
  kwavekey3 = semitone(4)/kfildur1 
  kwavekey4 = semitone(9)/kfildur1 
  awavfm = 0  

  ; grain delay time, more random deviation
  ksamplepos1 = 0.1 ;delay time
  kpos1Deviation randh 0.03, kGrainRate
  ksamplepos1 = ksamplepos1 + kpos1Deviation
  ; use different delay time for each source waveform
  ; (actually same audio, but read at different pitch)
  ksamplepos2 = ksamplepos1+0.05                       
  ksamplepos3 = ksamplepos1+0.1                       
  ksamplepos4 = ksamplepos1+0.2                       

  ; Avoid crossing the record boundary 
  #define RecordBound(N)#
  ksamplepos$N. limit ksamplepos$N., 
        (kduration*kwavfreq)/(giLiveFeedLenSec*1000),1
  ; make samplepos follow the record pointer 
  ksamplepos$N.  = 
        (gkstartFollow/giLiveFeedLen) - ksamplepos$N.
  asamplepos$N. UpsampPhasor ksamplepos$N.
  asamplepos$N wrap asamplepos$N, 0, 1 
  #
  $RecordBound(1)
  $RecordBound(2)
  $RecordBound(3)
  $RecordBound(4)

  ; activate all 4 source waveforms
  iwaveamptab ftgentmp 0, 0, 32, -2, 0, 0, 1,1,1,1,0                   

  a1  partikkel kGrainRate, \
  0, -1, async, 0, -1, giSigmoRise, \
  giSigmoFall, 0, 0.5, kduration, 0.5, -1, \
  kwavfreq, 0.5, -1, -1, awavfm, -1, \
  -1, giCosine, 1, 1, 1, \
  -1, kRandomMask, giLiveFeed, giLiveFeed, giLiveFeed, giLiveFeed, 
  iwaveamptab, asamplepos1, asamplepos2, asamplepos3, asamplepos4, kwavekey1, \
  kwavekey2, kwavekey3, kwavekey4, 100

  ; audio feedback in granular processing 
  aFeed dcblock a1 
  chnset aFeed, "partikkelFeedback" 

  ;display
  k1 rms a1, 20
  cabbageSetValue "vu1", portk(k1*10, .25), metro(10)

  kMute cabbageGetValue "mute" ;get muted or unmuted value
  a1 *= kMute
  outs a1*ampdbfs(-1), a1*ampdbfs(-1)
endin

instr 3
  kMute cabbageGetValue "mute2" ;get muted or unmuted value
  kMouseX = chnget:k("MOUSE_X")
  kMouseY = chnget:k("MOUSE_Y")

  kMouseX scale2 kMouseX, 0.0, 1.0, 0, 900
  kMouseY scale2 kMouseY, 0.0, 1.0, 0, 675
  ;printk 1, kMouseX
  ;printk 1, kMouseY
  kAmp = kMouseX   ; amplitude
  kPitch = kMouseX ; pitch/speed
  kLoopStart = kMouseY  ; point where looping begins (in seconds)
  kLoopEnd = nsamp(giSoundFile)/sr; loop end (end of file)
  kCrossFade = 0   ; cross-fade time
  ; read audio from the function table using the flooper2 opcode
  aSig flooper2 kAmp,kPitch,kLoopStart,kLoopEnd,kCrossFade,giSoundFile
  aSig *= kMute * 0.7
  outs aSig, aSig
endin

</CsInstruments>
<CsScore>
f0 z
i1 0 [60*60*24*7]  ; record live input 
i2 0 [60*60*24*7]  ; granular delay 
i3 0 [60*60*24*7]  ; mouse
</CsScore>
</CsoundSynthesizer>
