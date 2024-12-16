x<Cabbage> bounds(0, 0, 0, 0)
form caption("ModMatrix") size(960, 720), guiMode("queue"), pluginId("plan"), colour("beige"), textColour("black"), fontColour("black"), typeface("sanangel.otf")

combobox bounds(0, 0, 80, 20), mode("resize"), value(3)

label bounds(2, 681, 651, 35) channel("label1"), align("left"), fontColour(0, 0, 0, 255) text("Most recently changed widget:")



;_________________________________________________________________________________________________


rslider bounds(105.6, 14.4, 96.0, 57.6), channel("GrainRateIn"), range(0, 1, 0, 1, 0.001), text("GrainRateIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(201.6, 14.4, 96.0, 57.6), channel("DurationIn"), range(0, 1, 0, 1, 0.001), text("DurationIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(297.6, 14.4, 96.0, 57.6), channel("FreqIn"), range(0, 1, 0, 1, 0.001), text("FreqIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(393.6, 14.4, 96.0, 57.6), channel("FmPitchIn"), range(0, 1, 0, 1, 0.001), text("FmPitchIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(489.6, 14.4, 96.0, 57.6), channel("FmIndexIn"), range(0, 1, 0, 1, 0.001), text("FmIndexIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(585.6, 14.4, 96.0, 57.6), channel("EnvIn"), range(0, 1, 0, 1, 0.001), text("EnvIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(681.6, 14.4, 96.0, 57.6), channel("DistrIn"), range(0, 1, 0, 1, 0.001), text("DistrIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(777.6, 14.4, 96.0, 57.6), channel("RndMaskIn"), range(0, 1, 0, 1, 0.001), text("RndMaskIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
label bounds(9.6, 72.0, 96.0, 57.6), channel("label9"), text("Mousex"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 72.0, 96.0, 57.6), channel("mod0"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 72.0, 96.0, 57.6), channel("mod1"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 72.0, 96.0, 57.6), channel("mod2"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 72.0, 96.0, 57.6), channel("mod3"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 72.0, 96.0, 57.6), channel("mod4"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 72.0, 96.0, 57.6), channel("mod5"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 72.0, 96.0, 57.6), channel("mod6"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 72.0, 96.0, 57.6), channel("mod7"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 129.6, 96.0, 57.6), channel("label18"), text("Mousey"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 129.6, 96.0, 57.6), channel("mod8"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 129.6, 96.0, 57.6), channel("mod9"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 129.6, 96.0, 57.6), channel("mod10"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 129.6, 96.0, 57.6), channel("mod11"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 129.6, 96.0, 57.6), channel("mod12"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 129.6, 96.0, 57.6), channel("mod13"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 129.6, 96.0, 57.6), channel("mod14"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 129.6, 96.0, 57.6), channel("mod15"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 187.20000000000002, 96.0, 57.6), channel("label27"), text("Audiodescriptor1"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 187.20000000000002, 96.0, 57.6), channel("mod16"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 187.20000000000002, 96.0, 57.6), channel("mod17"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 187.20000000000002, 96.0, 57.6), channel("mod18"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 187.20000000000002, 96.0, 57.6), channel("mod19"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 187.20000000000002, 96.0, 57.6), channel("mod20"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 187.20000000000002, 96.0, 57.6), channel("mod21"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 187.20000000000002, 96.0, 57.6), channel("mod22"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 187.20000000000002, 96.0, 57.6), channel("mod23"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 244.8, 96.0, 57.6), channel("label36"), text("Audiodescriptor2"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 244.8, 96.0, 57.6), channel("mod24"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 244.8, 96.0, 57.6), channel("mod25"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 244.8, 96.0, 57.6), channel("mod26"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 244.8, 96.0, 57.6), channel("mod27"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 244.8, 96.0, 57.6), channel("mod28"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 244.8, 96.0, 57.6), channel("mod29"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 244.8, 96.0, 57.6), channel("mod30"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 244.8, 96.0, 57.6), channel("mod31"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 302.4, 96.0, 57.6), channel("label45"), text("Audiodescriptor3"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 302.4, 96.0, 57.6), channel("mod32"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 302.4, 96.0, 57.6), channel("mod33"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 302.4, 96.0, 57.6), channel("mod34"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 302.4, 96.0, 57.6), channel("mod35"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 302.4, 96.0, 57.6), channel("mod36"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 302.4, 96.0, 57.6), channel("mod37"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 302.4, 96.0, 57.6), channel("mod38"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 302.4, 96.0, 57.6), channel("mod39"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 360.0, 96.0, 57.6), channel("label54"), text("Audiodescriptor4"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 360.0, 96.0, 57.6), channel("mod40"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 360.0, 96.0, 57.6), channel("mod41"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 360.0, 96.0, 57.6), channel("mod42"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 360.0, 96.0, 57.6), channel("mod43"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 360.0, 96.0, 57.6), channel("mod44"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 360.0, 96.0, 57.6), channel("mod45"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 360.0, 96.0, 57.6), channel("mod46"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 360.0, 96.0, 57.6), channel("mod47"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 417.59999999999997, 96.0, 57.6), channel("label63"), text("Audiodescriptor5"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 417.59999999999997, 96.0, 57.6), channel("mod48"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 417.59999999999997, 96.0, 57.6), channel("mod49"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 417.59999999999997, 96.0, 57.6), channel("mod50"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 417.59999999999997, 96.0, 57.6), channel("mod51"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 417.59999999999997, 96.0, 57.6), channel("mod52"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 417.59999999999997, 96.0, 57.6), channel("mod53"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 417.59999999999997, 96.0, 57.6), channel("mod54"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 417.59999999999997, 96.0, 57.6), channel("mod55"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 475.2, 96.0, 57.6), channel("label72"), text("Audiodescriptor6"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 475.2, 96.0, 57.6), channel("mod56"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(201.6, 475.2, 96.0, 57.6), channel("mod57"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 475.2, 96.0, 57.6), channel("mod58"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(393.6, 475.2, 96.0, 57.6), channel("mod59"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(489.6, 475.2, 96.0, 57.6), channel("mod60"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 475.2, 96.0, 57.6), channel("mod61"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(681.6, 475.2, 96.0, 57.6), channel("mod62"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(777.6, 475.2, 96.0, 57.6), channel("mod63"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 532.8, 96.0, 57.6), channel("label81"), text("LFO"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(105.6, 532.8, 96.0, 57.6), channel("mod64"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(105.6, 590.4, 96.0, 57.6), channel("GrainRateOut"), range(0, 1, 0, 1, 0.001), text("GrainRateOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(201.6, 532.8, 96.0, 57.6), channel("mod65"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(201.6, 590.4, 96.0, 57.6), channel("DurationOut"), range(0, 1, 0, 1, 0.001), text("DurationOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(297.6, 532.8, 96.0, 57.6), channel("mod66"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(297.6, 590.4, 96.0, 57.6), channel("FreqOut"), range(0, 1, 0, 1, 0.001), text("FreqOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(393.6, 532.8, 96.0, 57.6), channel("mod67"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(393.6, 590.4, 96.0, 57.6), channel("FmPitchOut"), range(0, 1, 0, 1, 0.001), text("FmPitchOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(489.6, 532.8, 96.0, 57.6), channel("mod68"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(489.6, 590.4, 96.0, 57.6), channel("FmIndexOut"), range(0, 1, 0, 1, 0.001), text("FmIndexOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(585.6, 532.8, 96.0, 57.6), channel("mod69"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(585.6, 590.4, 96.0, 57.6), channel("EnvOut"), range(0, 1, 0, 1, 0.001), text("EnvOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(681.6, 532.8, 96.0, 57.6), channel("mod70"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(681.6, 590.4, 96.0, 57.6), channel("DistrOut"), range(0, 1, 0, 1, 0.001), text("DistrOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(777.6, 532.8, 96.0, 57.6), channel("mod71"), range(-999, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(777.6, 590.4, 96.0, 57.6), channel("RndMaskOut"), range(0, 1, 0, 1, 0.001), text("RndMaskOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)


;_______________________________________________________________________


;TESTING WIDGETS



button bounds(934, 694, 25, 26) channel("ConsoleToggle") colour:0(238, 185, 185, 255) colour:1(2, 255, 69, 255) text("") latched(0)

groupbox bounds(0, 0, 430, 360), text("Debug window"), plant("debug"), popup(1), channel("debug"), colour("beige"), visible(0) {

	button bounds(0, 130, 100, 50) channel("OscTestConnection") colour:0(238, 185, 185, 255) colour:1(2, 255, 69, 255) text("test OSC send") latched(1)
	csoundoutput bounds(0, 180, 430, 180) channel("Console") visible(1)

	button bounds(0, 230, 100, 50) channel("MouseListen") colour:0(238, 185, 185, 255) colour:1(2, 255, 69, 255) text("Mouse listen") latched(1)

	nslider bounds( 55, 25, 90, 35), text("MOUSE X"), fontColour("white"), textBox(1), channel("X"), range(0, 1, 0, 1, 0.01)
	nslider bounds(160, 25, 90, 35), text("MOUSE Y"), fontColour("white"), textBox(1), channel("Y"), range(0, 1, 0, 1, 0.01)
	nslider bounds(  5, 70, 90, 35), text("MOUSE LEFT"), fontColour("white"), textBox(1), channel("LEFT"), range(0,1,0,1,1)
	nslider bounds(105, 70, 90, 35), text("MOUSE MIDDLE"), fontColour("white"), textBox(1),                channel("MIDDLE"), range(0, 1,   0,1,1)
	nslider bounds(205, 70, 90, 35), text("MOUSE RIGHT"), fontColour("white"), textBox(1), 
}
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


	;OSC 
	giOscHandler OSCinit 9994 ;input from external device

	giAnalysisHandler OSCinit 7001 ;analysis osc port within Reaper

	

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

	instr MouseSense
		kMOUSE_X               chnget  "MOUSE_X"
		kMOUSE_Y               chnget  "MOUSE_Y"
		kMOUSE_DOWN_LEFT       chnget  "MOUSE_DOWN_LEFT"
		kMOUSE_DOWN_MIDDLE     chnget  "MOUSE_DOWN_MIDDLE"
		kMOUSE_DOWN_RIGHT      chnget  "MOUSE_DOWN_RIGHT"

		printks2 "Mouse x, y:", 0
		printk2 kMOUSE_X, 2
		printk2 kMOUSE_Y, 2

		kMOUSE_X scale2 kMOUSE_X, 0.0, 1.0, 0, 960
		kMOUSE_Y scale2 kMOUSE_Y, 0.0, 1.0, 0, 720

		kmetro	metro	20

		kToggleValue cabbageGet "MouseListen", "value"
		
		if kmetro==1 then
			cabbageSetValue 	"X", 	kMOUSE_X
			cabbageSetValue		"Y",	kMOUSE_Y
		endif

		if kToggleValue == 1 then
			OSCsend kMOUSE_X, "127.0.0.1", 9994, "/Mousex", "f", kMOUSE_X
			OSCsend kMOUSE_Y, "127.0.0.1", 9994, "/Mousey", "f", kMOUSE_Y
		endif

	endin
	
	instr Debugger

		kToggleValue cabbageGet "ConsoleToggle", "value"

		if changed:k(kToggleValue) == 1 then
			cabbageSet 1, "debug", "visible", 1
		endif
		; else
		; 	cabbageSet 1, "debug", "visible", 0
		

		; kTrig chnget "but1"
		; if changed:k(kTrig)==1 then
		; 	chnset "visible(1)", "pops"
		; endif

		
		;OSC tester
		;OSCsend kwhen, ihost, iport, idestination, itype [, kdata1, kdata2, ...]
		kOscTestConnection init 0 
		kTrig init 0
		
		kOscTestConnection, kTrig cabbageGetValue "OscTestConnection"
		printks2 "osc test:", kTrig
		printk2 kOscTestConnection
		printk2 kTrig, 4

		if kTrig == 1 then
			kRand = random:k(0, 1)
		endif

		printks2 "rnd val:", kRand
		printk2 kRand, 8

		OSCsend kTrig, "127.0.0.1", 9998, "/track/1/volume", "f", kRand
	endin

	instr Receiver
		prints "osc receiver initiliased"
		
		#include "receiver.inc"

		krms init 0 
		krms_dB_n init 0
		kamp_trans_hold init 0
		katransDensEnv_n init 0
		kenv_crest1 init 0
		kenv_dyn init 0
		kpitch_n init 0
		kcentroid_n init 0
		kspread_n init 0
		kskewness_n init 0
		kurtosis_n init 0
		kflatness_n init 0
		kcrest_n init 0
		kflux_n init 0
		krhythm_irregularity init 0
		krhythm_consonance init 0
		krhythm_consonance_deviation init 0
		kra_flux init 0 
		krhythm_ac_crest init 0
		kmfcc1 init 0
		kmfcc2 init 0
		kmfcc3 init 0
		kmfccdiff init 0

		nxt_val:

		kk1 OSClisten  giAnalysisHandler, "/analysis_a_1", "fffffffffffffffffffffff", krms, krms_dB_n, kamp_trans_hold, katransDensEnv_n, kenv_crest1, kenv_dyn, kpitch_n, kcentroid_n, kspread_n, kskewness_n, kurtosis_n, kflatness_n, kcrest_n, kflux_n, krhythm_irregularity, krhythm_consonance, krhythm_consonance_deviation, kra_flux, krhythm_ac_crest, kmfcc1, kmfcc2, kmfcc3, kmfccdiff

		if (kk1 == 0 ) goto ex_val
			kgoto nxt_val 
		ex_val:
			

		kAudiodescriptor1 = krms_dB_n
		kAudiodescriptor2 = kpitch_n
		kAudiodescriptor3 = kcentroid_n
		kAudiodescriptor4 = kflatness_n
		kAudiodescriptor5 = katransDensEnv_n
		kAudiodescriptor6 = kspread_n
		
	endin

	instr ModMatrix

		prints "ModMatrix initialised"

		#include "output.inc"


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

</CsInstruments>
<CsScore>

	f0 z
	i "UserInterface" 0 865000
	i "MouseSense" 0 865000
	i "Debugger" 0 865000
	i "Receiver" 0 865000
	i "ModMatrix" 0 865000
	i "Processing" 0 865000

</CsScore>
</CsoundSynthesizer>