<Cabbage> bounds(0, 0, 0, 0)
form caption("ui designer") size(900, 675), guiMode("queue") pluginId("plan") colour("beige") textColour("black") fontColour("black") typeface("sanangel.otf")

#define DESIGN colour(228, 193, 249) trackerColour(58, 124, 165) fontSize(1)
#define SLIDER valueTextBox(1) trackerInsideRadius(0.75)
#define FONT fontColour(58, 124, 165) textColour(58, 124, 165)

;label bounds(0, 37, 900, 600) channel("label10009") colour(223, 181, 248, 255) alpha(0.8) text("")

vmeter bounds(820, 490, 36, 180) channel("vu1") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
vmeter bounds(858, 490, 36, 180) channel("vu2") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1)

;csoundoutput bounds(8, 450, 399, 217) channel("csoundoutput10010"), fontColour("white")

combobox bounds(0, 0, 80, 40), mode("resize"), value(3) automatable(0) channel("PluginResizerCombBox") $DESIGN $FONT



;GRAIN RATE
groupbox bounds(0, 38, 300, 250) channel("groupbox10010") outlineThickness(0) colour(195, 148, 202, 255)   {
label bounds(98, 0, 142, 25) channel("label10001") text("Grain rate") $FONT fontSize(16) align("left") fontColour(58, 124, 165, 255) textColour(58, 124, 165, 255)
rslider bounds(0, 125, 100, 100) channel("rslider10001") range(0, 1, 0, 1, 0.001)  $DESIGN $FONT valueTextBox(1) alpha(0.84) trackerInsideRadius(0.75)
xypad bounds(98, 25, 200, 200) channel("xChan10001", "yChan10001") $DESIGN fontSize(1) ballColour(161, 74, 118, 255) colour(228, 193, 249, 255)   trackerColour(58, 124, 165, 255) rangeX(0, 1, 0) rangeY(0, 1, 0)


label bounds(108, 225, 80, 16) channel("label10002") text("alpha") $FONT fontColour(58, 124, 165, 255) textColour(58, 124, 165, 255)
label bounds(208, 225, 80, 16) channel("label10003") text("beta") $FONT fontColour(58, 124, 165, 255) textColour(58, 124, 165, 255)

button bounds(0, 0, 30, 24) channel("button10014") fontColour:0(0, 0, 0, 255) fontSize(1) colour:0(152, 114, 114, 255) colour:1(109, 3, 173, 255) text("off", "on")
}


</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-m0 -n -d 
</CsOptions>
<CsInstruments>

  sr   = 48000
  ksmps   = 10
  nchnls   = 2
  0dbfs  = 1

;***************************************************
;ftables
giSine	ftgen	0, 0, 65536, 10, 1			; sine wave
gifftsize 	= 1024
chnset gifftsize, "fftsize"
giFftTabSize	= (gifftsize / 2)+1
gifna     	ftgen   1 ,0 ,giFftTabSize, 7, 0, giFftTabSize, 0   	; for pvs analysis
gifnf     	ftgen   2 ,0 ,giFftTabSize, 7, 0, giFftTabSize, 0   	; for pvs analysis
giSinEnv        ftgen   0, 0, 8192, 19, 1, 0.5, 270, 0.5        ; sinoid transient envelope shape for 

;soundfiles
giSoundfile1	ftgen	0, 0, 0, 1, "cello.wav", 0, 0, 0			; soundfile

; classic waveforms
giSine		ftgen	0, 0, 65537, 10, 1					; sine wave
giCosine	ftgen	0, 0, 8193, 9, 1, 1, 90					; cosine wave
giTri		ftgen	0, 0, 8193, 7, 0, 2048, 1, 4096, -1, 2048, 0		; triangle wave 

; grain envelope tables
giSigmoRise 	ftgen	0, 0, 8193, 19, 0.5, 1, 270, 1				; rising sigmoid
giSigmoFall 	ftgen	0, 0, 8193, 19, 0.5, 1, 90, 1				; falling sigmoid
giExpFall	ftgen	0, 0, 8193, 5, 1, 8193, 0.00001				; exponential decay
giTriangleWin 	ftgen	0, 0, 8193, 7, 0, 4096, 1, 4096, 0			; triangular window 



;parameters to change
;grain rate
;grain dur
;freq 
;ad ratio
;random mask
;channel mask
;waveamptamp to do a sort of morphing thing between sines and samples
;fm PITCH
;Fm Index

;channels
/* 
Freq
GrainRate
Dur
Envelope
RndMask
Distribution
FmFreq
FmIndex 

_______randomness______
betarandomness:
	range
	alpha
	beta

gauss:
	range
	amp
	freq
	mean
*/


;random distribution around a center  value (mean) with an amplitude, which is how
;wide the distribution is basically
;frequency is how often it changes
;xamp scales the output

opcode RandomGaus, k, kkkk
	kRange, kRandAmp, kRandFreq, kMean xin
	kRandOut gaussi kRange, kRandAmp, kRandFreq
	kRandOut += kMean
	xout kRandOut
endop

;beta randomness
;kRand betarand krange, kalpha, kbeta


;chnget "Seconds"
;freq = 1/seconds 




