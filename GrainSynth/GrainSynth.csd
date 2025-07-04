<Cabbage>  bounds(0, 0, 0, 0)
form caption("Grain Synth") size(900, 675), guiMode("queue") pluginId("plan") colour("beige") textColour("black") fontColour("black") typeface("sanangel.otf")

#define DESIGN colour(228, 193, 249) trackerColour(58, 124, 165) fontSize(1)

#define SLIDER valueTextBox(1) trackerInsideRadius(0.75)

#define FONT fontColour(58, 124, 165) textColour(58, 124, 165)

#define BOXCOL colour(195, 148, 202, 255)

#define BGX 280

#define BGY 250 
	
#define PADDINGX 10 

#define PADDINGY 38 

;on either side

;label bounds(0, 37, 900, 600) channel("label10009") colour(223, 181, 248, 255) alpha(0.8) text("")



;csoundoutput bounds(8, 450, 399, 217) channel("csoundoutput10010"), fontColour("white")

combobox bounds($PADDINGX, 0, 80, 40), mode("resize"), value(3) automatable(0) channel("PluginResizerCombBox") $DESIGN $FONT



;- Region: GRAIN RATE
groupbox bounds($PADDINGX, $PADDINGY, $BGX, $BGY) channel("groupbox10010") outlineThickness(0) $BOXCOL   {
label bounds(98, 0, 142, 25) channel("label10001") text("Grain rate") $FONT fontSize(16) align("left")
rslider bounds(0, 125, 100, 100) channel("GrainRateSlider") range(0, 100, 0, 1, 1)  $DESIGN $FONT valueTextBox(1) alpha(0.84) trackerInsideRadius(0.75) popupText("Grain Rate Slider")
xypad bounds(98, 25, 180, 180) channel("GrainRateAmp", "GrainRateFreq") $DESIGN $FONT fontSize(1) ballColour(161, 74, 118, 255) rangeX(0.0, 1.0, 0) rangeY(0.0, 50.0, 0)


label bounds(104, 225, 80, 16) channel("label10002") text("Amp") $FONT 
label bounds(204, 225, 80, 16) channel("label10003") text("Freq") $FONT

button bounds(0, 0, 30, 24) channel("GrainRateToggle") fontColour:0(0, 0, 0, 255) fontSize(1) colour:0(152, 114, 114, 255) colour:1(109, 3, 173, 255) text("off", "on")
}

;- Region: Duration
groupbox bounds(310, $PADDINGY, $BGX, $BGY) channel("groupbox10011") outlineThickness(0) $BOXCOL   
{

label bounds(98, 0, 142, 25) channel("label10002") text("Duration") $FONT fontSize(16) align("left")

rslider bounds(0, 125, 100, 100) channel("DurSlider") range(20, 5000, 0, 1, 1)  $DESIGN $FONT valueTextBox(1) alpha(0.84) trackerInsideRadius(0.75)

xypad bounds(98, 25, 180, 180) channel("DurAmp", "DurFreq") $DESIGN fontSize(1) ballColour(161, 74, 118, 255) trackerColour(58, 124, 165, 255) rangeX(0.0, 1.0, 0) rangeY(0.0, 50.0, 0)


label bounds(108, 225, 80, 16) channel("label10003") text("Amp") $FONT
label bounds(208, 225, 80, 16) channel("label10004") text("Freq") $FONT 

button bounds(0, 0, 30, 24) channel("button10015") fontColour:0(0, 0, 0, 255) fontSize(1) colour:0(152, 114, 114, 255) colour:1(109, 3, 173, 255) text("off", "on")
}

