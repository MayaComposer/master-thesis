;____________________________________ 

;parameter definitions 

iMixX = 0
iMixY = 0
iFreq = 0
iCutoff = 0
iLFOFreq = 0
iGrainRate = 0


;input parameters 

tableiw iMixX, 0, giParam_In
tableiw iMixY, 1, giParam_In
tableiw iFreq, 2, giParam_In
tableiw iCutoff, 3, giParam_In
tableiw iLFOFreq, 4, giParam_In
tableiw iGrainRate, 5, giParam_In


;coefficients:___________________________________________ 

tableiw 1, 0, giModScale ; MorphX to MixX
tableiw 0, 1, giModScale ; MorphX to MixY
tableiw 10, 2, giModScale ; MorphX to Freq
tableiw 0, 3, giModScale ; MorphX to Cutoff
tableiw 0, 4, giModScale ; MorphX to LFOFreq
tableiw 0, 5, giModScale ; MorphX to GrainRate
tableiw 0, 6, giModScale ; MorphY to MixX
tableiw 1, 7, giModScale ; MorphY to MixY
tableiw 0, 8, giModScale ; MorphY to Freq
tableiw 0, 9, giModScale ; MorphY to Cutoff
tableiw 0, 10, giModScale ; MorphY to LFOFreq
tableiw 0, 11, giModScale ; MorphY to GrainRate
tableiw 0, 12, giModScale ; Expression to MixX
tableiw 0, 13, giModScale ; Expression to MixY
tableiw 100, 14, giModScale ; Expression to Freq
tableiw 500, 15, giModScale ; Expression to Cutoff
tableiw 5, 16, giModScale ; Expression to LFOFreq
tableiw 0, 17, giModScale ; Expression to GrainRate
tableiw 0, 18, giModScale ; LFO to MixX
tableiw 0, 19, giModScale ; LFO to MixY
tableiw 10, 20, giModScale ; LFO to Freq
tableiw 50, 21, giModScale ; LFO to Cutoff
tableiw 0, 22, giModScale ; LFO to LFOFreq
tableiw 0, 23, giModScale ; LFO to GrainRate


;input_channels to be read for input___________________________ 

kMorphX chnget "MorphX"
kMorphY chnget "MorphY"
kExpression chnget "Expression"
kLFO chnget "LFO"


;modulators___________________________ 

tablew kMorphX, 0, giModulators
tablew kMorphY, 1, giModulators
tablew kExpression, 2, giModulators
tablew kLFO, 3, giModulators


