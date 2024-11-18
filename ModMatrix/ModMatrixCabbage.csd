<Cabbage> bounds(0, 0, 0, 0)
form caption("ModMatrix") size(960, 720), guiMode("queue"), pluginId("plan"), colour("beige"), textColour("black"), fontColour("black"), typeface("sanangel.otf")

combobox bounds(0, 0, 80, 20), mode("resize"), value(3)

label bounds(2, 681, 651, 35) channel("label1"), align("left"), fontColour(0, 0, 0, 255) text("Most recently changed widget:")



;_________________________________________________________________________________________________


rslider bounds(96.0, 14.4, 86.4, 57.6), channel("MixXIn"), range(0, 1, 0, 1, 0.001), text("MixXIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(182.4, 14.4, 86.4, 57.6), channel("MixYIn"), range(0, 1, 0, 1, 0.001), text("MixYIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(268.80000000000007, 14.4, 86.4, 57.6), channel("DelayIn"), range(0, 1, 0, 1, 0.001), text("DelayIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(355.20000000000005, 14.4, 86.4, 57.6), channel("LPFIn"), range(0, 1, 0, 1, 0.001), text("LPFIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(441.6, 14.4, 86.4, 57.6), channel("SendAmountIn"), range(0, 1, 0, 1, 0.001), text("SendAmountIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(528.0000000000001, 14.4, 86.4, 57.6), channel("DistortAmountIn"), range(0, 1, 0, 1, 0.001), text("DistortAmountIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(614.4000000000001, 14.4, 86.4, 57.6), channel("ShapeIn"), range(0, 1, 0, 1, 0.001), text("ShapeIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(700.8000000000001, 14.4, 86.4, 57.6), channel("LfoFreqIn"), range(0, 1, 0, 1, 0.001), text("LfoFreqIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
rslider bounds(787.2, 14.4, 86.4, 57.6), channel("LfoAmpIn"), range(0, 1, 0, 1, 0.001), text("LfoAmpIn"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
label bounds(9.6, 72.0, 86.4, 57.6), channel("label10"), text("MorphX"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(96.0, 72.0, 86.4, 57.6), channel("mod0"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(182.4, 72.0, 86.4, 57.6), channel("mod1"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(268.80000000000007, 72.0, 86.4, 57.6), channel("mod2"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(355.20000000000005, 72.0, 86.4, 57.6), channel("mod3"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 72.0, 86.4, 57.6), channel("mod4"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(528.0000000000001, 72.0, 86.4, 57.6), channel("mod5"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(614.4000000000001, 72.0, 86.4, 57.6), channel("mod6"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(700.8000000000001, 72.0, 86.4, 57.6), channel("mod7"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(787.2, 72.0, 86.4, 57.6), channel("mod8"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 129.6, 86.4, 57.6), channel("label20"), text("MorphY"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(96.0, 129.6, 86.4, 57.6), channel("mod9"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(182.4, 129.6, 86.4, 57.6), channel("mod10"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(268.80000000000007, 129.6, 86.4, 57.6), channel("mod11"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(355.20000000000005, 129.6, 86.4, 57.6), channel("mod12"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 129.6, 86.4, 57.6), channel("mod13"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(528.0000000000001, 129.6, 86.4, 57.6), channel("mod14"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(614.4000000000001, 129.6, 86.4, 57.6), channel("mod15"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(700.8000000000001, 129.6, 86.4, 57.6), channel("mod16"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(787.2, 129.6, 86.4, 57.6), channel("mod17"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 187.20000000000002, 86.4, 57.6), channel("label30"), text("Audiodescriptor1"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(96.0, 187.20000000000002, 86.4, 57.6), channel("mod18"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(182.4, 187.20000000000002, 86.4, 57.6), channel("mod19"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(268.80000000000007, 187.20000000000002, 86.4, 57.6), channel("mod20"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(355.20000000000005, 187.20000000000002, 86.4, 57.6), channel("mod21"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 187.20000000000002, 86.4, 57.6), channel("mod22"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(528.0000000000001, 187.20000000000002, 86.4, 57.6), channel("mod23"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(614.4000000000001, 187.20000000000002, 86.4, 57.6), channel("mod24"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(700.8000000000001, 187.20000000000002, 86.4, 57.6), channel("mod25"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(787.2, 187.20000000000002, 86.4, 57.6), channel("mod26"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 244.8, 86.4, 57.6), channel("label40"), text("Audiodescriptor2"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(96.0, 244.8, 86.4, 57.6), channel("mod27"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(182.4, 244.8, 86.4, 57.6), channel("mod28"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(268.80000000000007, 244.8, 86.4, 57.6), channel("mod29"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(355.20000000000005, 244.8, 86.4, 57.6), channel("mod30"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 244.8, 86.4, 57.6), channel("mod31"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(528.0000000000001, 244.8, 86.4, 57.6), channel("mod32"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(614.4000000000001, 244.8, 86.4, 57.6), channel("mod33"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(700.8000000000001, 244.8, 86.4, 57.6), channel("mod34"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(787.2, 244.8, 86.4, 57.6), channel("mod35"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 302.4, 86.4, 57.6), channel("label50"), text("Audiodescriptor3"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(96.0, 302.4, 86.4, 57.6), channel("mod36"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(182.4, 302.4, 86.4, 57.6), channel("mod37"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(268.80000000000007, 302.4, 86.4, 57.6), channel("mod38"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(355.20000000000005, 302.4, 86.4, 57.6), channel("mod39"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 302.4, 86.4, 57.6), channel("mod40"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(528.0000000000001, 302.4, 86.4, 57.6), channel("mod41"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(614.4000000000001, 302.4, 86.4, 57.6), channel("mod42"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(700.8000000000001, 302.4, 86.4, 57.6), channel("mod43"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(787.2, 302.4, 86.4, 57.6), channel("mod44"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 360.0, 86.4, 57.6), channel("label60"), text("Audiodescriptor4"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(96.0, 360.0, 86.4, 57.6), channel("mod45"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(182.4, 360.0, 86.4, 57.6), channel("mod46"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(268.80000000000007, 360.0, 86.4, 57.6), channel("mod47"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(355.20000000000005, 360.0, 86.4, 57.6), channel("mod48"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 360.0, 86.4, 57.6), channel("mod49"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(528.0000000000001, 360.0, 86.4, 57.6), channel("mod50"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(614.4000000000001, 360.0, 86.4, 57.6), channel("mod51"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(700.8000000000001, 360.0, 86.4, 57.6), channel("mod52"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(787.2, 360.0, 86.4, 57.6), channel("mod53"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 417.59999999999997, 86.4, 57.6), channel("label70"), text("Audiodescriptor5"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(96.0, 417.59999999999997, 86.4, 57.6), channel("mod54"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(182.4, 417.59999999999997, 86.4, 57.6), channel("mod55"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(268.80000000000007, 417.59999999999997, 86.4, 57.6), channel("mod56"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(355.20000000000005, 417.59999999999997, 86.4, 57.6), channel("mod57"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 417.59999999999997, 86.4, 57.6), channel("mod58"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(528.0000000000001, 417.59999999999997, 86.4, 57.6), channel("mod59"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(614.4000000000001, 417.59999999999997, 86.4, 57.6), channel("mod60"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(700.8000000000001, 417.59999999999997, 86.4, 57.6), channel("mod61"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(787.2, 417.59999999999997, 86.4, 57.6), channel("mod62"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 475.2, 86.4, 57.6), channel("label80"), text("Audiodescriptor6"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(96.0, 475.2, 86.4, 57.6), channel("mod63"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(182.4, 475.2, 86.4, 57.6), channel("mod64"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(268.80000000000007, 475.2, 86.4, 57.6), channel("mod65"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(355.20000000000005, 475.2, 86.4, 57.6), channel("mod66"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(441.6, 475.2, 86.4, 57.6), channel("mod67"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(528.0000000000001, 475.2, 86.4, 57.6), channel("mod68"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(614.4000000000001, 475.2, 86.4, 57.6), channel("mod69"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(700.8000000000001, 475.2, 86.4, 57.6), channel("mod70"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
nslider bounds(787.2, 475.2, 86.4, 57.6), channel("mod71"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
label bounds(9.6, 532.8, 86.4, 57.6), channel("label90"), text("LFO"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour("black") align("centre") fontSize(10)
nslider bounds(96.0, 532.8, 86.4, 57.6), channel("mod72"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(96.0, 590.4, 86.4, 57.6), channel("MixXOut"), range(0, 1, 0, 1, 0.001), text("MixXOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(182.4, 532.8, 86.4, 57.6), channel("mod73"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(182.4, 590.4, 86.4, 57.6), channel("MixYOut"), range(0, 1, 0, 1, 0.001), text("MixYOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(268.80000000000007, 532.8, 86.4, 57.6), channel("mod74"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(268.80000000000007, 590.4, 86.4, 57.6), channel("DelayOut"), range(0, 1, 0, 1, 0.001), text("DelayOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(355.20000000000005, 532.8, 86.4, 57.6), channel("mod75"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(355.20000000000005, 590.4, 86.4, 57.6), channel("LPFOut"), range(0, 1, 0, 1, 0.001), text("LPFOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(441.6, 532.8, 86.4, 57.6), channel("mod76"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(441.6, 590.4, 86.4, 57.6), channel("SendAmountOut"), range(0, 1, 0, 1, 0.001), text("SendAmountOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(528.0000000000001, 532.8, 86.4, 57.6), channel("mod77"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(528.0000000000001, 590.4, 86.4, 57.6), channel("DistortAmountOut"), range(0, 1, 0, 1, 0.001), text("DistortAmountOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(614.4000000000001, 532.8, 86.4, 57.6), channel("mod78"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(614.4000000000001, 590.4, 86.4, 57.6), channel("ShapeOut"), range(0, 1, 0, 1, 0.001), text("ShapeOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(700.8000000000001, 532.8, 86.4, 57.6), channel("mod79"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(700.8000000000001, 590.4, 86.4, 57.6), channel("LfoFreqOut"), range(0, 1, 0, 1, 0.001), text("LfoFreqOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)
nslider bounds(787.2, 532.8, 86.4, 57.6), channel("mod80"), range(0, 999, 0, 1, 0.01), fontSize("15"), _type("coeff")
rslider bounds(787.2, 590.4, 86.4, 57.6), channel("LfoAmpOut"), range(0, 1, 0, 1, 0.001), text("LfoAmpOut"), markerColour(58, 124, 165) outlineColour(223, 181, 248) trackerColour(58, 124, 165) colour(161, 74, 118) textColour(0, 0, 0, 255) trackerThickness(1)


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
			

		kAudiodescriptor1 = krms_dB_n
		kAudiodescriptor2 = kpitch_n
		kAudiodescriptor3 = kcentroid_n
		kAudiodescriptor4 = kflatness_n
		kAudiodescriptor5 = katransDensEnv_n
		kAudiodescriptor6 = kspread_n

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