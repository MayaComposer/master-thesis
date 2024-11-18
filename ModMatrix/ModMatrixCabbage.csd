<Cabbage> bounds(0, 0, 0, 0)
form caption("ModMatrix") size(960, 720), guiMode("queue"), pluginId("plan"), colour("beige"), textColour("black"), fontColour("black"), typeface("sanangel.otf")

combobox bounds(0, 0, 80, 20), mode("resize"), value(3)

label bounds(2, 681, 651, 35) channel("label1"), align("left"), fontColour(0, 0, 0, 255) text("Most recently changed widget:")



;_________________________________________________________________________________________________


rslider bounds(81.6, 14.4, 72.0, 72.0), channel("MixXIn"), range(0, 1, 0, 1, 0.001), text("MixXIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(153.6, 14.4, 72.0, 72.0), channel("MixYIn"), range(0, 1, 0, 1, 0.001), text("MixYIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(225.6, 14.4, 72.0, 72.0), channel("DelayIn"), range(0, 1, 0, 1, 0.001), text("DelayIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(297.6, 14.4, 72.0, 72.0), channel("LPFIn"), range(0, 1, 0, 1, 0.001), text("LPFIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(369.6, 14.4, 72.0, 72.0), channel("SendAmountIn"), range(0, 1, 0, 1, 0.001), text("SendAmountIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(441.6, 14.4, 72.0, 72.0), channel("DistortAmountIn"), range(0, 1, 0, 1, 0.001), text("DistortAmountIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(513.6, 14.4, 72.0, 72.0), channel("ShapeIn"), range(0, 1, 0, 1, 0.001), text("ShapeIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(585.6, 14.4, 72.0, 72.0), channel("LfoFreqIn"), range(0, 1, 0, 1, 0.001), text("LfoFreqIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(657.6, 14.4, 72.0, 72.0), channel("LfoAmpIn"), range(0, 1, 0, 1, 0.001), text("LfoAmpIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(729.6, 14.4, 72.0, 72.0), channel("SmackidibooIn"), range(0, 1, 0, 1, 0.001), text("SmackidibooIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(801.6, 14.4, 72.0, 72.0), channel("SmudgirydoobidyIn"), range(0, 1, 0, 1, 0.001), text("SmudgirydoobidyIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
label bounds(9.6, 86.4, 72.0, 72.0), channel("label12"), text("MorphX"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(81.6, 86.4, 72.0, 72.0), channel("mod0"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(153.6, 86.4, 72.0, 72.0), channel("mod1"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(225.6, 86.4, 72.0, 72.0), channel("mod2"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 86.4, 72.0, 72.0), channel("mod3"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(369.6, 86.4, 72.0, 72.0), channel("mod4"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 86.4, 72.0, 72.0), channel("mod5"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(513.6, 86.4, 72.0, 72.0), channel("mod6"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 86.4, 72.0, 72.0), channel("mod7"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(657.6, 86.4, 72.0, 72.0), channel("mod8"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(729.6, 86.4, 72.0, 72.0), channel("mod9"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(801.6, 86.4, 72.0, 72.0), channel("mod10"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 158.4, 72.0, 72.0), channel("label24"), text("MorphY"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(81.6, 158.4, 72.0, 72.0), channel("mod11"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(153.6, 158.4, 72.0, 72.0), channel("mod12"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(225.6, 158.4, 72.0, 72.0), channel("mod13"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 158.4, 72.0, 72.0), channel("mod14"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(369.6, 158.4, 72.0, 72.0), channel("mod15"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 158.4, 72.0, 72.0), channel("mod16"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(513.6, 158.4, 72.0, 72.0), channel("mod17"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 158.4, 72.0, 72.0), channel("mod18"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(657.6, 158.4, 72.0, 72.0), channel("mod19"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(729.6, 158.4, 72.0, 72.0), channel("mod20"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(801.6, 158.4, 72.0, 72.0), channel("mod21"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 230.4, 72.0, 72.0), channel("label36"), text("Audiodescriptor1"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(81.6, 230.4, 72.0, 72.0), channel("mod22"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(153.6, 230.4, 72.0, 72.0), channel("mod23"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(225.6, 230.4, 72.0, 72.0), channel("mod24"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 230.4, 72.0, 72.0), channel("mod25"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(369.6, 230.4, 72.0, 72.0), channel("mod26"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 230.4, 72.0, 72.0), channel("mod27"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(513.6, 230.4, 72.0, 72.0), channel("mod28"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 230.4, 72.0, 72.0), channel("mod29"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(657.6, 230.4, 72.0, 72.0), channel("mod30"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(729.6, 230.4, 72.0, 72.0), channel("mod31"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(801.6, 230.4, 72.0, 72.0), channel("mod32"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 302.4, 72.0, 72.0), channel("label48"), text("Audiodescriptor2"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(81.6, 302.4, 72.0, 72.0), channel("mod33"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(153.6, 302.4, 72.0, 72.0), channel("mod34"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(225.6, 302.4, 72.0, 72.0), channel("mod35"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 302.4, 72.0, 72.0), channel("mod36"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(369.6, 302.4, 72.0, 72.0), channel("mod37"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 302.4, 72.0, 72.0), channel("mod38"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(513.6, 302.4, 72.0, 72.0), channel("mod39"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 302.4, 72.0, 72.0), channel("mod40"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(657.6, 302.4, 72.0, 72.0), channel("mod41"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(729.6, 302.4, 72.0, 72.0), channel("mod42"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(801.6, 302.4, 72.0, 72.0), channel("mod43"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 374.4, 72.0, 72.0), channel("label60"), text("Audiodescriptor3"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(81.6, 374.4, 72.0, 72.0), channel("mod44"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(153.6, 374.4, 72.0, 72.0), channel("mod45"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(225.6, 374.4, 72.0, 72.0), channel("mod46"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 374.4, 72.0, 72.0), channel("mod47"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(369.6, 374.4, 72.0, 72.0), channel("mod48"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 374.4, 72.0, 72.0), channel("mod49"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(513.6, 374.4, 72.0, 72.0), channel("mod50"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 374.4, 72.0, 72.0), channel("mod51"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(657.6, 374.4, 72.0, 72.0), channel("mod52"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(729.6, 374.4, 72.0, 72.0), channel("mod53"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(801.6, 374.4, 72.0, 72.0), channel("mod54"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 446.4, 72.0, 72.0), channel("label72"), text("Expression"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(81.6, 446.4, 72.0, 72.0), channel("mod55"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(153.6, 446.4, 72.0, 72.0), channel("mod56"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(225.6, 446.4, 72.0, 72.0), channel("mod57"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(297.6, 446.4, 72.0, 72.0), channel("mod58"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(369.6, 446.4, 72.0, 72.0), channel("mod59"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 446.4, 72.0, 72.0), channel("mod60"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(513.6, 446.4, 72.0, 72.0), channel("mod61"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(585.6, 446.4, 72.0, 72.0), channel("mod62"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(657.6, 446.4, 72.0, 72.0), channel("mod63"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(729.6, 446.4, 72.0, 72.0), channel("mod64"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(801.6, 446.4, 72.0, 72.0), channel("mod65"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 518.4, 72.0, 72.0), channel("label84"), text("LFO"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(81.6, 518.4, 72.0, 72.0), channel("mod66"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(81.6, 590.4, 72.0, 72.0), channel("MixXOut"), range(0, 1, 0, 1, 0.001), text("MixXOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(153.6, 518.4, 72.0, 72.0), channel("mod67"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(153.6, 590.4, 72.0, 72.0), channel("MixYOut"), range(0, 1, 0, 1, 0.001), text("MixYOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(225.6, 518.4, 72.0, 72.0), channel("mod68"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(225.6, 590.4, 72.0, 72.0), channel("DelayOut"), range(0, 1, 0, 1, 0.001), text("DelayOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(297.6, 518.4, 72.0, 72.0), channel("mod69"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(297.6, 590.4, 72.0, 72.0), channel("LPFOut"), range(0, 1, 0, 1, 0.001), text("LPFOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(369.6, 518.4, 72.0, 72.0), channel("mod70"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(369.6, 590.4, 72.0, 72.0), channel("SendAmountOut"), range(0, 1, 0, 1, 0.001), text("SendAmountOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(441.6, 518.4, 72.0, 72.0), channel("mod71"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(441.6, 590.4, 72.0, 72.0), channel("DistortAmountOut"), range(0, 1, 0, 1, 0.001), text("DistortAmountOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(513.6, 518.4, 72.0, 72.0), channel("mod72"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(513.6, 590.4, 72.0, 72.0), channel("ShapeOut"), range(0, 1, 0, 1, 0.001), text("ShapeOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(585.6, 518.4, 72.0, 72.0), channel("mod73"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(585.6, 590.4, 72.0, 72.0), channel("LfoFreqOut"), range(0, 1, 0, 1, 0.001), text("LfoFreqOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(657.6, 518.4, 72.0, 72.0), channel("mod74"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(657.6, 590.4, 72.0, 72.0), channel("LfoAmpOut"), range(0, 1, 0, 1, 0.001), text("LfoAmpOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(729.6, 518.4, 72.0, 72.0), channel("mod75"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(729.6, 590.4, 72.0, 72.0), channel("SmackidibooOut"), range(0, 1, 0, 1, 0.001), text("SmackidibooOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(801.6, 518.4, 72.0, 72.0), channel("mod76"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(801.6, 590.4, 72.0, 72.0), channel("SmudgirydoobidyOut"), range(0, 1, 0, 1, 0.001), text("SmudgirydoobidyOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)


;_______________________________________________________________________


csoundoutput bounds(559, 627, 401, 93) channel("Console") visible(1)


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
	giCello	init 0;ftgen	0, 0, 0, 1, "cello.wav", 0, 0, 0			; soundfile
	giElect	init 0;ftgen	0, 0, 0, 1, "elect.wav", 0, 0, 0			; soundfile

	gSCello = "cello.wav"
	gSElect = "elect.wav"


	;OSC 
	giOscHandler OSCinit 9994

	giAnalysisHandler OSCinit 7001

	

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

		printk2 kMorphX
		printk2 kMorphY

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
			

		kMorphX = krms_dB_n

		printk2 krms_dB_n, 20
		
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

		printk2 kMixXOut
	
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