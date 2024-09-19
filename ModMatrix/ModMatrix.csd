<CsoundSynthesizer>
<CsOptions>
-o dac 
-m0
;--output=OUT.wav
</CsOptions>
<CsInstruments>
	0dbfs = 30
	ksmps = 128
	nchnls = 2

	; basic waveforms
	giSine	ftgen	0, 0, 65537, 10, 1	; sine wave
	giSaw 	ftgen	0, 0, 4097, 7, 1, 4096, -1	; saw (linear)
	giSoftSaw ftgen	0, 0, 65537, 30, giSaw, 1, 10	; soft saw (only 10 first harmonics)

	; modmatrix tables
	giMaxNumParam	= 128
	giMaxNumMod	= 32
	giParam_In ftgen 0, 0, giMaxNumParam, 2, 0	; input parameters table
	giParam_Out ftgen 0, 0, giMaxNumParam, 2, 0	; output parameters table (parameter values with added modulators)
	giModulators ftgen 0, 0, giMaxNumMod, 2, 0	 ; modulators table
	; modulation scaling and routing (mod matrix) table, start with empty table
	giModScale ftgen 0, 0, giMaxNumParam*giMaxNumMod, -2, 0	;why is it genroutine -2?


	;OSC 
	giOscHandler OSCinit 9999

	instr Receiver
		kInputX init 0
		kInputY init 0
		kInputFader init 0

		; listen to osc ports
		kAnswerXY OSClisten giOscHandler, "/xy1", "ff", kInputX, kInputY
		kAnswerFader OSClisten giOscHandler, "/fader1", "f", kInputFader

		 if kAnswerFader == 1 then
		 	chnset kInputFader, "fader1"
		endif
	endin

	instr ModMatrix

		prints "ModMatrix initialised"

		;INPUT PARAMETERS
		;these are the parameters that go into the modmatrix and get modulated
		iMixX = 0
		iMixY = 0
		iFreq = 200
		iCutoff = 5000
		iLFOFreq = 0


		tableiw iMixX, 0, giParam_In
		tableiw iMixY, 1, giParam_In
		tableiw iFreq, 2, giParam_In
		tableiw iCutoff, 3, giParam_In
		tableiw iLFOFreq, 4, giParam_In


		tableiw 1, 0, giModScale ; MorphX to MixX
		tableiw 0, 1, giModScale ; MorphX to MixY
		tableiw 0, 2, giModScale ; MorphX to Freq
		tableiw 0, 3, giModScale ; MorphX to Cutoff
		tableiw 0, 4, giModScale ; MorphX to LFOFreq
		tableiw 0, 5, giModScale ; MorphY to MixX
		tableiw 1, 6, giModScale ; MorphY to MixY
		tableiw 0, 7, giModScale ; MorphY to Freq
		tableiw 0, 8, giModScale ; MorphY to Cutoff
		tableiw 0, 9, giModScale ; MorphY to LFOFreq
		tableiw 0, 10, giModScale ; Expression to MixX
		tableiw 0, 11, giModScale ; Expression to MixY
		tableiw 100, 12, giModScale ; Expression to Freq
		tableiw 500, 13, giModScale ; Expression to Cutoff
		tableiw 5, 14, giModScale ; Expression to LFOFreq
		tableiw 0, 15, giModScale ; LFO to MixX
		tableiw 0, 16, giModScale ; LFO to MixY
		tableiw 10, 17, giModScale ; LFO to Freq
		tableiw 50, 18, giModScale ; LFO to Cutoff
		tableiw 0, 19, giModScale ; LFO to LFOFreq


		kMorphX chnget "MorphX"
		kMorphY chnget "MorphY"
		kExpression chnget "Expression"
		kLFO chnget "LFO"


		tablew kMorphX, 0, giModulators
		tablew kMorphY, 1, giModulators
		tablew kExpression, 2, giModulators
		tablew kLFO, 3, giModulators

		;___________________________________________________

		; get the update flag
		kupdate	init 1 ;chnget	"modulatorUpdateFlag"		

		; run the mod matrix 
		inum_mod = 4
		inum_param = 5
		modmatrix giParam_Out, giModulators, giParam_In, \
		giModScale, inum_mod, inum_param, kupdate

	endin

instr Processing
	prints "\n Processing initialised"

	;parameters get read from modmatrix output table

	kMixX table 0, giParam_Out
	kMixY table 1, giParam_Out
	kFreq table 2, giParam_Out
	kCutoff table 3, giParam_Out
	kLFOFreq table 4, giParam_Out

	aSignal vco2 0.1, kFreq

	aSignal tone aSignal, 200 - kCutoff

	outs aSignal, aSignal

endin



</CsInstruments>
<CsScore>

	f0 z
	
	i "Receiver" 0 865000
	i "ModMatrix" 0 865000
	i "Processing" 0 865000

</CsScore>
</CsoundSynthesizer>
