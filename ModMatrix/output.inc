;____________________________________ 

;parameter definitions 

kMixX chnget "MixXIn"
kMixY chnget "MixYIn"
kDelay chnget "DelayIn"
kLPF chnget "LPFIn"
kSendAmount chnget "SendAmountIn"
kDistortAmount chnget "DistortAmountIn"
kShape chnget "ShapeIn"
kLfoFreq chnget "LfoFreqIn"
kLfoAmp chnget "LfoAmpIn"
kSmackidiboo chnget "SmackidibooIn"


;input parameters 

tablew kMixX, 0, giParam_In
tablew kMixY, 1, giParam_In
tablew kDelay, 2, giParam_In
tablew kLPF, 3, giParam_In
tablew kSendAmount, 4, giParam_In
tablew kDistortAmount, 5, giParam_In
tablew kShape, 6, giParam_In
tablew kLfoFreq, 7, giParam_In
tablew kLfoAmp, 8, giParam_In
tablew kSmackidiboo, 9, giParam_In


;coefficients:___________________________________________ 

tablew 1, 0, giModScale ; MorphX to MixX
tablew 0, 1, giModScale ; MorphX to MixY
tablew 0, 2, giModScale ; MorphX to Delay
tablew 0, 3, giModScale ; MorphX to LPF
tablew 0, 4, giModScale ; MorphX to SendAmount
tablew 0, 5, giModScale ; MorphX to DistortAmount
tablew 0, 6, giModScale ; MorphX to Shape
tablew 0, 7, giModScale ; MorphX to LfoFreq
tablew 0, 8, giModScale ; MorphX to LfoAmp
tablew 0, 9, giModScale ; MorphX to Smackidiboo
tablew 0, 10, giModScale ; MorphY to MixX
tablew 1, 11, giModScale ; MorphY to MixY
tablew 0, 12, giModScale ; MorphY to Delay
tablew 0, 13, giModScale ; MorphY to LPF
tablew 0, 14, giModScale ; MorphY to SendAmount
tablew 0, 15, giModScale ; MorphY to DistortAmount
tablew 0, 16, giModScale ; MorphY to Shape
tablew 0, 17, giModScale ; MorphY to LfoFreq
tablew 0, 18, giModScale ; MorphY to LfoAmp
tablew 0, 19, giModScale ; MorphY to Smackidiboo
tablew 0, 20, giModScale ; Audiodescriptor1 to MixX
tablew 0, 21, giModScale ; Audiodescriptor1 to MixY
tablew 0, 22, giModScale ; Audiodescriptor1 to Delay
tablew 0, 23, giModScale ; Audiodescriptor1 to LPF
tablew 0, 24, giModScale ; Audiodescriptor1 to SendAmount
tablew 0, 25, giModScale ; Audiodescriptor1 to DistortAmount
tablew 0, 26, giModScale ; Audiodescriptor1 to Shape
tablew 20, 27, giModScale ; Audiodescriptor1 to LfoFreq
tablew 0, 28, giModScale ; Audiodescriptor1 to LfoAmp
tablew 0, 29, giModScale ; Audiodescriptor1 to Smackidiboo
tablew 0, 30, giModScale ; Audiodescriptor2 to MixX
tablew 0, 31, giModScale ; Audiodescriptor2 to MixY
tablew 0, 32, giModScale ; Audiodescriptor2 to Delay
tablew 0, 33, giModScale ; Audiodescriptor2 to LPF
tablew 0, 34, giModScale ; Audiodescriptor2 to SendAmount
tablew 0, 35, giModScale ; Audiodescriptor2 to DistortAmount
tablew 0, 36, giModScale ; Audiodescriptor2 to Shape
tablew 20, 37, giModScale ; Audiodescriptor2 to LfoFreq
tablew 0, 38, giModScale ; Audiodescriptor2 to LfoAmp
tablew 0, 39, giModScale ; Audiodescriptor2 to Smackidiboo
tablew 0, 40, giModScale ; Audiodescriptor3 to MixX
tablew 0, 41, giModScale ; Audiodescriptor3 to MixY
tablew 0, 42, giModScale ; Audiodescriptor3 to Delay
tablew 0, 43, giModScale ; Audiodescriptor3 to LPF
tablew 0, 44, giModScale ; Audiodescriptor3 to SendAmount
tablew 0, 45, giModScale ; Audiodescriptor3 to DistortAmount
tablew 0, 46, giModScale ; Audiodescriptor3 to Shape
tablew 0, 47, giModScale ; Audiodescriptor3 to LfoFreq
tablew 0, 48, giModScale ; Audiodescriptor3 to LfoAmp
tablew 0, 49, giModScale ; Audiodescriptor3 to Smackidiboo
tablew 0, 50, giModScale ; Expression to MixX
tablew 0, 51, giModScale ; Expression to MixY
tablew 100, 52, giModScale ; Expression to Delay
tablew 500, 53, giModScale ; Expression to LPF
tablew 5, 54, giModScale ; Expression to SendAmount
tablew 0, 55, giModScale ; Expression to DistortAmount
tablew 0, 56, giModScale ; Expression to Shape
tablew 0, 57, giModScale ; Expression to LfoFreq
tablew 0, 58, giModScale ; Expression to LfoAmp
tablew 0, 59, giModScale ; Expression to Smackidiboo
tablew 0, 60, giModScale ; LFO to MixX
tablew 0, 61, giModScale ; LFO to MixY
tablew 10, 62, giModScale ; LFO to Delay
tablew 50, 63, giModScale ; LFO to LPF
tablew 0, 64, giModScale ; LFO to SendAmount
tablew 0, 65, giModScale ; LFO to DistortAmount
tablew 0, 66, giModScale ; LFO to Shape
tablew 0, 67, giModScale ; LFO to LfoFreq
tablew 0, 68, giModScale ; LFO to LfoAmp
tablew 0, 69, giModScale ; LFO to Smackidiboo


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
inum_param = 10
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
kSmackidiboo table 9, giParam_Out


;channels to read parameters from___________________________ 

chnset kMixX, "MixXOut"
chnset kMixY, "MixYOut"
chnset kDelay, "DelayOut"
chnset kLPF, "LPFOut"
chnset kSendAmount, "SendAmountOut"
chnset kDistortAmount, "DistortAmountOut"
chnset kShape, "ShapeOut"
chnset kLfoFreq, "LfoFreqOut"
chnset kLfoAmp, "LfoAmpOut"
chnset kSmackidiboo, "SmackidibooOut"


