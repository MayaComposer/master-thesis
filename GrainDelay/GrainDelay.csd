<Cabbage> bounds(0, 0, 0, 0)
form caption("Grain Delay") size(900, 675), guiMode("queue") pluginId("def2") colour("beige") textColour("black") fontColour("black")

vslider bounds(-60, 64, 240, 180) channel("GrainRateSlider") range(1, 150, 35, 1, 1) text("Grain Rate") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255) 

vslider bounds(360, 64, 240, 180) channel("DurSlider") range(20, 2000, 2000, 1, 1) text("Duration") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)

vslider bounds(520, 64, 240, 180) channel("FeedbackSlider") range(0.0, 0.95, 0.0, 1, 0.01) text("Feedback") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)

vslider bounds(672, 64, 240, 180) channel("RndMaskSlider") range(0.0, 1.0, 0.0, 1, 0.01) text("RndMask") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)

vslider bounds(72, 64, 240, 180) channel("DelaySlider") range(0.0, 2000, 0.0, 1, 1) text("Delay") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)

vslider bounds(72, 256, 240, 180) channel("SpraySlider") range(0, 500, 0.0, 1, 1) text("Spray") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)

vslider bounds(210, 64, 240, 180) channel("FreqSlider") range(-36, 24, 0.0, 1, 0.1) text("Transposition") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)

vslider bounds(210, 256, 240, 180) channel("RandPitchSlider") range(0, 12, 0.0, 1, 0.01) text("Random Pitch") textColour(0, 0, 0, 255) colour(0, 0, 0, 255) trackerColour(166, 95, 163, 255) valueTextBox(1) fontColour(0, 0, 0, 255)


vmeter bounds(790, 488, 36, 180) channel("vu1") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
vmeter bounds(828, 488, 36, 180) channel("vu2") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1)

csoundoutput bounds(488, 474, 401, 191) channel("Console") visible(0)


button bounds(874, 648, 25, 26) channel("ConsoleToggle") colour:0(238, 185, 185, 255) colour:1(2, 255, 69, 255) text("")

combobox bounds(8, 8, 85, 40), mode("resize"), value(3)
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-m0 -n -d 
</CsOptions>
<CsInstruments>

    0dbfs = 1 

    ; audio buffer table for granular effects processing
    giLiveFeedLen = 566400; 11.8 seconds buffer at 48
    giLiveFeedLenSec = giLiveFeedLen/sr
    giLiveFeed ftgen 0, 0, giLiveFeedLen+1, 2, 0

    ; other tables
    giSine ftgen 0, 0, 65536, 10, 1 
    giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 
    giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1 
    giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 

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

;******************************************************
    ;record input to buffer
    instr 1
        a1 inch 1 
        aFeed chnget "partikkelFeedback" 
        kFeed chnget "FeedbackSlider"
        a1 = a1 + (aFeed*kFeed) 
        ;kdry = 0
        ;aout = a1 * kdry 
        ;outs aout, aout

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
        kGrainRate chnget "GrainRateSlider"
        async  = 0.0 

        ; grain shape
        kGrainDur chnget "DurSlider"
        kduration = (kGrainDur)/kGrainRate 

        ; different pitch for each source waveform
        kTranspose chnget "FreqSlider"
        kRandPitch chnget "RandPitchSlider"
        kPitchDev randomh 0.0, kRandPitch, kGrainRate

        
        

        ;figure out why the pitch dev is not working
        ;add the pitchdev to the transpose value before converting?
        if kPitchDev > 0 then
            kWavFreq = semitone(kTranspose) + semitone(kPitchDev)
            printk2 kPitchDev, 4
            printk2 kWavFreq, 8
        else 
            kWavFreq = semitone(kTranspose)
        endif


        kfildur1 = tableng(giLiveFeed) / sr  
        kwavekey1 = 1/kfildur1 
        kwavekey2 = semitone(-5)/kfildur1 
        kwavekey3 = semitone(4)/kfildur1 
        kwavekey4 = semitone(9)/kfildur1 
        awavfm = 0  

        ; grain delay time, more random deviation
        ;delay time in seconds = samplepos * bufferlength
        ;samplepos = delaytimesec / bufferlength
        ksamplepos1 = 0
        kDelayTime chnget "DelaySlider"
        kDelayTimeSec = kDelayTime / 1000
        printk2 kDelayTimeSec
        kDelayTimeSec = kDelayTimeSec / giLiveFeedLenSec

        kSpray chnget "SpraySlider"
        kSpraySec = kSpray / 1000
        kSpraySec = kSpraySec / giLiveFeedLenSec

        kpos1Deviation randomh 0.0, kSpray, kGrainRate
        printk2 kpos1Deviation
        ksamplepos1 = ksamplepos1 + kDelayTimeSec + kpos1Deviation
        ; use different delay time for each source waveform
        ; (actually same audio, but read at different pitch)
        ksamplepos2 = ksamplepos1+0.05                       
        ksamplepos3 = ksamplepos1+0.1                       
        ksamplepos4 = ksamplepos1+0.2                       

        ; Avoid crossing the record boundary 
        #define RecordBound(N)#
        ksamplepos$N. limit ksamplepos$N., 
            (kduration*kWavFreq)/(giLiveFeedLenSec*1000),1
        ; make samplepos follow the record pointer 
        ksamplepos$N.  = 
            (gkstartFollow/giLiveFeedLen) - ksamplepos$N.
        asamplepos$N. UpsampPhasor ksamplepos$N.
        asamplepos$N. wrap asamplepos$N., 0, 1 
        #
        $RecordBound(1)
        $RecordBound(2)
        $RecordBound(3)
        $RecordBound(4)

        ; activate all 4 source waveforms
        iwaveamptab ftgentmp 0, 0, 32, -2, 0, 0, 1,0,0,0,0                   

        a1, a2  partikkel kGrainRate, 0, -1, async, 0, -1, 
        giSigmoRise, giSigmoFall, 0, 0.5, kduration, 0.5, -1, 
        kWavFreq, 0.5, -1, -1, awavfm, 
        -1, -1, giCosine, 1, 1, 1, 
        -1, 0, giLiveFeed, giLiveFeed, giLiveFeed, giLiveFeed, 
        iwaveamptab, asamplepos1, asamplepos2, 
        asamplepos3, asamplepos4, 
        kwavekey1, kwavekey2, kwavekey3, kwavekey4, 100

        ; audio feedback in granular processing 
        aFeed dcblock a1 
        chnset aFeed, "partikkelFeedback" 

        outs a1*ampdbfs(0), a1*ampdbfs(0)
        ;add sound to meter
        k1 rms a1, 20
        k2 rms a2, 20

        cabbageSetValue "vu1", portk(k1*100, .25), metro(10)
        cabbageSetValue "vu2", portk(k2*100, .25), metro(10)

    endin
;******************************************************

    instr Control
        ;things to control UI and stuff

        kToggleValue cabbageGet "ConsoleToggle", "value"

        printk2 kToggleValue

        if kToggleValue == 1 then
            cabbageSet 1, "Console", "visible", 1
        else
            cabbageSet 1, "Console", "visible", 0
        endif
    endin 

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
i1 0 86400 ; record live input 
i2 0 86400 ; granular reverb
i "Control" 0 865000
</CsScore>
</CsoundSynthesizer>
