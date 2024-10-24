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
		
		#include "receiver.inc"

		
	endin

	instr ModMatrix

		prints "ModMatrix initialised"

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

	kMixX chnget "MixX"
	kMixY chnget "MixY"
	printk2 kMixX, 4
	printk2 kMixY, 8
	aCello diskin gSCello, 1, 0, 1
	aElect diskin gSElect, 1, 0, 1

	kTopLeft = (1 - kMixX) * (1 - kMixY)
	kTopRight = kMixX * (1 - kMixY)
	kBottomLeft = (1 - kMixX) * kMixY
	kBottomRight = kMixX * kMixY
	

	aOut = aCello * kBottomLeft + aElect * kBottomRight

	outs aOut, aOut


endin

</CsInstruments>
<CsScore>

	f0 z
	
	i "Receiver" 0 865000
	i "ModMatrix" 0 865000
	;i "Processing" 0 865000
	i "sound_file" 0 865000

</CsScore>
</CsoundSynthesizer>
