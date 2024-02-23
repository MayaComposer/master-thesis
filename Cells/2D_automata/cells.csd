<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 48000
ksmps = 10
nchnls = 2
0dbfs	= 1

#include "cellular_2D.inc"

giSize = 16
giCells[][] init giSize, giSize

;if you go off X and Y coordinates, the syntax is giCells[Y][X] because it is rows and columns instead of x and y


instr Pattern
  ;make the pattern to start with by populating the array
  kRand randh 1, 1
  kRand = round(abs(kRand))
  kRandX randh lenarray(giCells, 1), 1
  kRandX = round(abs(kRandX))
  kRandY randh lenarray(giCells, 1), 1
  kRandY = round(abs(kRandY))
  printk2 kRand, 4
  printk2 kRandX, 4
  printk2 kRandY, 4
  
  ;giCells[kRandY][kRandX] = kRand
endin

; grow next generation of cells
instr GrowCells
  giCells ca_update2D giCells ; update the live/dead status of all cells in the population
endin

; print cells
instr PrintCells
  ca_print_cells2D giCells ; print
endin

; play cellular automation, update intervals according to cell values
instr MainAlgo
  ktrig metro p4
  idur = 1/p4 ; duration relative to tempo
  if ktrig == 1 then
    event "i", "GrowCells", 0, 1  ; Update cells for the current generation
    event "i", "PrintCells", 0, 1 ; Print current state of the cells
  endif
endin

</CsInstruments>
<CsScore>

;causes Csound to run for about 7000 years...
f0 z
i "Pattern" 0 10
; i "PrintCells" 0 1 ; print cells before we start running anything
; ;        tempo amp note pan
; i "MainAlgo" 0 [60*60*24*7] 0.5   ;start running algorithm

</CsScore>
</CsoundSynthesizer>