;- Region: Freq
groupbox bounds(610, $PADDINGY, $BGX, $BGY) channel("groupbox10012") outlineThickness(0) $BOXCOL   {

label bounds(98, 0, 142, 25) channel("label10003") text("Frequency") $FONT  fontSize(16) align("left")

rslider bounds(0, 125, 100, 100) channel("FreqSlider") range(0.0, 10.0, 0, 1, 0.1)  $DESIGN $FONT valueTextBox(1) alpha(0.84) trackerInsideRadius(0.75)

xypad bounds(98, 25, 180, 180) channel("FreqAmp", "FreqFreq") ballColour(161, 74, 118, 255) rangeX(0.0, 1.0, 0) rangeY(0.0, 50.0, 0) $DESIGN 


label bounds(108, 225, 80, 16) channel("label10005") text("Amp") $FONT
label bounds(208, 225, 80, 16) channel("label10006") text("Freq") $FONT

button bounds(0, 0, 30, 24) channel("button10016") fontColour:0(0, 0, 0, 255) fontSize(1) colour:0(152, 114, 114, 255) colour:1(109, 3, 173, 255) text("off", "on")
}

;- Region: FM
;FM pitch
;FM index
;randomness
groupbox bounds(10, 298, $BGX, $BGY) channel("groupbox10013") outlineThickness(0) $BOXCOL   {

label bounds(98, 0, 142, 25) channel("label1007") text("FM") $FONT fontSize(16) align("left")

rslider bounds(0, 25, 100, 100) channel("FmPitchSlider") range(0, 10, 0, 1, 0.1)  $DESIGN $FONT valueTextBox(1) alpha(0.84) trackerInsideRadius(0.75)

rslider bounds(0, 125, 100, 100) channel("FmIndexSlider") range(0, 20, 0, 1, 0.1)  $DESIGN $FONT valueTextBox(1) alpha(0.84) trackerInsideRadius(0.75)

xypad bounds(98, 25, 180, 180) channel("FmAmp", "FmFreq") $DESIGN $FONT fontSize(1) ballColour(161, 74, 118, 255) rangeX(0.0, 1.0, 0) rangeY(0.0, 50.0, 0)

label bounds(108, 225, 80, 16) channel("label10008") text("Amp") $FONT 
label bounds(208, 225, 80, 16) channel("label10009") text("Freq") $FONT

button bounds(0, 0, 30, 24) channel("button10017") fontColour:0(0, 0, 0, 255) fontSize(1) colour:0(152, 114, 114, 255) colour:1(109, 3, 173, 255) text("off", "on")
}

;- Region: misc parameters
;ad ratio
;random mask
;channel mask
;waveamptamp to do a sort of morphing thing between sines and samples
;distribution
;envelope
groupbox bounds(310, 298, 580, 250) channel("groupbox10014") outlineThickness(0) $BOXCOL  {

	hslider bounds(0, 0, 115, 50) channel("EnvSlider") range(0, 1, 0, 1, 0.001) text("ad ratio") $DESIGN $FONT
	hslider bounds(0, 50, 115, 50) channel("Distribution") range(0, 1, 0, 1, 0.001) text("distribution") $DESIGN $FONT
	hslider bounds(0, 100, 115, 50) channel("RndMaskSlider") range(0, 1, 0, 1, 0.001) text("rndmask") $DESIGN $FONT
	button bounds(0, 150, 115, 50) channel("WaveformToggle") fontColour:0(0, 0, 0, 255) colour:0(152, 114, 114, 255) colour:1(109, 3, 173, 255) text("sine", "sample") value(0)

	button bounds(0, 200, 115, 50) channel("StartRecordButton") fontColour:0(0, 0, 0, 255) fontSize(1) colour:0(152, 114, 114, 255) colour:1(109, 3, 173, 255) text("off", "Recording") value(0)

	vmeter bounds(500, 70, 36, 180) channel("vu1") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
	vmeter bounds(540, 70, 36, 180) channel("vu2") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1)

}


