<Cabbage> bounds(0, 0, 0, 0)
form caption("ModMatrix") size(960, 720), guiMode("queue"), pluginId("plan"), colour("beige"), textColour("black"), fontColour("black"), typeface("sanangel.otf")

;combobox bounds(0, 0, 80, 20), mode("resize"), value(3)

label bounds(2, 681, 651, 35) channel("label1"), align("left"), fontColour(0, 0, 0, 255) text("Most recently changed widget:")


<<<<<<< HEAD

;image bounds(138, 106, 960, 694) channel("image10000") file("matrix.png")
=======
rslider bounds(105.6, 14.4, 96.0, 82.28571428571429), channel("MixXIn"), range(0, 1, 0, 1, 0.001), text("MixXIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(201.6, 14.4, 96.0, 82.28571428571429), channel("MixYIn"), range(0, 1, 0, 1, 0.001), text("MixYIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(297.6, 14.4, 96.0, 82.28571428571429), channel("DelayIn"), range(0, 1, 0, 1, 0.001), text("DelayIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(393.6, 14.4, 96.0, 82.28571428571429), channel("LPFIn"), range(0, 1, 0, 1, 0.001), text("LPFIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(489.6, 14.4, 96.0, 82.28571428571429), channel("SendAmountIn"), range(0, 1, 0, 1, 0.001), text("SendAmountIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(585.6, 14.4, 96.0, 82.28571428571429), channel("DistortAmountIn"), range(0, 1, 0, 1, 0.001), text("DistortAmountIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(681.6, 14.4, 96.0, 82.28571428571429), channel("ShapeIn"), range(0, 1, 0, 1, 0.001), text("ShapeIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(777.6, 14.4, 96.0, 82.28571428571429), channel("LfoFreqIn"), range(0, 1, 0, 1, 0.001), text("LfoFreqIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
label bounds(9.6, 96.6857142857143, 96.0, 82.28571428571429), channel("label9"), text("MorphX"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 96.6857142857143, 96.0, 82.28571428571429), channel("mod0"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 96.6857142857143, 96.0, 82.28571428571429), channel("mod1"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 96.6857142857143, 96.0, 82.28571428571429), channel("mod2"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 96.6857142857143, 96.0, 82.28571428571429), channel("mod3"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 96.6857142857143, 96.0, 82.28571428571429), channel("mod4"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 96.6857142857143, 96.0, 82.28571428571429), channel("mod5"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 96.6857142857143, 96.0, 82.28571428571429), channel("mod6"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 96.6857142857143, 96.0, 82.28571428571429), channel("mod7"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 178.9714285714286, 96.0, 82.28571428571429), channel("label18"), text("MorphY"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 178.9714285714286, 96.0, 82.28571428571429), channel("mod8"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 178.9714285714286, 96.0, 82.28571428571429), channel("mod9"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 178.9714285714286, 96.0, 82.28571428571429), channel("mod10"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 178.9714285714286, 96.0, 82.28571428571429), channel("mod11"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 178.9714285714286, 96.0, 82.28571428571429), channel("mod12"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 178.9714285714286, 96.0, 82.28571428571429), channel("mod13"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 178.9714285714286, 96.0, 82.28571428571429), channel("mod14"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 178.9714285714286, 96.0, 82.28571428571429), channel("mod15"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 261.25714285714287, 96.0, 82.28571428571429), channel("label27"), text("Audiodescriptor1"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 261.25714285714287, 96.0, 82.28571428571429), channel("mod16"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 261.25714285714287, 96.0, 82.28571428571429), channel("mod17"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 261.25714285714287, 96.0, 82.28571428571429), channel("mod18"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 261.25714285714287, 96.0, 82.28571428571429), channel("mod19"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 261.25714285714287, 96.0, 82.28571428571429), channel("mod20"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 261.25714285714287, 96.0, 82.28571428571429), channel("mod21"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 261.25714285714287, 96.0, 82.28571428571429), channel("mod22"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 261.25714285714287, 96.0, 82.28571428571429), channel("mod23"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 343.54285714285714, 96.0, 82.28571428571429), channel("label36"), text("Audiodescriptor2"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 343.54285714285714, 96.0, 82.28571428571429), channel("mod24"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 343.54285714285714, 96.0, 82.28571428571429), channel("mod25"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 343.54285714285714, 96.0, 82.28571428571429), channel("mod26"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 343.54285714285714, 96.0, 82.28571428571429), channel("mod27"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 343.54285714285714, 96.0, 82.28571428571429), channel("mod28"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 343.54285714285714, 96.0, 82.28571428571429), channel("mod29"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 343.54285714285714, 96.0, 82.28571428571429), channel("mod30"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 343.54285714285714, 96.0, 82.28571428571429), channel("mod31"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 425.8285714285714, 96.0, 82.28571428571429), channel("label45"), text("Audiodescriptor3"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 425.8285714285714, 96.0, 82.28571428571429), channel("mod32"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 425.8285714285714, 96.0, 82.28571428571429), channel("mod33"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 425.8285714285714, 96.0, 82.28571428571429), channel("mod34"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 425.8285714285714, 96.0, 82.28571428571429), channel("mod35"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 425.8285714285714, 96.0, 82.28571428571429), channel("mod36"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 425.8285714285714, 96.0, 82.28571428571429), channel("mod37"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 425.8285714285714, 96.0, 82.28571428571429), channel("mod38"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 425.8285714285714, 96.0, 82.28571428571429), channel("mod39"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 508.11428571428576, 96.0, 82.28571428571429), channel("label54"), text("Expression"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 508.11428571428576, 96.0, 82.28571428571429), channel("mod40"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(105.6, 590.4, 96.0, 82.28571428571429), channel("MixXOut"), range(0, 1, 0, 1, 0.001), text("MixXOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(201.6, 508.11428571428576, 96.0, 82.28571428571429), channel("mod41"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(201.6, 590.4, 96.0, 82.28571428571429), channel("MixYOut"), range(0, 1, 0, 1, 0.001), text("MixYOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(297.6, 508.11428571428576, 96.0, 82.28571428571429), channel("mod42"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(297.6, 590.4, 96.0, 82.28571428571429), channel("DelayOut"), range(0, 1, 0, 1, 0.001), text("DelayOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(393.6, 508.11428571428576, 96.0, 82.28571428571429), channel("mod43"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(393.6, 590.4, 96.0, 82.28571428571429), channel("LPFOut"), range(0, 1, 0, 1, 0.001), text("LPFOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(489.6, 508.11428571428576, 96.0, 82.28571428571429), channel("mod44"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(489.6, 590.4, 96.0, 82.28571428571429), channel("SendAmountOut"), range(0, 1, 0, 1, 0.001), text("SendAmountOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(585.6, 508.11428571428576, 96.0, 82.28571428571429), channel("mod45"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(585.6, 590.4, 96.0, 82.28571428571429), channel("DistortAmountOut"), range(0, 1, 0, 1, 0.001), text("DistortAmountOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(681.6, 508.11428571428576, 96.0, 82.28571428571429), channel("mod46"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(681.6, 590.4, 96.0, 82.28571428571429), channel("ShapeOut"), range(0, 1, 0, 1, 0.001), text("ShapeOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(777.6, 508.11428571428576, 96.0, 82.28571428571429), channel("mod47"), range(0, 999, 0.0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(777.6, 590.4, 96.0, 82.28571428571429), channel("LfoFreqOut"), range(0, 1, 0, 1, 0.001), text("LfoFreqOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
>>>>>>> 2289be1 (.)


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
