<CsoundSynthesizer>
<CsOptions>
-odac -m0
</CsOptions>
<CsInstruments>

sr = 48000
ksmps = 10
nchnls = 2
0dbfs	= 1

#include "cellular_2D.inc"

#include "analyze_udos.inc"

#include "analyze_chn_init.inc" ;for some reason there needs to be a line between the includes

;fft stuff
giSine	ftgen	0, 0, 65536, 10, 1			; sine wave
gifftsize 	= 1024
chnset gifftsize, "fftsize"
giFftTabSize	= (gifftsize / 2)+1
gifna     	ftgen   1 ,0 ,giFftTabSize, 7, 0, giFftTabSize, 0   	; for pvs analysis
gifnf     	ftgen   2 ,0 ,giFftTabSize, 7, 0, giFftTabSize, 0   	; for pvs analysis
giSinEnv        ftgen   0, 0, 8192, 19, 1, 0.5, 270, 0.5        ; sinoid transient envelope shape for autocorr

;cellular automata
giSize = 8
giCells[][] init giSize, giSize

; Glider pattern in the top-left corner
giCells[1][1] = 0
giCells[1][2] = 1
giCells[1][3] = 0
giCells[2][1] = 0
giCells[2][2] = 0
giCells[2][3] = 1
giCells[3][1] = 1
giCells[3][2] = 1
giCells[3][3] = 1

; ; Glider pattern in the top-right corner
; giCells[1][12] = 0
; giCells[1][13] = 1
; giCells[1][14] = 0
; giCells[2][12] = 0
; giCells[2][13] = 0
; giCells[2][14] = 1
; giCells[3][12] = 1
; giCells[3][13] = 1
; giCells[3][14] = 1

; ; Glider pattern in the bottom-left corner
; giCells[12][1] = 0
; giCells[12][2] = 1
; giCells[12][3] = 0
; giCells[13][1] = 0
; giCells[13][2] = 0
; giCells[13][3] = 1
; giCells[14][1] = 1
; giCells[14][2] = 1
; giCells[14][3] = 1

; ; Glider pattern in the bottom-right corner
; giCells[12][12] = 0
; giCells[12][13] = 1
; giCells[12][14] = 0
; giCells[13][12] = 0
; giCells[13][13] = 0
; giCells[13][14] = 1
; giCells[14][12] = 1
; giCells[14][13] = 1
; giCells[14][14] = 1





;if you go off X and Y coordinates, the syntax is giCells[Y][X] because it is rows and columns instead of x and y

;soundfiles
giSoundfile1	ftgen	0, 0, 0, 1, "cello.wav", 0, 0, 0			; soundfile

;classic waveforms
giSine		ftgen	0, 0, 65537, 10, 1					; sine wave
giCosine	ftgen	0, 0, 8193, 9, 1, 1, 90					; cosine wave

;grain envelope tables
giSigmoRise 	ftgen	0, 0, 8193, 19, 0.5, 1, 270, 1				; rising sigmoid
giSigmoFall 	ftgen	0, 0, 8193, 19, 0.5, 1, 90, 1				; falling sigmoid


;define channels
chn_k "Centroid", 1, 1, 0, 0, 20000
chn_k "Pitch", 1, 1, 0, 0, 20000

chn_a "signal", 2

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
  kTempo chnget "Pitch"
  kTempo scale2 kTempo, 0.75, 10, 0.0, 1.0
  ktrig metro kTempo

  kGrowthRate init 0
  kGrowthRate chnget "Pitch"
  kGrowthRate scale2 kGrowthRate, 1, 5, 0.0, 1.0
  kGrowthRate = round(kGrowthRate)
  chnset kGrowthRate, "GrowthRate"
  
  if ktrig == 1 then
    event "i", "GrowCells", 0, 1 ; update cells
    event "i", "PrintCells", 0, 1 ; print current state of the cells
  endif
endin

