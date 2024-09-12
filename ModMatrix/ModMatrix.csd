<Cabbage> bounds(0, 0, 0, 0)
form size(1000, 600), caption("Untitled") size(900, 675), guiMode("queue") pluginId("sdfa") colour("beige") textColour("black") fontColour("black") typeface("sanangel.otf")
vslider bounds(312, 54, 288, 391) channel("slider1") range(0, 1, 0, 1, 0.001)
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-m0 -n -d 
;--output=OUT.wav
</CsOptions>
<CsInstruments>
	0dbfs = 0.01
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
	giModScale ftgen 0, 0, giMaxNumParam*giMaxNumMod, -2, 0	

	instr ModMatrix

		prints "ModMatrix initialised"

		;INPUT PARAMETERS

		icps1 = 100
		icps2 = 0.1
		icutoff = 1

		; write input parameters to table
		tableiw	icps1, 0, giParam_In
		tableiw icutoff, 1, giParam_In

		;_________________________________________________

		;SCALING TABLE______________________________________
		;read table from left to right top to bottom (see excel)

		;tableiw isig, indx, ifn
		tableiw	0, 0, giModScale ;expr to freq
		tableiw 200, 1, giModScale ;expr to cutoff
		tableiw 5, 2, giModScale ;expr to lfofreq
		tableiw	0, 3, giModScale ;lfo to freq
		tableiw 0, 4, giModScale ;lfo to cutoff
		tableiw	0, 5, giModScale ;lfo to lfofreq
		;___________________________________________________

		
		;MODULATORS_______________________________________
		;slider
		kExpression1 cabbageGetValue "slider1"
		;printk2 kExpression1

		; LFO1, 1.5 Hz, normalized range (0.0 to 1.0)
		kLFO1	oscil	0.5, 1.5, giSine		; generate LFO signal
		kLFO1	= kLFO1+0.5				; offset

		; write modulators to table
		tablew	kExpression1, 0, giModulators
		tablew	kLFO1, 1, giModulators

		;___________________________________________________

		; get the update flag
		kupdate	init 1 ;chnget	"modulatorUpdateFlag"		

		; run the mod matrix 
		inum_mod = 2
		inum_param = 2
		modmatrix giParam_Out, giModulators, giParam_In, \
		giModScale, inum_mod, inum_param, kupdate

	endin

instr Processing
	prints "\n Processing initialised"

	kFreq table	0, giParam_Out
	kCutoff table 1, giParam_Out
	printk2 kCutoff

	aSignal vco2 0.1, kFreq

	aSignal tone aSignal, kCutoff

	outs aSignal, aSignal

endin



</CsInstruments>
<CsScore>

	f0 z

	i "ModMatrix" 0 865000
	i "Processing" 0 865000

</CsScore>
</CsoundSynthesizer>
