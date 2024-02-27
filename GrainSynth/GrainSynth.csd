<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
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
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
