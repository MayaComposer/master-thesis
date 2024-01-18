<Cabbage>
form caption("Master's Thesis Maya Engel"), size(800, 600), guiMode("queue") pluginId("def1"), colour(255,255,255)

;this button merely exists because otherwise keyboard presses do not work lol
button bounds(-1000, 10, 143, 38), latched(0), channel("button1"), text("Button")

label bounds(200, 20, 400, 94), channel("Header"), text("Untitled by Maya Engel"), align("center"), fontSize("36")

label bounds(100, 182, 400, 200), channel("CueLabel"), text("Current cue: 0"), align("center"), fontSize("36")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
ksmps = 32
nchnls = 2
0dbfs = 1

gkCurrentCue init 0
gkKeyPressed init 0

instr 1
  ;check for keypress and print it when keydown
  kKeyDown chnget "KEY_DOWN"
  kKeyNum chnget "KEY_PRESSED"
  printf "KeyNum:%d", kKeyDown, kKeyNum
  printf " KeyPressed:%d", kKeyDown, gkKeyPressed
  printf " CurrentCue:%d", kKeyDown, gkCurrentCue
  printf " KeyDown:%d \n", kKeyDown, kKeyDown

  SCueText sprintfk "Current cue: %d", gkCurrentCue
  cabbageSet kKeyDown, "CueLabel", "text", SCueText

  ;change cue
  if (kKeyDown == 1) && (gkKeyPressed == 0) then
    gkCurrentCue += 1
    gkKeyPressed = 1
  elseif (kKeyDown == 0) && (gkKeyPressed == 1) then
    gkKeyPressed = 0
  endif
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>