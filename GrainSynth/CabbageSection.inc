<Cabbage> 
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
rslider bounds(0, 125, 100, 100) channel("rslider10001") range(0, 1, 0, 1, 0.001)  $DESIGN $FONT valueTextBox(1) alpha(0.84) trackerInsideRadius(0.75)
xypad bounds(98, 25, 180, 180) channel("xChan10001", "yChan10001") $DESIGN $FONT fontSize(1) ballColour(161, 74, 118, 255) rangeX(0, 1, 0) rangeY(0, 1, 0)


label bounds(108, 225, 80, 16) channel("label10002") text("alpha") $FONT 
label bounds(208, 225, 80, 16) channel("label10003") text("beta") $FONT

button bounds(0, 0, 30, 24) channel("button10014") fontColour:0(0, 0, 0, 255) fontSize(1) colour:0(152, 114, 114, 255) colour:1(109, 3, 173, 255) text("off", "on")
}

;- Region: Duration
groupbox bounds(310, $PADDINGY, $BGX, $BGY) channel("groupbox10011") outlineThickness(0) $BOXCOL   {
label bounds(98, 0, 142, 25) channel("label10002") text("Duration") $FONT fontSize(16) align("left")
rslider bounds(0, 125, 100, 100) channel("rslider10002") range(0, 1, 0, 1, 0.001)  $DESIGN $FONT valueTextBox(1) alpha(0.84) trackerInsideRadius(0.75)
xypad bounds(98, 25, 180, 180) channel("xChan10002", "yChan10002") $DESIGN fontSize(1) ballColour(161, 74, 118, 255) colour(228, 193, 249, 255)   trackerColour(58, 124, 165, 255) rangeX(0, 1, 0) rangeY(0, 1, 0)


label bounds(108, 225, 80, 16) channel("label10003") text("alpha") $FONT
label bounds(208, 225, 80, 16) channel("label10004") text("beta") $FONT 

button bounds(0, 0, 30, 24) channel("button10015") fontColour:0(0, 0, 0, 255) fontSize(1) colour:0(152, 114, 114, 255) colour:1(109, 3, 173, 255) text("off", "on")
}

;- Region: Freq
groupbox bounds(610, $PADDINGY, $BGX, $BGY) channel("groupbox10012") outlineThickness(0) $BOXCOL   {
label bounds(98, 0, 142, 25) channel("label10003") text("Frequency") $FONT  fontSize(16) align("left")
rslider bounds(0, 125, 100, 100) channel("rslider10003") range(0, 1, 0, 1, 0.001)  $DESIGN $FONT valueTextBox(1) alpha(0.84) trackerInsideRadius(0.75)
xypad bounds(98, 25, 180, 180) channel("xChan10003", "yChan10003") ballColour(161, 74, 118, 255) rangeX(0, 1, 0) rangeY(0, 1, 0) $DESIGN 


label bounds(108, 225, 80, 16) channel("label10005") text("alpha") $FONT
label bounds(208, 225, 80, 16) channel("label10006") text("beta") $FONT

button bounds(0, 0, 30, 24) channel("button10016") fontColour:0(0, 0, 0, 255) fontSize(1) colour:0(152, 114, 114, 255) colour:1(109, 3, 173, 255) text("off", "on")
}

;- Region: FM
;FM pitch
;FM index
;randomness
groupbox bounds(10, 298, $BGX, $BGY) channel("groupbox10013") outlineThickness(0) $BOXCOL   {
label bounds(98, 0, 142, 25) channel("label1007") text("FM") $FONT fontSize(16) align("left")
rslider bounds(0, 125, 100, 100) channel("rslider10004") range(0, 1, 0, 1, 0.001)  $DESIGN $FONT valueTextBox(1) alpha(0.84) trackerInsideRadius(0.75)
xypad bounds(98, 25, 180, 180) channel("xChan10004", "yChan10004") $DESIGN $FONT fontSize(1) ballColour(161, 74, 118, 255) rangeX(0, 1, 0) rangeY(0, 1, 0)


label bounds(108, 225, 80, 16) channel("label10008") text("alpha") $FONT 
label bounds(208, 225, 80, 16) channel("label10009") text("beta") $FONT

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

	hslider bounds(0, 0, 115, 50) channel("hslider10036") range(0, 1, 0, 1, 0.001) text("ad ratio") $COLOR $FONT
	hslider bounds(0, 50, 115, 50) channel("hslider10037") range(0, 1, 0, 1, 0.001) text("distribution") $COLOR $FONT
	hslider bounds(0, 100, 115, 50) channel("hslider10038") range(0, 1, 0, 1, 0.001) text("rndmask") $COLOR $FONT

}


;label bounds(100, 64, 100, 16) channel("label10016") text("ad ratio") $FONT fontColour(58, 124, 165, 255) textColour(58, 124, 165, 255)
;label bounds(100, 80, 100, 16) channel("label10016") text("chanmasking") $FONT
;label bounds(100, 96, 100, 16) channel("label10016") text("distribution") $FONT
;label bounds(100, 112, 100, 16) channel("label10016") text("envelope") $FONT
;label bounds(100, 128, 100, 16) channel("label10016") text("grain masking") $FONT
;label bounds(100, 144, 100, 16) channel("label10015") text("waveamptab") $FONT fontColour(58, 124, 165, 255) textColour(58, 124, 165, 255)

; vmeter bounds(820, 490, 36, 180) channel("vu1") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
; vmeter bounds(858, 490, 36, 180) channel("vu2") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1)

;MISC sliders

</Cabbage>