;label bounds(100, 64, 100, 16) channel("label10016") text("ad ratio") $FONT fontColour(58, 124, 165, 255) textColour(58, 124, 165, 255)
;label bounds(100, 80, 100, 16) channel("label10016") text("chanmasking") $FONT
;label bounds(100, 96, 100, 16) channel("label10016") text("distribution") $FONT
;label bounds(100, 112, 100, 16) channel("label10016") text("envelope") $FONT
;label bounds(100, 128, 100, 16) channel("label10016") text("grain masking") $FONT
;label bounds(100, 144, 100, 16) channel("label10015") text("waveamptab") $FONT fontColour(58, 124, 165, 255) textColour(58, 124, 165, 255)



;MISC sliders

button bounds(875, 650, 25, 25) channel("ConsoleToggle") colour:0(238, 185, 185, 255) colour:1(2, 255, 69, 255) text("") latched(0)

groupbox bounds(0, 0, 430, 360), text("Debug window"), plant("debug"), popup(1), channel("debug"), colour("beige"), visible(1) {

	csoundoutput bounds(0, 180, 430, 180) channel("Console") visible(1)
}

</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-m0 -n -d 
</CsOptions>
<CsInstruments>
	
	sr = 48000
	ksmps   = 10
	nchnls   = 2
	0dbfs  = 1

;***************************************************
;ftables
giSine	ftgen	0, 0, 65536, 10, 1			; sine wave
gifftsize 	= 1024
chnset gifftsize, "fftsize"
giFftTabSize	= (gifftsize / 2)+1
gifna     	ftgen   1 ,0 ,giFftTabSize, 7, 0, giFftTabSize, 0   	; for pvs analysis
gifnf     	ftgen   2 ,0 ,giFftTabSize, 7, 0, giFftTabSize, 0   	; for pvs analysis
giSinEnv        ftgen   0, 0, 8192, 19, 1, 0.5, 270, 0.5        ; sinoid transient envelope shape for 

;soundfiles
giSoundfile1	ftgen	0, 0, 0, 1, "noise.wav", 0, 0, 0			; soundfile
giSoundfile2	ftgen	0, 0, 0, 1, "noise.wav", 0, 0, 0
giSoundfile3	ftgen	0, 0, 0, 1, "noise.wav", 0, 0, 0
giSoundfile4	ftgen	0, 0, 0, 1, "noise.wav", 0, 0, 0

; live input buffer table for granular effects processing
 giLiveFeedLen = 524288
 giLiveFeedLenSec = giLiveFeedLen/sr
 giLiveFeed ftgen 0, 0, giLiveFeedLen+1, 2, 0 ; create empty buffer for live input


; classic waveforms
giSine		ftgen	0, 0, 65537, 10, 1					; sine wave
giCosine	ftgen	0, 0, 8193, 9, 1, 1, 90					; cosine wave
giTri		ftgen	0, 0, 8193, 7, 0, 2048, 1, 4096, -1, 2048, 0		; triangle wave 

; grain envelope tables
giSigmoRise 	ftgen	0, 0, 8193, 19, 0.5, 1, 270, 1				; rising sigmoid
giSigmoFall 	ftgen	0, 0, 8193, 19, 0.5, 1, 90, 1				; falling sigmoid
giExpFall	ftgen	0, 0, 8193, 5, 1, 8193, 0.00001				; exponential decay
giTriangleWin 	ftgen	0, 0, 8193, 7, 0, 4096, 1, 4096, 0			; triangular window 

;OSC 
giOscHandler OSCinit 999 ;input from external device

;random distribution around a center  value (mean) with an amplitude, which is how
;wide the distribution is basically
;frequency is how often it changes
;xamp scales the output
;the mean needs to be added to the result to make it positive. The mean for now 
; is the same as the range. 

opcode RandomGaus, k, kkkk
	kRange, kRandAmp, kRandFreq, kMean xin
	kRandOut gaussi kRange, kRandAmp, kRandFreq
	kRandOut += kMean
	xout kRandOut
endop

;beta randomness
;kRand betarand krange, kalpha, kbeta

instr Debugger

		kToggleValue cabbageGet "ConsoleToggle", "value"

		if changed:k(kToggleValue) == 1 then
			cabbageSet 1, "debug", "visible", 1
		endif
	endin



