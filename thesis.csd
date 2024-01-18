<Cabbage>
form caption("Master's Thesis Maya Engel") size(800, 600), guiMode("queue") pluginId("def1")
button bounds(10, 10, 143, 38), latched(0), channel("button1"), text("Button")
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
  ;check for keypress and print it when keydown
  kKeyTrig chnget "KEY_DOWN"
  kKeyNum chnget "KEY_PRESSED"
  printf "Key:%d", kKeyTrig, kKeyNum
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>