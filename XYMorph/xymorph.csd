<Cabbage> bounds(0, 0, 0, 0)
form caption("XYMorpher") size(960, 720), guiMode("queue"), pluginId("sdfr"), colour("beige"), textColour("black"), fontColour("black"), typeface("sanangel.otf")


combobox bounds(0, 0, 80, 20), mode("resize"), value(3)

xypad bounds(176, 26, 664, 664) channel("xChan", "yChan") ballColour(236, 76, 221, 255)   textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) colour(143, 245, 245, 100) rangeX(0, 1, 0) rangeY(0, 1, 0)


vmeter bounds(140, 26, 36, 180) channel("vu1") meterColour:0(255, 0, 0, 255) meterColour:1(255, 255, 0, 255) meterColour:2(0, 255, 0, 255) outlineColour(0, 0, 0, 255) overlayColour(0, 0, 0, 255)
vmeter bounds(840, 26, 36, 180) channel("vu2") meterColour:0(255, 0, 0, 255) meterColour:1(255, 255, 0, 255) meterColour:2(0, 255, 0, 255) outlineColour(0, 0, 0, 255) overlayColour(0, 0, 0, 255)

vmeter bounds(140, 500, 36, 180) channel("vu3") meterColour:0(255, 0, 0, 255) meterColour:1(255, 255, 0, 255) meterColour:2(0, 255, 0, 255) outlineColour(0, 0, 0, 255) overlayColour(0, 0, 0, 255)

vmeter bounds(840, 500, 36, 180) channel("vu4") meterColour:0(255, 0, 0, 255) meterColour:1(255, 255, 0, 255) meterColour:2(0, 255, 0, 255) outlineColour(0, 0, 0, 255) overlayColour(0, 0, 0, 255)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 4 ; main outputs
0dbfs = 1


instr 1

    a1 inch 1
    a2 inch 2
    a3 inch 3
    a4 inch 4

    kX cabbageGetValue "xChan"
    kY cabbageGetValue "yChan"

    ;printk2 kX, 4
    ;printk2 kY, 8

    kTopLeft = (1 - kX) * kY
    kTopRight = kX * kY
    kBottomLeft = (1 - kX) * (1 - kY)
    kBottomRight = kX * (1 - kY)

    ; printk2 kTopLeft, 4
    ; printk2 kTopRight, 12 
    ; printk2 kBottomLeft, 20 
    ; printk2 kBottomRight, 32


    a1 *= kTopLeft 
    a2 *= kTopRight
    a3 *= kBottomLeft 
    a4 *= kBottomRight 

    ;add sound to meter
    k1 rms a1, 20
    k2 rms a2, 20
    k3 rms a3, 20
    k4 rms a4, 20

    cabbageSetValue "vu1", portk(k1*40, .25), metro(10)
    cabbageSetValue "vu2", portk(k2*40, .25), metro(10)
    cabbageSetValue "vu3", portk(k3*40, .50), metro(10)
    cabbageSetValue "vu4", portk(k4*40, .50), metro(10)

    out a1, a2, a3, a4


endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
