;____________________________________ 

;parameter definitions 

iMixX = 0
iMixY = 0
iFreq = 0
iCutoff = 0
iLFOFreq = 0
isdfdsf = 0
isdfdsf.1 = 0
isdfsgfdgf = 0
idfgdfgdfg = 0
isdafsadfsdafsadfsads = 0
isdfdsf.2 = 0


;input parameters 

tableiw iMixX, 0, giParam_In
tableiw iMixY, 1, giParam_In
tableiw iFreq, 2, giParam_In
tableiw iCutoff, 3, giParam_In
tableiw iLFOFreq, 4, giParam_In
tableiw isdfdsf, 5, giParam_In
tableiw isdfdsf.1, 6, giParam_In
tableiw isdfsgfdgf, 7, giParam_In
tableiw idfgdfgdfg, 8, giParam_In
tableiw isdafsadfsdafsadfsads, 9, giParam_In
tableiw isdfdsf.2, 10, giParam_In


;coefficients:___________________________________________ 

tableiw 1, 0, giModScale ; MorphX to MixX
tableiw 0, 1, giModScale ; MorphX to MixY
tableiw 10, 2, giModScale ; MorphX to Freq
tableiw 0, 3, giModScale ; MorphX to Cutoff
tableiw 0, 4, giModScale ; MorphX to LFOFreq
tableiw nan, 5, giModScale ; MorphX to sdfdsf
tableiw nan, 6, giModScale ; MorphX to sdfdsf.1
tableiw nan, 7, giModScale ; MorphX to sdfsgfdgf
tableiw nan, 8, giModScale ; MorphX to dfgdfgdfg
tableiw nan, 9, giModScale ; MorphX to sdafsadfsdafsadfsads
tableiw nan, 10, giModScale ; MorphX to sdfdsf.2
tableiw 0, 11, giModScale ; MorphY to MixX
tableiw 1, 12, giModScale ; MorphY to MixY
tableiw 0, 13, giModScale ; MorphY to Freq
tableiw 0, 14, giModScale ; MorphY to Cutoff
tableiw 0, 15, giModScale ; MorphY to LFOFreq
tableiw nan, 16, giModScale ; MorphY to sdfdsf
tableiw nan, 17, giModScale ; MorphY to sdfdsf.1
tableiw nan, 18, giModScale ; MorphY to sdfsgfdgf
tableiw nan, 19, giModScale ; MorphY to dfgdfgdfg
tableiw nan, 20, giModScale ; MorphY to sdafsadfsdafsadfsads
tableiw nan, 21, giModScale ; MorphY to sdfdsf.2
tableiw 0, 22, giModScale ; Expression to MixX
tableiw 0, 23, giModScale ; Expression to MixY
tableiw 100, 24, giModScale ; Expression to Freq
tableiw 500, 25, giModScale ; Expression to Cutoff
tableiw 5, 26, giModScale ; Expression to LFOFreq
tableiw nan, 27, giModScale ; Expression to sdfdsf
tableiw nan, 28, giModScale ; Expression to sdfdsf.1
tableiw nan, 29, giModScale ; Expression to sdfsgfdgf
tableiw nan, 30, giModScale ; Expression to dfgdfgdfg
tableiw nan, 31, giModScale ; Expression to sdafsadfsdafsadfsads
tableiw nan, 32, giModScale ; Expression to sdfdsf.2
tableiw 0, 33, giModScale ; LFO to MixX
tableiw 0, 34, giModScale ; LFO to MixY
tableiw 10, 35, giModScale ; LFO to Freq
tableiw 50, 36, giModScale ; LFO to Cutoff
tableiw 0, 37, giModScale ; LFO to LFOFreq
tableiw nan, 38, giModScale ; LFO to sdfdsf
tableiw nan, 39, giModScale ; LFO to sdfdsf.1
tableiw nan, 40, giModScale ; LFO to sdfsgfdgf
tableiw nan, 41, giModScale ; LFO to dfgdfgdfg
tableiw nan, 42, giModScale ; LFO to sdafsadfsdafsadfsads
tableiw nan, 43, giModScale ; LFO to sdfdsf.2


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


; get the update flag
kupdate	init 1 ;chnget	"modulatorUpdateFlag"
inum_mod = 4
inum_param = 11
modmatrix giParam_Out, giModulators, giParam_In, giModScale, inum_mod, inum_param, kupdate
;output parameters___________________________ 

kMixX table 0, giParam_Out
kMixY table 1, giParam_Out
kFreq table 2, giParam_Out
kCutoff table 3, giParam_Out
kLFOFreq table 4, giParam_Out
ksdfdsf table 5, giParam_Out
ksdfdsf.1 table 6, giParam_Out
ksdfsgfdgf table 7, giParam_Out
kdfgdfgdfg table 8, giParam_Out
ksdafsadfsdafsadfsads table 9, giParam_Out
ksdfdsf.2 table 10, giParam_Out


;channels to read parameters from___________________________ 

chnset kMixX, "MixX"
chnset kMixY, "MixY"
chnset kFreq, "Freq"
chnset kCutoff, "Cutoff"
chnset kLFOFreq, "LFOFreq"
chnset ksdfdsf, "sdfdsf"
chnset ksdfdsf.1, "sdfdsf.1"
chnset ksdfsgfdgf, "sdfsgfdgf"
chnset kdfgdfgdfg, "dfgdfgdfg"
chnset ksdafsadfsdafsadfsads, "sdafsadfsdafsadfsads"
chnset ksdfdsf.2, "sdfdsf.2"


;____________________________________ 