instr Control
	;things to control UI and stuff



	;if button is pressed
	; turn on record input instrument for x amount of time starting now
	;x equals buffer length in seconds
	;giLiveFeedLenSec = giLiveFeedLen/sr

	;when recording is done, set button value to 0 again

	; kRecordButton cabbageGet "StartRecordButton", "value"
	; printk2 kRecordButton

	; kSwitch changed kRecordButton
	; if kSwitch == 1 then
	; 	if kRecordButton == 1 then
	; 		event "i", "RecordInput", 0, giLiveFeedLenSec
	; 	endif
	; endif

	kPlay chnget "StartRecordButton"

	kTrigPlay trigger kPlay, 0.5, 0

	kTrigStop trigger kPlay, 0.5, 1

	iRecordInstrument = 1

	if kTrigPlay > 0 then

		event "i", iRecordInstrument, 0, -1

	endif

	if kTrigStop > 0 then

		event "i", -iRecordInstrument, 0, .1

	endif
endin 

instr Receiver
	
	;GRAIN RATE	
	kGrainRate init 0
	kInputCheck1 OSClisten giOscHandler, "GrainRateOut", "f", kGrainRate
	kGrainRateScaled scale2 kGrainRate, 1, 100, 0.0, 1.0
	chnset kGrainRateScaled, "OSCGrainRate"
	; kGrainRateAmp chnget "GrainRateAmp"
	; kGrainRateFreq chnget "GrainRateFreq"

	; ;DURATION______________________________________________________

	kDur init 0
	kInputCheck2 OSClisten giOscHandler, "DurationOut", "f", kDur
	kDurScaled scale2 kDur, 20, 5000, 0.0, 1.0
	chnset kDurScaled, "OSCDur"

	; ;FREQUENCY_____________________________________________________

	kFreq init 0
	kInputCheck3 OSClisten giOscHandler, "FreqOut", "f", kFreq
	kFreqScaled scale2 kFreq, 0, 10, 0.0, 1.0
	chnset kFreqScaled, "OSCFreq"

	;FM modulation____________________________________________________
	; kFmPitchSlider chnget "FmPitch"
	; kFmIndexSlider chnget "FmIndex"
	kFmPitch init 0
	kInputCheck4 OSClisten giOscHandler, "FmPitchOut", "f", kFmPitch
	kFmPitchScaled scale2 kFmPitch, 0, 10, 0.0, 1.0
	chnset kFmPitchScaled, "OSCFmPitch"



	kFmIndex init 0
	kInputCheck4 OSClisten giOscHandler, "FmIndexOut", "f", kFmIndex
	kFmIndexScaled scale2 kFmIndex, 0, 20, 0.0, 1.0
	chnset kFmIndexScaled, "OSCFmIndex"


	kEnv init 0
	kInputCheck5 OSClisten giOscHandler, "EnvOut", "f", kEnv
	kEnvScaled scale2 kEnv, 0.0, 1.0, 0.0, 1.0
	chnset kEnvScaled, "OSCEnv"



	kRndMask init 0
	kInputCheck6 OSClisten giOscHandler, "RndMaskOut", "f", kRndMask
	chnset kRndMask, "OSCRndMask"
	
endin	

