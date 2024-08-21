<Cabbage>
form caption("Cellular Algo"), size(800, 600), guiMode("queue") pluginId("clls"), colour(255,255,255)

;temp is just there so it does not fuck up my syntax highlighting
#define STYLE #temp(0), fontColour("black")#
csoundoutput bounds(8, 382, 781, 206) channel("csoundoutput10000")
label bounds(100, 82, 400, 200), channel("Label1"), text("Current cue: 0"), align("center"), fontSize("36") $STYLE
label bounds(100, 182, 400, 200), channel("Label2"), text("Current cue: 0"), align("center"), fontSize("36") $STYLE
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-m0 -n -d 
-o dac -i adc
</CsOptions>
<CsInstruments>

sr = 48000
ksmps = 10
nchnls = 2
0dbfs	= 1

;includes
#include "cellular_utilities.inc"
#include "analyze_udos.inc"
#include "analyze_chn_init.inc"

giSine	ftgen	0, 0, 65536, 10, 1			; sine wave
gifftsize 	= 1024
chnset gifftsize, "fftsize"
giFftTabSize	= (gifftsize / 2)+1
gifna     	ftgen   1 ,0 ,giFftTabSize, 7, 0, giFftTabSize, 0   	; for pvs analysis
gifnf     	ftgen   2 ,0 ,giFftTabSize, 7, 0, giFftTabSize, 0   	; for pvs analysis

giSinEnv        ftgen   0, 0, 8192, 19, 1, 0.5, 270, 0.5        ; sinoid transient envelope shape for autocorr



; set up initial population of cells
gisize = 32
giCells[] init gisize ; the array contining the population of cells

giCells[15] = 1

;soundfiles
giSoundfile1	ftgen	0, 0, 0, 1, "cello.wav", 0, 0, 0			; soundfile

; classic waveforms
giSine		ftgen	0, 0, 65537, 10, 1					; sine wave
giCosine	ftgen	0, 0, 8193, 9, 1, 1, 90					; cosine wave

; grain envelope tables
giSigmoRise 	ftgen	0, 0, 8193, 19, 0.5, 1, 270, 1				; rising sigmoid
giSigmoFall 	ftgen	0, 0, 8193, 19, 0.5, 1, 90, 1				; falling sigmoid


;define channels
chn_k "Centroid", 1, 1, 0, 0, 20000
chn_k "Pitch", 1, 1, 0, 0, 20000


; make binary rule array
instr Rule
  irule = p4
  giRule[] make_binary irule ; make the array containing the rule
endin

; grow next generation of cells
instr GrowCells
  giCells ca_update giCells, giRule ; update the live/dead status of all cells in the population
endin

; print cells
instr PrintCells
  ca_print_cells giCells ; print
endin

; play cellular automation, update intervals according to cell values
instr MainAlgo
  ktrig metro p4

  idur = 1/p4 ; duration relative to tempo
  if ktrig == 1 then
    kcount = 0
    k0 = giCells[0*ktrig]
    chnset k0, "cell0"

    k1 = giCells[1*ktrig]
    chnset k1, "cell1"

    k2 = giCells[2*ktrig]
    chnset k2, "cell2"

    k3 = giCells[3*ktrig]
    chnset k3, "cell3"

    k4 = giCells[4*ktrig]
    chnset k4, "cell4"

    k5 = giCells[5*ktrig]
    chnset k5, "cell5"

    k6 = giCells[6*ktrig]
    chnset k6, "cell6"

    k7 = giCells[7*ktrig]
    chnset k7, "cell7" 

    k8 = giCells[8*ktrig]
    chnset k8, "cell8"

    k9 = giCells[9*ktrig]
    chnset k9, "cell9"

    k10 = giCells[10*ktrig]
    chnset k10, "cell10" 

    k11 = giCells[11*ktrig]
    chnset k11, "cell11"

    k12 = giCells[12*ktrig]
    chnset k12, "cell12"

    k13 = giCells[13*ktrig]
    chnset k13, "cell13"

    k14 = giCells[14*ktrig]
    chnset k14, "cell14"

    k15 = giCells[15*ktrig]
    chnset k15, "cell15"

    k16 = giCells[16*ktrig]
    chnset k16, "cell16"

    k17 = giCells[17*ktrig]
    chnset k17, "cell17"

    k18 = giCells[18*ktrig]
    chnset k18, "cell18"

    k19 = giCells[19*ktrig]
    chnset k19, "cell19"

    k20 = giCells[20*ktrig]
    chnset k20, "cell20"

    k21 = giCells[21*ktrig]
    chnset k21, "cell21"

    k22 = giCells[22*ktrig]
    chnset k22, "cell22"

    k23 = giCells[23*ktrig]
    chnset k23, "cell23"

    k24 = giCells[24*ktrig]
    chnset k24, "cell24"

    k25 = giCells[25*ktrig]
    chnset k25, "cell25"

    k26 = giCells[26*ktrig]
    chnset k26, "cell26"

    k27 = giCells[27*ktrig]
    chnset k27, "cell27"

    k28 = giCells[28*ktrig]
    chnset k28, "cell28"

    k29 = giCells[29*ktrig]
    chnset k29, "cell29"

    k30 = giCells[30*ktrig]
    chnset k30, "cell30"

    k31 = giCells[31*ktrig]
    chnset k31, "cell31"



    while kcount < lenarray(giCells) do ; do this FOR ALL CELLS in a generation in one go
      kcell = giCells[kcount] ; get live/dead status of a cell
      
      if kcount == lenarray(giCells)-1 then ; when we are at the last count in a generation of cells
        event "i", "GrowCells", 0, 1 ; update cells
        event "i", "PrintCells", 0, 1 ; print current state of the cells
      endif
      kcount += 1
    od
  endif