;granular synth
instr Grain1
	; amp
	kamp = ampdbfs(-20)

	; select source waveforms
	kwaveform1 = giSine		; source audio waveform 1
	kwave1Single	= 1			; flag to set if waveform is single cycle (set to zero for sampled waveforms)
	kwaveform2	= giSine		; source audio waveform 2
	kwave2Single	= 1		; flag to set if waveform is single cycle (set to zero for sampled waveforms)
	kwaveform3	= giSine  ; source audio waveform 3
	kwave3Single	= 1		; flag to set if waveform is single cycle (set to zero for sampled waveforms)
	kwaveform4	= giSine	; source audio waveform 4
	kwave4Single	= 1		; flag to set if waveform is single cycle (set to zero for sampled waveforms)

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
	isamplepos2	= 0			; initial phase for wave source 2
	isamplepos3	= 0		; initial phase for wave source 3
	isamplepos4	= 0		; initial phase for wave source 4

	kTimeRate = 1 				; time pointer rate
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
	;kwavfreq chnget "Freq"
	kwavfreq RandomGaus 100, 0.1, 0.5, 400

	;kgrainrate chnget "GrainRate"
	kgrainrate RandomGaus 100, 0.1, 0.5, 150
	agrainrate interp kgrainrate

	;grain duration     
	;kgraindur chnget "Dur"                                                                  
	kgraindur = 10 ;linseg 1, 10, 20, 40, 50
	kduration	= (kgraindur*1000)/kgrainrate	; grain dur in milliseconds, relative to grain rate

	; grain shape
	;ka_d_ratio chnget "Envelope"
	ka_d_ratio = 0.5
	ksustain_amount	= 0	 ; balance between enveloped time(attack+decay) and sustain level time, 0.0 = no time at sustain level

	; masking
	igainmasks = -1 ;ftgentmp	0, 0, 16, -2, 0.1, 0.1, 0.1, 0.1
	ichannelmasks	ftgentmp	0, 0, 16, -2,  0, 0,  0.5

	;krandommask chnget "RndMask"
	krandommask = 0


    ;modulation of waveform amplitude
/*     kwgain1 limit ((1-kWaveX)*(1-kWaveY)), 0, 1
    kwgain2 limit (kWaveX*(1-kWaveY)), 0, 1
    kwgain3 limit ((1-kWaveX)*kWaveY), 0, 1
    kwgain4 limit (kWaveX*kWaveY), 0, 1
    tablew kwgain1, 2, iwaveamptab
    tablew kwgain2, 3, iwaveamptab
    tablew kwgain3, 5, iwaveamptab
    tablew kwgain4, 4, iwaveamptab */

	iwaveamptab ftgentmp 0, 0, 32, -2, 		0, 1, 	1, 0, 0, 0, 0

	;kdistribution chnget "Distribution"
	kdistribution = 0
	idisttab ftgen 0, 0, 32768, 7, 0, 32768, 1 


	; other parameters that we do not yet need to touch
	ienv_attack = giSigmoRise ; grain attack shape (from table)
	ienv_decay = giSigmoFall ; grain decay shape (from table)
	async 		= 0.0	; external sync signal, can be used to trigger single grains or offset the internal clock
	kenv2amt = -1 ; secondary grain envelope (amount)
	ienv2tab = -1 ; secondary grain envelope shape
	ksweepshape = 0 ; pitch sweep shape for each grain
	iwavfreqstarttab = -1 ; table for pitch sweep start points
	iwavfreqendtab = -1 ; table for pitch sweep end points

	; FM of grain pitch (playback speed)
	;kPitchFmFreq chnget "FmFreq"
	kPitchFmFreq	= 200				; FM freq, modulating waveform pitch

	;kPitchFmIndex chnget "FmIndex"
	kPitchFmIndex RandomGaus 30, 1, 0.5, 5 ;linseg 10, 20, 1, 20, 2, 20, 3			; FM index, modulating waveform pitch
	
	iPitchFmWave	= giSine						; FM waveform, modulating waveform pitch
	ifmamptab	ftgentmp	0, 0, 16, -2, 0, 0,   1			; FM index scalers, per grain
	ifmenv		= giTriangleWin 					; FM index envelope, over each grain (from table)
	kPitchFmIndex	= kPitchFmIndex + (kPitchFmIndex*kPitchFmFreq*0.00001) 	; FM index scaling formula
	awavfm	oscil	kPitchFmIndex, kPitchFmFreq, iPitchFmWave		; Modulator signal for frequency 

	
	ktraincps = 0 ; trainlet cps
	knumpartials = 0 ; number of partials in trainlet
	kchroma = 0 ; chroma of trainlet
	kwaveform2 = kwaveform2 ; in the simplest version we only use waveform1
	kwaveform3 = kwaveform3 ; in the simplest version we only use waveform1
	kwaveform4 = kwaveform4 ; in the simplest version we only use waveform1
	asamplepos2 = asamplepos2 ; in the simplest version we only use waveform1
	asamplepos3 = asamplepos3 ; in the simplest version we only use waveform1
	asamplepos4 = asamplepos4 ; in the simplest version we only use waveform1
	kwavekey2 = kwavekey2 ; in the simplest version we only use waveform1
	kwavekey3 = kwavekey3 ; in the simplest version we only use waveform1
	kwavekey4 = kwavekey4 ; in the simplest version we only use waveform1
	imax_grains = 100 ; max grains in one k-period (set and forget)

	a1,a2 partikkel agrainrate, kdistribution, idisttab, async, kenv2amt, ienv2tab, \
		ienv_attack, ienv_decay, ksustain_amount, ka_d_ratio, kduration, kamp, igainmasks, \
		kwavfreq, ksweepshape, iwavfreqstarttab, iwavfreqendtab, awavfm, \
		ifmamptab, ifmenv, giCosine, ktraincps, knumpartials, kchroma, \
		ichannelmasks, krandommask,  kwaveform1, kwaveform2, kwaveform3, kwaveform4, \
		iwaveamptab, asamplepos1, asamplepos2, asamplepos3, asamplepos4, \
		kwavekey1, kwavekey2, kwavekey3, kwavekey4, imax_grains 

	;outs a1, a2
endin

</CsInstruments>
<CsScore>
;  start  dur
i1   0     60
</CsScore>
</CsoundSynthesizer>