instr MixChannels

	kOutGrainRate init 1
	kOscGrainRate chnget "OSCGrainRate"
	kSliderGrainRate chnget "GrainRateSlider"
	kOutGrainRate = kOscGrainRate + kSliderGrainRate
	kOutGrainRate limit kOutGrainRate, 1, 100
	chnset kOutGrainRate, "GrainRate"

	kOutDur init 20
	kOscDur init 0
	kOscDur chnget "OSCDur"
	kSliderDur chnget "DurSlider"
	kOutDur = kOscDur + kSliderDur
	chnset kOutDur, "Dur"

	kOutFreq init 1
	kOscFreq chnget "OSCFreq"
	kSliderFreq chnget "FreqSlider"
	kOutFreq = kOscFreq + kSliderFreq
	kOutFreq limit kOutFreq, 1, 400
	chnset kOutFreq, "Freq"

	kOutFmPitch init 0
	kOscFmPitch chnget "OSCFmPitch"
	kSliderFmPitch chnget "FmPitchSlider"
	kOutFmPitch = kOscFmPitch + kSliderFmPitch
	kOutFmPitch limit kOutFmPitch, 0, 10
	chnset kOutFmPitch, "FmPitch"

	kOutFmIndex init 0
	kOscFmIndex chnget "OSCFmIndex"
	kSliderFmIndex chnget "FmIndexSlider"
	kOutFmIndex = kOscFmIndex + kSliderFmIndex
	kOutFmIndex limit kOutFmIndex, 0, 20
	chnset kOutFmIndex, "FmIndex"

	kOutEnv init 0
	kOscEnv chnget "OSCEnv"
	kSliderEnv chnget "EnvSlider"
	kOutEnv = kOscEnv + kSliderEnv
	kOutEnv limit kOutEnv, 0.0, 1.0
	chnset kOutEnv, "Envelope"

	kOutRndMask init 0
	kOscRndMask chnget "OSCRndMask"
	kSliderRndMask chnget "RndMaskSlider"
	kOutRndMask = kOscRndMask + kSliderRndMask
	kOutRndMask limit kOutRndMask, 0.0, 1.0
	chnset kOutRndMask, "RndMask"

	printks2 "Grain Rate: %f\n", kOutGrainRate
	printks2 "Duration: %f\n", kOutDur
	printks2 "Frequency: %f\n", kOutFreq
	printks2 "FM Pitch: %f\n", kOutFmPitch
	printks2 "FM Index: %f\n", kOutFmIndex
	printks2 "Envelope: %f\n", kOutEnv
	printks2 "Random Mask: %f\n", kOutRndMask
endin

instr 1
	prints "Recording started"

	aInput inch 1 ; signal input

	; aFeed chnget "partikkelFeedback" ; feedback from partikkel audio output
	; aInput = aInput + aFeed ; mix feedback with live input

	; write audio to table
	iAudioTable = giLiveFeed
	iLength = ftlen(iAudioTable)
	aenv linsegr 0, 0.1, 1, giLiveFeedLenSec - 0.2, 1, 0.1, 0
	aInput *= aenv
	gkstartFollow init 0
	gkstartFollow tablewa iAudioTable, aInput, 0 ; write audio aInput to table
	gkstartFollow = (gkstartFollow > (giLiveFeedLen-1) ? 0 : gkstartFollow) ; reset kstart when table is full
	tablegpw iAudioTable ; update table guard point (for interpolation)
	chnset gkstartFollow, "kstartFollow" ; output the buffer position to chn

endin

