<Cabbage> bounds(0, 0, 0, 0)
form caption("ModMatrix") size(960, 720), guiMode("queue"), pluginId("plan"), colour("beige"), textColour("black"), fontColour("black"), typeface("sanangel.otf")

;combobox bounds(0, 0, 80, 20), mode("resize"), value(3)

label bounds(2, 681, 651, 35) channel("label1"), align("left"), fontColour(0, 0, 0, 255) text("Most recently changed widget:")



;image bounds(138, 106, 960, 694) channel("image10000") file("matrix.png")


csoundoutput bounds(559, 627, 401, 93) channel("Console") visible(0)


button bounds(934, 694, 25, 26) channel("ConsoleToggle") colour:0(238, 185, 185, 255) colour:1(2, 255, 69, 255) text("")
</Cabbage>

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
	giMaxNumParam	= 10
	giMaxNumMod	= 7
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
	giOscHandler OSCinit 9993

	instr UserInterface
 
		; iWidth chnget "SCREEN_WIDTH"
		; iHeight chnget "SCREEN_HEIGHT"
		; iTableX = 8 ;the amount of cells in the excel sheet
		; iTableY = 8
		; iGridWidth = 0.8 * iWidth / iTableX
		; iGridHeight = 0.8 * iHeight / iTableY
		; iXPadding = (iWidth - 8 * iGridWidth) / 2
		; iYPadding = (iHeight - 8 * iGridHeight) / 2
		; iX, iY init 0
		; iWidgetCount init 0
		; while iY < 8 do
		; 	while iX < 8 do
		; 		SWidget sprintf "bounds(%d, %d, %d, %d), channel(\"rslider%d\"), range(0, 1, 0, 1, 0.001), text(\"slider %d\"), markerColour(0, 0, 0, 255) outlineColour(255, 255, 255, 255)  trackerColour(120, 0, 255, 255) colour(249, 179, 255, 255) textColour(0, 0, 0, 255) trackerThickness(1)", iXPadding + iX * iGridWidth, iYPadding + iY * iGridHeight, iGridWidth, iGridHeight, iWidgetCount, iWidgetCount
		; 		cabbageCreate "rslider", SWidget
		; 		iWidgetCount += 1
		; 		iX += 1
		; 	od
		; 	iX = 0
		; 	iY += 1
		; od

		#include "cabbage_ui.inc"

		


	endin
	
	instr Control

		kToggleValue cabbageGet "ConsoleToggle", "value"

		printk2 kToggleValue

		if kToggleValue == 1 then
			cabbageSet 1, "Console", "visible", 1
		else
			cabbageSet 1, "Console", "visible", 0
		endif
	endin 

	instr Receiver
		prints "osc receiver initiliased"
		
		#include "receiver.inc"

		
	endin

	instr ModMatrix

		prints "ModMatrix initialised"

		#include "output.inc"
		
		

		; This opcode takes an array of channel names and listens for a change. It reports a trigger value along with the name or index of the channel that changed. 
		;SChannel, kTrig cabbageChanged SChannels[], [kThreshold, [kMode]]
		;this version will return the name of the channel

		SCoeffs[] cabbageGetWidgetChannels "_type(\"coeff\")"

		kIndex init 0

		kIndex, kTrig cabbageChanged SCoeffs

		SUpdatedChannel, kTrig cabbageChanged SCoeffs

		if kTrig == 1 then 
			kValue cabbageGetValue SUpdatedChannel
			tablew kValue, kIndex, giModScale
			ftprint giModScale, -1
		endif

		cabbageSet kTrig, "label1", sprintfk("text(\"Last updated widget: %s - Index:%d\")", SUpdatedChannel, kIndex)

		
	
	endin

instr Processing
	prints "\n Processing initialised"

	;parameters get read from modmatrix output table
	kFreq chnget "Freq"

	kCutoff chnget "Cutoff"
	

	aSignal vco2 0.1, kFreq

	aSignal tone aSignal, 200 - kCutoff

	outs aSignal, aSignal

endin




instr sound_file

	kMixX table 0, giParam_Out
	aCello diskin gSCello, 1, 0, 1
	aElect diskin gSElect, 1, 0, 1

	aOut = aCello * kMixX * 0.5 + aElect * (1 - kMixX) * 0.5

	outs aOut, aOut


endin

</CsInstruments>
<CsScore>

	f0 z
	i "UserInterface" 0 865000
	i "Control" 0 865000
	i "Receiver" 0 865000
	i "ModMatrix" 0 865000
	i "Processing" 0 865000
	;i "sound_file" 0 865000

</CsScore>
</CsoundSynthesizer>