endin



;granular synth
instr Grain
  ;retrieve the cells
  kcell0  chnget "cell0"
  kcell1  chnget "cell1"
  kcell2  chnget "cell2"
  kcell3  chnget "cell3"
  kcell4  chnget "cell4"
  kcell5  chnget "cell5"
  kcell6  chnget "cell6"
  kcell7  chnget "cell7"
  kcell8  chnget "cell8"
  kcell9  chnget "cell9"
  kcell10 chnget "cell10"
  kcell11 chnget "cell11"
  kcell12 chnget "cell12"
  kcell13 chnget "cell13"
  kcell14 chnget "cell14"
  kcell15 chnget "cell15"
  kcell16 chnget "cell16"
  kcell17 chnget "cell17"
  kcell18 chnget "cell18"
  kcell19 chnget "cell19"
  kcell20 chnget "cell20"
  kcell21 chnget "cell21"
  kcell22 chnget "cell22"
  kcell23 chnget "cell23"
  kcell24 chnget "cell24"
  kcell25 chnget "cell25"
  kcell26 chnget "cell26"
  kcell27 chnget "cell27"
  kcell28 chnget "cell28"
  kcell29 chnget "cell29"
  kcell30 chnget "cell30"
  kcell31 chnget "cell31"

  kCellSum = kcell0 + kcell1 + kcell2 + kcell3 + kcell4 + kcell5 + kcell6 + kcell7 + kcell8 + kcell9 + kcell10 + kcell11 + kcell12 + kcell13 + kcell14 + kcell15 + kcell16 + kcell17 + kcell18 + kcell19 + kcell20 + kcell21 + kcell22 + kcell23 + kcell24 + kcell25 + kcell26 + kcell27 + kcell28 + kcell29 + kcell30 + kcell31
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
  kwavfreq scale2 kCellSum, 0.1, 1.3, 0, 31
  kgrainrate = kCellSum + 10 ;kcell8 > 0 ? 100 : 10
  agrainrate interp kgrainrate

  ;grain duration                                                                          
  kCellSum3 = kcell1 + kcell2 + kcell3 + kcell4 + kcell5
  kgraindur scale2 kCellSum, 0.1, 0.9, 0, 31
  kduration	= (kgraindur*1000)/kgrainrate	; grain dur in milliseconds, relative to grain rate

  ; grain shape
  ka_d_ratio chnget "Pitch" ; scale2 kCellSum1, 0.1, 0.9, 0.0, 3.0   ; ratio of attach time to decay time in the envelope for each grain
  ksustain_amount	= 0	 ; balance between enveloped time(attack+decay) and sustain level time, 0.0 = no time at sustain level

  ; masking
  igainmasks	ftgentmp	0, 0, 16, -2, 0, 0,   1
  ichannelmasks	ftgentmp	0, 0, 16, -2,  0, 0,  0.5

  kCellSum2 = kcell1 + kcell2 + kcell3
  krandommask chnget "Flatness"
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

  outs a1, a2
      
endin

instr AudioDescriptors
  a1 inch 1
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
i "Rule" 0 1 54 ; make rule array
i "PrintCells" 0 1 ; print cells before we start running anything
;        tempo amp note pan
i "MainAlgo" 0 [60*60*24*7]  0.5   ;start running algorithm

i "AudioDescriptors" 0 [60*60*24*7]

i "Randomness" 0 [60*60*24*7]

i "Grain" 0 [60*60*24*7]

</CsScore>

</CsoundSynthesizer>
