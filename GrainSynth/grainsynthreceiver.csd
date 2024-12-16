grainsynthreceiver
instr Receiver
	
	;GRAIN RATE	
	kGrainRate init 0
	kInputCheck1 OSClisten giOscHandler, "GrainRateOut", "f", kGrainRate

	; chnset kGrainRate, "GrainRateSlider"
	; kGrainRateAmp chnget "GrainRateAmp"
	; kGrainRateFreq chnget "GrainRateFreq"

	; ;DURATION______________________________________________________
	; kDurSlider chnget "DurSlider"
	; kDurAmp chnget "DurAmp"
	; kDurFreq chnget "DurFreq"

	kDur init 0
	kInputCheck2 OSClisten giOscHandler, "DurationOut", "f", kDur

	chnset kDur, "DurSlider"

	; ;FREQUENCY_____________________________________________________
	; kFreqSlider chnget "FreqSlider"
	; kFreqAmp chnget "FreqAmp"
	; kFreqFreq chnget "FreqFreq" ;this is kinda dirty, oh well

	; kFreq init 0
	; kInputCheck3 init 0
	; kInputCheck3 OSClisten giOscHandler, "GrainRateOut", "f", kFreq

	; chnset kFreq, "FreqSlider"

	; ; kAdSlider chnget "Envelope"

	; kEnv init 0
	; kInputCheck4 init 0
	; kInputCheck4 OSClisten giOscHandler, "GrainRateOut", "f", kEnv

	; chnset kEnv, "Envelope"

	; ; kRndMaskSlider chnget "RndMask"

	; kRndMask init 0
	; kInputCheck5 init 0
	; kInputCheck5 OSClisten giOscHandler, "GrainRateOut", "f", kRndMask

	; chnset kRndMask, "RndMask"

	; kdistribution chnget "Distribution"

	
endin	