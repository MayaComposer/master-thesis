<Cabbage>
form caption("Thesis") size(800, 600), guiMode("queue") pluginId("def1")
rslider bounds(296, 162, 100, 100), channel("gain"), range(0, 1, 0, 1, .01), text("Gain"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
  ;a  commit from old pcdssjodfosdifojisd and if i add more?
  kMouseX chnget "MOUSE_X"
  kMouseY chnget "MOUSE_Y"
  kCurrentKey chnget "KEY_PRESSED"
  
  printk 0.1, kCurrentKey
  
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