instr GrainSynth 
	kWaveformToggle cabbageGet "WaveformToggle", "value"

	printk2 kWaveformToggle

	; if kWaveformToggle == 1 then
		
	; else
		
	; endif
	;______PROCESS SLIDERS______

	;GRAIN RATE
	kGrainRateSlider chnget "GrainRate"
	kGrainRateAmp chnget "GrainRateAmp"
	kGrainRateFreq chnget "GrainRateFreq"

	;if on button == on then
	kGrainRate RandomGaus kGrainRateSlider, kGrainRateAmp, kGrainRateFreq, kGrainRateSlider
	kGrainRate round kGrainRate

	;else****************************
	
	aGrainRate interp kGrainRate

	;______________________________________________________________

	;DURATION______________________________________________________
	kDurSlider chnget "Dur"
	kDurAmp chnget "DurAmp"
	kDurFreq chnget "DurFreq"

	;if on button == on then                                                             
	kGrainDur RandomGaus kDurSlider, kDurAmp, kDurFreq, kDurSlider
	kDuration = (kGrainDur)/kGrainRate	; grain dur in milliseconds, relative to grain rate

	;______________________________________________________________


	;FREQUENCY_____________________________________________________
	kWavFreq init 1
	kFreqSlider chnget "Freq"
	kFreqAmp chnget "FreqAmp"
	kFreqFreq chnget "FreqFreq" ;this is kinda dirty, oh well

	
	; kWavFreq init 1

	;if on button == on then this
	;kWavFreq RandomGaus kFreqSlider, kFreqAmp, kFreqFreq, kFreqSlider

	;else
	kWavFreq = kFreqSlider

	;_________________________________________________________________

	;FM pitch
	;FM index
	;randomness
	
	;FM modulation____________________________________________________
	kFmPitchSlider chnget "FmPitch"
	kFmIndexSlider chnget "FmIndex"
	kFmAmpSlider chnget "FmAmp"
	kFmFreqSlider chnget "FmFreq"


	; FM of grain pitch (playback speed)
	kFmPitchSlider RandomGaus kFmPitchSlider, kFmAmpSlider, kFmFreqSlider, kFmPitchSlider
	kPitchFmFreq = kWavFreq * kFmPitchSlider				; FM freq, modulating waveform pitch

	kPitchFmIndex = kFmIndexSlider
	


	;_________________________________________________________________


	;printing

	; amp
	kamp = ampdbfs(-10)
	; select source waveforms
	; single cycle waveforms
	; kwaveform1 = giSine		; source audio waveform 1
	; kwave1Single	= 1			; flag to set if waveform is single cycle (set to zero for sampled waveforms)
	; kwaveform2	= giSine		; source audio waveform 2
	; kwave2Single	= 1		; flag to set if waveform is single cycle (set to zero for sampled waveforms)
	; kwaveform3	= giSine  ; source audio waveform 3
	; kwave3Single	= 1		; flag to set if waveform is single cycle (set to zero for sampled waveforms)
	; kwaveform4	= giSine	; source audio waveform 4
	; kwave4Single	= 1		; flag to set if waveform is single cycle (set to zero for sampled waveforms)

	; ; ; select source waveforms
	; kwaveform1 = giSoundfile1		; source audio waveform 1
	; kwave1Single	= 0			; flag to set if waveform is single cycle (set to zero for sampled waveforms)
	; kwaveform2	= giSoundfile2		; source audio waveform 2
	; kwave2Single	= 0		; flag to set if waveform is single cycle (set to zero for sampled waveforms)
	; kwaveform3	= giSoundfile3  ; source audio waveform 3
	; kwave3Single	= 0		; flag to set if waveform is single cycle (set to zero for sampled waveforms)
	; kwaveform4	= giSoundfile4	; source audio waveform 4
	; kwave4Single	= 0		; flag to set if waveform is single cycle (set to zero for sampled waveforms)



	; ;LIVE INPUT

	; kwaveform1	= giLiveFeed		; source audio waveform 1
	; kwave1Single	= 0
	; kwaveform2	= giLiveFeed		; source audio waveform 2
	; kwave2Single	= 0
	; kwaveform3	= giLiveFeed		; source audio waveform 3
	; kwave3Single	= 0
	; kwaveform4	= giLiveFeed		; source audio waveform 4
	; kwave4Single	= 0


	;soundfile
	kwaveform1	= giSoundfile1		; source audio waveform 1
	kwave1Single	= 0 ; flag to set if waveform is single cycle (set to zero for sampled waveforms)
	kwaveform2	= giSoundfile1		; source audio waveform 2
	kwave2Single	= 0
	kwaveform3	= giSoundfile1		; source audio waveform 3
	kwave3Single	= 0
	kwaveform4	= giSoundfile1		; source audio waveform 4
	kwave4Single	= 0

	; get source waveform length (used when calculating transposition and time pointer)
	kfilen1		tableng	 kwaveform1		; get length of the first source waveform
	kfilen2		tableng	 kwaveform2		; same as above, for source waveform 2
	kfilen3		tableng	 kwaveform3		; same as above, for source waveform 3
	kfilen4		tableng	 kwaveform4		; same as above, for source waveform 4
	kfildur1	= kfilen1 / sr			; length in seconds, for the first source waveform
	kfildur2	= kfilen2 / sr			; same as above, for source waveform 2
	kfildur3	= kfilen3 / sr			; same as above, for source waveform 3
	kfildur4	= kfilen4 / sr			; same as above, for source waveform 4

	; original pitch for each waveform, use if they should be transposed individually
	; can also be used as a "cycles per second" parameter for single cycle waveforms (assuming that the kWavFreq parameter has a value of 1.0)
	kwavekey1	= 1
	kwavekey2	= 1
	kwavekey3	= 1
	kwavekey4	= 1

	; set original key dependant on waveform length (only for sampled waveforms, not for single cycle waves)
	kwavekey1	= (kwave1Single > 0 ? kwavekey1 : kwavekey1/kfildur1)
	kwavekey2	= (kwave2Single > 0 ? kwavekey2 : kwavekey2/kfildur2)
	kwavekey3	= (kwave3Single > 0 ? kwavekey3 : kwavekey3/kfildur3)
	kwavekey4	= (kwave4Single > 0 ? kwavekey4 : kwavekey4/kfildur4)

	; time pointer (phase). This can be independent for each source waveform.
	isamplepos1	= 0				; initial phase for wave source 1
	isamplepos2	= 0			; initial phase for wave source 2
	isamplepos3	= 0		; initial phase for wave source 3
	isamplepos4	= 0		; initial phase for wave source 4

	kTimeRate = 1 				; time pointer rate
	asamplepos1	phasor kTimeRate / kfildur1	; phasor from 0 to 1, scaled to the length of the first source waveform
	asamplepos2	phasor kTimeRate / kfildur2	; same as above, scaled for source wave 2
	asamplepos3	phasor kTimeRate / kfildur3	; same as above, scaled for source wave 3
	asamplepos4	phasor kTimeRate / kfildur4	; same as above, scaled for source wave 4

	; mix initial phase and moving phase value (moving phase only for sampled waveforms, single cycle waveforms use static samplepos)
	asamplepos1	= asamplepos1*(1-kwave1Single) + isamplepos1
	asamplepos2	= asamplepos2*(1-kwave2Single) + isamplepos2
	asamplepos3	= asamplepos3*(1-kwave3Single) + isamplepos3
	asamplepos4	= asamplepos4*(1-kwave4Single) + isamplepos4

	; if samplepos is close to zero, see to it that grain playback does not cross the record pointer border,
	; as this will delay the (live feed) sound for the length of a livefeed sample buffer.
	; So, check grain duration and transpose, limit samplepos accordingly
	ksamplepos1 init 0
	ksamplepos1 limit ksamplepos1, (kDuration*kWavFreq)/(giLiveFeedLenSec*1000), 1

	; make samplepos follow the record pointer instead of staying at a stationary value, makes live follow samplepos into "grain delay time"
	kstartFollow chnget "kstartFollow" ; the current buffer write position for live follow mode
	ksamplepos1 = (kstartFollow/giLiveFeedLen) - ksamplepos1 ; move samplepos in parallel with the write pointer for the input buffer
	ksamplepos1 = (ksamplepos1 < 0 ? ksamplepos1+1 : ksamplepos1) ; wrap around on undershoot
	ksamplepos1 = (ksamplepos1 > 1 ? ksamplepos1-1 : ksamplepos1) ; wrap around on overshoot
	asamplepos1 upsamp ksamplepos1 ; upsample


	; grain shape
	kAdSlider chnget "Envelope"
	ka_d_ratio = kAdSlider
	ksustain_amount	= 0	 ; balance between enveloped time(attack+decay) and sustain level time, 0.0 = no time at sustain level

	; masking
	igainmasks = -1 ;ftgentmp	0, 0, 16, -2, 0.1, 0.1, 0.1, 0.1
	ichannelmasks	ftgentmp	0, 0, 16, -2,  0, 0,  0.5

	kRndMaskSlider chnget "RndMask"
	krandommask = kRndMaskSlider


    ;modulation of waveform amplitude
	/*kwgain1 limit ((1-kWaveX)*(1-kWaveY)), 0, 1
    kwgain2 limit (kWaveX*(1-kWaveY)), 0, 1
    kwgain3 limit ((1-kWaveX)*kWaveY), 0, 1
    kwgain4 limit (kWaveX*kWaveY), 0, 1
    tablew kwgain1, 2, iwaveamptab
    tablew kwgain2, 3, iwaveamptab
    tablew kwgain3, 5, iwaveamptab
    tablew kwgain4, 4, iwaveamptab */

	iwaveamptab ftgentmp 0, 0, 32, -2, 		0, 1, 	1, 0, 0, 0, 0

	;kdistribution chnget "Distribution"
	kdistribution = 0
	idisttab ftgen 0, 0, 32768, 7, 0, 32768, 1 


	; other parameters that we do not yet need to touch
	ienv_attack = giSigmoRise ; grain attack shape (from table)
	ienv_decay = giSigmoFall ; grain decay shape (from table)
	async 		= 0.0	; external sync signal, can be used to trigger single grains or offset the internal clock
	kenv2amt = -1 ; secondary grain envelope (amount)
	ienv2tab = -1 ; secondary grain envelope shape
	ksweepshape = 0 ; pitch sweep shape for each grain
	iwavfreqstarttab = -1 ; table for pitch sweep start points
	iwavfreqendtab = -1 ; table for pitch sweep end points


	iPitchFmWave	= giSine						; FM waveform, modulating waveform pitch
	ifmamptab	ftgentmp	0, 0, 16, -2, 0, 0,   1			; FM index scalers, per grain
	ifmenv		= giTriangleWin 					; FM index envelope, over each grain (from table)
	kPitchFmIndex	= kPitchFmIndex + (kPitchFmIndex*kPitchFmFreq*0.00001) 	; FM index scaling formula
	awavfm	oscil	kPitchFmIndex, kPitchFmFreq, iPitchFmWave		; Modulator signal for frequency 

	
	ktraincps = 0 ; trainlet cps
	knumpartials = 0 ; number of partials in trainlet
	kchroma = 0 ; chroma of trainlet
	imax_grains = 100 ; max grains in one k-period (set and forget)

	a1,a2 partikkel aGrainRate, kdistribution, idisttab, async, kenv2amt, ienv2tab, \
		ienv_attack, ienv_decay, ksustain_amount, ka_d_ratio, kDuration, kamp, igainmasks, \
		kWavFreq, ksweepshape, iwavfreqstarttab, iwavfreqendtab, awavfm, \
		ifmamptab, ifmenv, giCosine, ktraincps, knumpartials, kchroma, \
		ichannelmasks, krandommask,  kwaveform1, kwaveform2, kwaveform3, kwaveform4, \
		iwaveamptab, asamplepos1, asamplepos2, asamplepos3, asamplepos4, \
		kwavekey1, kwavekey2, kwavekey3, kwavekey4, imax_grains 

	a1 limit a1, -1, 1
	a2 limit a2, -1, 1
	outs a1, a2

	;add sound to meter
	k1 rms a1, 20
	k2 rms a2, 20

	cabbageSetValue "vu1", portk(k1*100, .25), metro(10)
	cabbageSetValue "vu2", portk(k2*100, .25), metro(10)
endin



</CsInstruments>
<CsScore>
f0 z
i "Debugger" 0 865000
i "Receiver" 0 865000
i "MixChannels" 0 865000
i "GrainSynth" 0 865000
i "Control" 0 865000
</CsScore>
</CsoundSynthesizer>