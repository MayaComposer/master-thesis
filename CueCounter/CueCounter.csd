<Cabbage> bounds(0, 0, 0, 0)
form caption("Grain Verb") size(450, 337), guiMode("queue") pluginId("uiop") colour("beige") textColour("black") fontColour("black")


nslider bounds(0, 86, 448, 251) channel("nslider10001") range(0, 100, 0, 1, 1) trackerColour(161, 103, 103, 0)  textColour(0, 0, 0, 255) fontColour(222, 117, 224, 255) colour(245, 245, 220, 255)  colour(245, 245, 220, 255)
combobox bounds(0, 0, 85, 40), mode("resize"), value(3) fontColour(222, 117, 224, 255) colour("beige") automatable(0) channel("PluginResizerCombBox") colour(255, 255, 255, 255)
label bounds(0, 40, 450, 46) channel("label10002") text("Current cue:") fontColour(222, 117, 224, 255)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


instr 1
    print 1
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
