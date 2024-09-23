<CsoundSynthesizer>
<CsOptions>
-o dac 
-m0
;--output=OUT.wav
</CsOptions>
<CsInstruments>
	0dbfs = 1
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

	;soundfiles
	giCello	ftgen	0, 0, 0, 1, "cello.wav", 0, 0, 0			; soundfile
	giElect	ftgen	0, 0, 0, 1, "elect.wav", 0, 0, 0			; soundfile

	gSCello = "cello.wav"
	gSElect = "elect.wav"


	;OSC 
	giOscHandler OSCinit 9999

	instr Receiver
		prints "osc receiver initiliased"

		kMorphX init 0
		kMorphY init 0
		kExpression init 0


		; listen to osc ports
		kAnswerXY OSClisten giOscHandler, "/xy1", "ff", kMorphX, kMorphY
		kAnswerFader OSClisten giOscHandler, "/fader1", "f", kExpression

		if kAnswerFader == 1 then
			chnset kExpression, "Expression"
			;printk2 kExpression
		endif

		if kAnswerXY == 1 then
			chnset kMorphX, "InputX"
			chnset kMorphY, "InputY"

			;printk2 kMorphX
			;printk2 kMorphY
		endif

		chnset kMorphX, "MorphX"
		chnset kMorphY, "MorphY"
		chnset kExpression, "Expression"
	endin

	instr ModMatrix

		prints "ModMatrix initialised"

		#include "input.inc"


		; get the update flag
		kupdate	init 1 ;chnget	"modulatorUpdateFlag"		

		; run the mod matrix 
		;remember to update the number of paramas and modulators here otherwise the mapping gets fucked up
		;implement this part into excel too
		inum_mod = 4
		inum_param = 6
		modmatrix giParam_Out, giModulators, giParam_In, \
		giModScale, inum_mod, inum_param, kupdate

		#include "output.inc"

	endin

instr Processing
	prints "\n Processing initialised"

	;parameters get read from modmatrix output table
	kFreq chnget "Freq"

	kCutoff chnget "Cutoff"
	printk2 kFreq

	aSignal vco2 0.1, kFreq

	aSignal tone aSignal, 200 - kCutoff

	outs aSignal, aSignal

endin

instr sound_file

	kMixX table 0, giParam_Out
	printk2 kMixX
	aCello diskin gSCello, 1, 0, 1
	aElect diskin gSElect, 1, 0, 1

	aOut = aCello * kMixX * 0.5 + aElect * (1 - kMixX) * 0.5

	outs aOut, aOut


endin

</CsInstruments>
<CsScore>

	f0 z
	
	i "Receiver" 0 865000
	i "ModMatrix" 0 865000
	i "Processing" 0 865000
	;i "sound_file" 0 865000

</CsScore>
</CsoundSynthesizer>
