tableiw iMixX, 0, giParam_In
tableiw iMixY, 1, giParam_In
tableiw iFreq, 2, giParam_In
tableiw iCutoff, 3, giParam_In
tableiw iLFOFreq, 4, giParam_In


tableiw 1, 0, giModScale ; MorphX to MixX
tableiw 0, 1, giModScale ; MorphX to MixY
tableiw 0, 2, giModScale ; MorphX to Freq
tableiw 0, 3, giModScale ; MorphX to Cutoff
tableiw 0, 4, giModScale ; MorphX to LFOFreq
tableiw 0, 5, giModScale ; MorphY to MixX
tableiw 1, 6, giModScale ; MorphY to MixY
tableiw 0, 7, giModScale ; MorphY to Freq
tableiw 0, 8, giModScale ; MorphY to Cutoff
tableiw 0, 9, giModScale ; MorphY to LFOFreq
tableiw 0, 10, giModScale ; Expression to MixX
tableiw 0, 11, giModScale ; Expression to MixY
tableiw 100, 12, giModScale ; Expression to Freq
tableiw 500, 13, giModScale ; Expression to Cutoff
tableiw 5, 14, giModScale ; Expression to LFOFreq
tableiw 0, 15, giModScale ; LFO to MixX
tableiw 0, 16, giModScale ; LFO to MixY
tableiw 10, 17, giModScale ; LFO to Freq
tableiw 50, 18, giModScale ; LFO to Cutoff
tableiw 0, 19, giModScale ; LFO to LFOFreq


kMorphX chnget "MorphX"
kMorphY chnget "MorphY"
kExpression chnget "Expression"
kLFO chnget "LFO"
tablew kMorphX, 0, .giModulators
tablew kMorphY, 1, .giModulators
tablew kExpression, 2, .giModulators
tablew kLFO, 3, .giModulators
kMixX table 0, giParam_Out
kMixY table 1, giParam_Out
kFreq table 2, giParam_Out
kCutoff table 3, giParam_Out
kLFOFreq table 4, giParam_Out


