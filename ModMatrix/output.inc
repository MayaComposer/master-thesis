;____________________________________ 

;parameter definitions 

iMixX = 0
iMixY = 0
iDelay = 0
iLPF = 0
iSendAmount = 0
iDistortAmount = 0
iShape = 0
iLfoFreq = 0
iLfoAmp = 0


;input parameters 

tableiw iMixX, 0, giParam_In
tableiw iMixY, 1, giParam_In
tableiw iDelay, 2, giParam_In
tableiw iLPF, 3, giParam_In
tableiw iSendAmount, 4, giParam_In
tableiw iDistortAmount, 5, giParam_In
tableiw iShape, 6, giParam_In
tableiw iLfoFreq, 7, giParam_In
tableiw iLfoAmp, 8, giParam_In


;coefficients:___________________________________________ 

tableiw 1, 0, giModScale ; MorphX to MixX
tableiw 0, 1, giModScale ; MorphX to MixY
tableiw 0, 2, giModScale ; MorphX to Delay
tableiw 0, 3, giModScale ; MorphX to LPF
tableiw 0, 4, giModScale ; MorphX to SendAmount
tableiw 0, 5, giModScale ; MorphX to DistortAmount
tableiw 0, 6, giModScale ; MorphX to Shape
tableiw 0, 7, giModScale ; MorphX to LfoFreq
tableiw 0, 8, giModScale ; MorphX to LfoAmp
tableiw 0, 9, giModScale ; MorphY to MixX
tableiw 1, 10, giModScale ; MorphY to MixY
tableiw 0, 11, giModScale ; MorphY to Delay
tableiw 0, 12, giModScale ; MorphY to LPF
tableiw 0, 13, giModScale ; MorphY to SendAmount
tableiw 0, 14, giModScale ; MorphY to DistortAmount
tableiw 0, 15, giModScale ; MorphY to Shape
tableiw 0, 16, giModScale ; MorphY to LfoFreq
tableiw 0, 17, giModScale ; MorphY to LfoAmp
tableiw 0, 18, giModScale ; Audiodescriptor1 to MixX
tableiw 0, 19, giModScale ; Audiodescriptor1 to MixY
tableiw 0, 20, giModScale ; Audiodescriptor1 to Delay
tableiw 0, 21, giModScale ; Audiodescriptor1 to LPF
tableiw 0, 22, giModScale ; Audiodescriptor1 to SendAmount
tableiw 0, 23, giModScale ; Audiodescriptor1 to DistortAmount
tableiw 0, 24, giModScale ; Audiodescriptor1 to Shape
tableiw 20, 25, giModScale ; Audiodescriptor1 to LfoFreq
tableiw 0, 26, giModScale ; Audiodescriptor1 to LfoAmp
tableiw 0, 27, giModScale ; Audiodescriptor2 to MixX
tableiw 0, 28, giModScale ; Audiodescriptor2 to MixY
tableiw 0, 29, giModScale ; Audiodescriptor2 to Delay
tableiw 0, 30, giModScale ; Audiodescriptor2 to LPF
tableiw 0, 31, giModScale ; Audiodescriptor2 to SendAmount
tableiw 0, 32, giModScale ; Audiodescriptor2 to DistortAmount
tableiw 0, 33, giModScale ; Audiodescriptor2 to Shape
tableiw 20, 34, giModScale ; Audiodescriptor2 to LfoFreq
tableiw 0, 35, giModScale ; Audiodescriptor2 to LfoAmp
tableiw 0, 36, giModScale ; Audiodescriptor3 to MixX
tableiw 0, 37, giModScale ; Audiodescriptor3 to MixY
tableiw 0, 38, giModScale ; Audiodescriptor3 to Delay
tableiw 0, 39, giModScale ; Audiodescriptor3 to LPF
tableiw 0, 40, giModScale ; Audiodescriptor3 to SendAmount
tableiw 0, 41, giModScale ; Audiodescriptor3 to DistortAmount
tableiw 0, 42, giModScale ; Audiodescriptor3 to Shape
tableiw 0, 43, giModScale ; Audiodescriptor3 to LfoFreq
tableiw 0, 44, giModScale ; Audiodescriptor3 to LfoAmp
tableiw 0, 45, giModScale ; Expression to MixX
tableiw 0, 46, giModScale ; Expression to MixY
tableiw 100, 47, giModScale ; Expression to Delay
tableiw 500, 48, giModScale ; Expression to LPF
tableiw 5, 49, giModScale ; Expression to SendAmount
tableiw 0, 50, giModScale ; Expression to DistortAmount
tableiw 0, 51, giModScale ; Expression to Shape
tableiw 0, 52, giModScale ; Expression to LfoFreq
tableiw 0, 53, giModScale ; Expression to LfoAmp
tableiw 0, 54, giModScale ; LFO to MixX
tableiw 0, 55, giModScale ; LFO to MixY
tableiw 10, 56, giModScale ; LFO to Delay
tableiw 50, 57, giModScale ; LFO to LPF
tableiw 0, 58, giModScale ; LFO to SendAmount
tableiw 0, 59, giModScale ; LFO to DistortAmount
tableiw 0, 60, giModScale ; LFO to Shape
tableiw 0, 61, giModScale ; LFO to LfoFreq
tableiw 0, 62, giModScale ; LFO to LfoAmp


;input_channels to be read for input___________________________ 

kMorphX chnget "MorphX"
kMorphY chnget "MorphY"
kAudiodescriptor1 chnget "Audiodescriptor1"
kAudiodescriptor2 chnget "Audiodescriptor2"
kAudiodescriptor3 chnget "Audiodescriptor3"
kExpression chnget "Expression"
kLFO chnget "LFO"


;modulators___________________________ 

tablew kMorphX, 0, giModulators
tablew kMorphY, 1, giModulators
tablew kAudiodescriptor1, 2, giModulators
tablew kAudiodescriptor2, 3, giModulators
tablew kAudiodescriptor3, 4, giModulators
tablew kExpression, 5, giModulators
tablew kLFO, 6, giModulators


; get the update flag
kupdate	init 1 ;chnget	"modulatorUpdateFlag"
inum_mod = 7
inum_param = 9
modmatrix giParam_Out, giModulators, giParam_In, giModScale, inum_mod, inum_param, kupdate
;output parameters___________________________ 

kMixX table 0, giParam_Out
kMixY table 1, giParam_Out
kDelay table 2, giParam_Out
kLPF table 3, giParam_Out
kSendAmount table 4, giParam_Out
kDistortAmount table 5, giParam_Out
kShape table 6, giParam_Out
kLfoFreq table 7, giParam_Out
kLfoAmp table 8, giParam_Out


;channels to read parameters from___________________________ 

chnset kMixX, "MixX"
chnset kMixY, "MixY"
chnset kDelay, "Delay"
chnset kLPF, "LPF"
chnset kSendAmount, "SendAmount"
chnset kDistortAmount, "DistortAmount"
chnset kShape, "Shape"
chnset kLfoFreq, "LfoFreq"
chnset kLfoAmp, "LfoAmp"