;granular synth
instr Grain
  ; amp
  kamp = ampdbfs(-3)

  ; select source waveforms
  kwaveform1	= giSoundfile1		; source audio waveform 1
  kwave1Single	= 0			; flag to set if waveform is single cycle (set to zero for sampled waveforms)
  kwaveform2	= giSoundfile1		; source audio waveform 2
  kwave2Single	= 0			; flag to set if waveform is single cycle (set to zero for sampled waveforms)
  kwaveform3	= giSoundfile1		; source audio waveform 3
  kwave3Single	= 0			; flag to set if waveform is single cycle (set to zero for sampled waveforms)
  kwaveform4	= giSoundfile1		; source audio waveform 4
  kwave4Single	= 0			; flag to set if waveform is single cycle (set to zero for sampled waveforms)

  ; get source waveform length (used when calculating transposition and time pointer)
  kfilen1		tableng	 kwaveform1		; get length of the first source waveform
  kfilen2		tableng	 kwaveform2		; same as above, for source waveform 2
  kfilen3		tableng	 kwaveform3		; same as above, for source waveform 3
  kfilen4		tableng	 kwaveform4		; same as above, for source waveform 4
  kfildur1	= kfilen1 / sr			; length in seconds, for the first source waveform
  kfildur2	= kfilen2 / sr			; same as above, for source waveform 2
  kfildur3	= kfilen3 / sr			; same as above, for source waveform 3
  kfildur4	= kfilen4 / sr			; same as above, for source waveform 4

  ; original pitch for each waveform, use if they should be transposed individually
  ; can also be used as a "cycles per second" parameter for single cycle waveforms (assuming that the kwavfreq parameter has a value of 1.0)
  kwavekey1	= 1
  kwavekey2	= 1
  kwavekey3	= 1
  kwavekey4	= 1

  ; set original key dependant on waveform length (only for sampled waveforms, not for single cycle waves)
  kwavekey1	= (kwave1Single > 0 ? kwavekey1 : kwavekey1/kfildur1)
  kwavekey2	= (kwave2Single > 0 ? kwavekey2 : kwavekey2/kfildur2)
  kwavekey3	= (kwave3Single > 0 ? kwavekey3 : kwavekey3/kfildur3)
  kwavekey4	= (kwave4Single > 0 ? kwavekey4 : kwavekey4/kfildur4)

  ; time pointer (phase). This can be independent for each source waveform.
  isamplepos1	= 0				; initial phase for wave source 1
  isamplepos2	= 0				; initial phase for wave source 2
  isamplepos3	= 0				; initial phase for wave source 3
  isamplepos4	= 0				; initial phase for wave source 4

  kTimeRate	= 1				; time pointer rate
  asamplepos1	phasor kTimeRate / kfildur1	; phasor from 0 to 1, scaled to the length of the first source waveform
  asamplepos2	phasor kTimeRate / kfildur2	; same as above, scaled for source wave 2
  asamplepos3	phasor kTimeRate / kfildur3	; same as above, scaled for source wave 3
  asamplepos4	phasor kTimeRate / kfildur4	; same as above, scaled for source wave 4

  ; mix initial phase and moving phase value (moving phase only for sampled waveforms, single cycle waveforms use static samplepos)
  asamplepos1	= asamplepos1*(1-kwave1Single) + isamplepos1
  asamplepos2	= asamplepos2*(1-kwave2Single) + isamplepos2
  asamplepos3	= asamplepos3*(1-kwave3Single) + isamplepos3
  asamplepos4	= asamplepos4*(1-kwave4Single) + isamplepos4
  ;grain pitch 
  kwavfreq = 1
  kgrainrate sumarray giCells
  agrainrate interp kgrainrate

  ;grain duration                                                                          
  kgraindur = 1
  kduration	= (kgraindur*1000)/kgrainrate	; grain dur in milliseconds, relative to grain rate

  ; grain shape
  ka_d_ratio = 0.5 ; scale2 kCellSum1, 0.1, 0.9, 0.0, 3.0   ; ratio of attach time to decay time in the envelope for each grain
  ksustain_amount	= 0	 ; balance between enveloped time(attack+decay) and sustain level time, 0.0 = no time at sustain level

  ; masking
  igainmasks	ftgentmp	0, 0, 16, -2, 0, 0,   1
  ichannelmasks	ftgentmp	0, 0, 16, -2,  0, 0,  0.5

  krandommask = 0 ; = 1 - krandommask
  iwaveamptab	ftgentmp	0, 0, 32, -2, 0, 0,   1,0,0,0,0

  kdistribution line 0, 5, 1
  idisttab ftgen 0, 0, 32768, 7, 0, 32768, 1 


  ; other parameters that we do not yet need to touch
  ienv_attack = giSigmoRise ; grain attack shape (from table)
  ienv_decay = giSigmoFall ; grain decay shape (from table)
  async 		= 0.0	; external sync signal, can be used to trigger single grains or offset the internal clock
  kenv2amt = 0 ; secondary grain envelope (amount)
  ienv2tab = -1 ; secondary grain envelope shape
  ksweepshape = 0.5 ; pitch sweep shape for each grain
  iwavfreqstarttab = -1 ; table for pitch sweep start points
  iwavfreqendtab = -1 ; table for pitch sweep end points
  awavfm = 0 ; FM of grain pitch (playback speed)
  ifmamptab = -1 ; table for FM index masks
  kfmenv = -1 ; table with grain envelope for the FM index  
  ktraincps = 1 ; trainlet cps
  knumpartials = 1  ; number of partials in trainlet
  kchroma = 1 ; chroma of trainlet
  kwaveform2 = kwaveform1 ; in the simplest version we only use waveform1
  kwaveform3 = kwaveform1 ; in the simplest version we only use waveform1
  kwaveform4 = kwaveform1 ; in the simplest version we only use waveform1
  asamplepos2 = asamplepos1 ; in the simplest version we only use waveform1
  asamplepos3 = asamplepos1 ; in the simplest version we only use waveform1
  asamplepos4 = asamplepos1 ; in the simplest version we only use waveform1
  kwavekey2 = kwavekey1 ; in the simplest version we only use waveform1
  kwavekey3 = kwavekey1 ; in the simplest version we only use waveform1
  kwavekey4 = kwavekey1 ; in the simplest version we only use waveform1
  imax_grains = 100 ; max grains in one k-period (set and forget)

  a1,a2 partikkel agrainrate, kdistribution, idisttab, async, kenv2amt, ienv2tab, \
        ienv_attack, ienv_decay, ksustain_amount, ka_d_ratio, kduration, kamp, igainmasks, \
        kwavfreq, ksweepshape, iwavfreqstarttab, iwavfreqendtab, awavfm, \
        ifmamptab, kfmenv, giCosine, ktraincps, knumpartials, kchroma, \
        ichannelmasks, krandommask,  kwaveform1, kwaveform2, kwaveform3, kwaveform4, \
        iwaveamptab, asamplepos1, asamplepos2, asamplepos3, asamplepos4, \
        kwavekey1, kwavekey2, kwavekey3, kwavekey4, imax_grains 
  chnmix a1+a2, "signal"
  outs a1, a2
      
endin

instr AudioDescriptors
  a1 chnget "signal"
  #include "analyze_audio.inc"
  ;send to channels
  chnset kcentroid_n, "Centroid"
  chnset kpitch_n, "Pitch"
  chnset kflatness_n, "Flatness"
  chnset kmfccdiff, "McDiff" ;timbral pressedness
endin

;do random stuff
instr Randomness
  kAmp chnget "Centroid"
  kFreq chnget "Pitch"
  kFreq scale2 kFreq, 0, 1000, 0.0, 1.0
  kRange = 1.0
  kRnd gaussi kRange, kAmp, kFreq 
endin
</CsInstruments>
<CsScore>

;causes Csound to run for about 7000 years...
f0 z
i "PrintCells" 0 1 ; print cells before we start running anything

i "MainAlgo" 0 [60*60*24*7] 1   ;start running algorithm

i "AudioDescriptors" 0 [60*60*24*7]

i "Grain" 0 [60*60*24*7]

</CsScore>
</CsoundSynthesizer>
