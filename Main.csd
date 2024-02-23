<Cabbage>
form caption("Master's Thesis Maya Engel"), size(800, 600), guiMode("queue") pluginId("def1"), colour(255,255,255)

;temp is just there so it does not fuck up my syntax highlighting
#define STYLE #temp(0), fontColour("black")#

;this button merely exists because otherwise keyboard presses do not work lol
button bounds(-1000, 10, 143, 38), latched(0), channel("button1"), text("Button")



label bounds(200, 20, 400, 94), channel("Header"), text("Untitled by Maya Engel"), align("center"), fontSize("36") $STYLE

label bounds(100, 182, 400, 200), channel("CueLabel"), text("Current cue: 0"), align("center"), fontSize("36") $STYLE

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


;define channels
chn_k "Centroid", 1, 1, 0, 0, 20000
chn_k "Pitch", 1, 1, 0, 0, 20000

instr Main
  ;check for keypress and print it when keydown
  kKeyDown chnget "KEY_DOWN"
  kKeyNum chnget "KEY_PRESSED"

  ;change cue
  if (kKeyDown == 1) && (gkKeyPressed == 0) then
    gkCurrentCue += 1
    gkKeyPressed = 1

    if (gkCurrentCue == 1) then
      event "i", "Cue1", 0, 10
    elseif (gkCurrentCue == 2) then
      event "i", "Cue2", 0, 10
    endif

  elseif (kKeyDown == 0) && (gkKeyPressed == 1) then
    gkKeyPressed = 0
  endif

  ;print useful things
  printf "KeyNum:%d", kKeyDown, kKeyNum
  printf " KeyPressed:%d", kKeyDown, gkKeyPressed
  printf " CurrentCue:%d", kKeyDown, gkCurrentCue
  printf " KeyDown:%d \n", kKeyDown, kKeyDown

  SCueText sprintfk "Current cue: %d", gkCurrentCue
  cabbageSet kKeyDown, "CueLabel", "text", SCueText
endin

; read sound, analyze, apply amp to another sound
instr AudioDescriptors
  a1 inch 1
  ; analyze amp, pitch 
  kpitch,kamp_ pitchamdf a1, 100, 900
  kamp rms a1
  ; shape the amp even more
  kamp pow kamp, 2
  ; and scale it as we want
  ;scale function
  kpitch scale2 kpitch, 0.0, 1.0, 0, 1000
  
  ; analyze amp and centroid
  kcentroid centroid a1, 1, 512
  kcentroid tonek kcentroid, 10 ; the centroid varies very quickly (noisy), so it makes sense to filter it
  kcentroid scale2 kcentroid, 0.0, 1.0, 0, 20000
  ;send to channels
  chnset kcentroid, "Centroid"
  chnset kpitch, "Pitch"
  printk2 kpitch, 4
endin

instr Randomness
  kRnd    gaussi    kgaussiRange, kgaussiAmp, kgaussiCps
endin

instr Cue1
  printks "Cue 1 is happening rn \n", 1

  ;turnoff instrument when the next cue gets triggered
  if gkCurrentCue == 2 then
    printf "turning off instrument 1 \n", 1
    turnoff
  endif
endin

instr Cue2
  printks "Cue 2 is happening rn \n", 1

  ;turnoff instrument when the next cue gets triggered
  if gkCurrentCue == 3 then
    printf "turning off instrument 2 \n", 1
    turnoff
  endif
endin


</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i "Main" 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>