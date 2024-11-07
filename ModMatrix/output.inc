;____________________________________ 

;parameter definitions 

kMixXIn chnget "MixXIn"
kMixYIn chnget "MixYIn"
kDelayIn chnget "DelayIn"
kLPFIn chnget "LPFIn"
kSendAmountIn chnget "SendAmountIn"
kDistortAmountIn chnget "DistortAmountIn"
kShapeIn chnget "ShapeIn"
kLfoFreqIn chnget "LfoFreqIn"
kLfoAmpIn chnget "LfoAmpIn"


;input parameters 

tablew kMixXIn, 0, giParam_In
tablew kMixYIn, 1, giParam_In
tablew kDelayIn, 2, giParam_In
tablew kLPFIn, 3, giParam_In
tablew kSendAmountIn, 4, giParam_In
tablew kDistortAmountIn, 5, giParam_In
tablew kShapeIn, 6, giParam_In
tablew kLfoFreqIn, 7, giParam_In
tablew kLfoAmpIn, 8, giParam_In


;coefficients:___________________________________________ 

tablew 4, 0, giModScale ; MorphX to MixX
tablew 567, 1, giModScale ; MorphX to MixY
tablew 35, 2, giModScale ; MorphX to Delay
tablew 43, 3, giModScale ; MorphX to LPF
tablew 434, 4, giModScale ; MorphX to SendAmount
tablew 17, 5, giModScale ; MorphX to DistortAmount
tablew 235, 6, giModScale ; MorphX to Shape
tablew 23, 7, giModScale ; MorphX to LfoFreq
tablew 324234, 8, giModScale ; MorphX to LfoAmp
tablew 6, 9, giModScale ; MorphY to MixX
tablew 3, 10, giModScale ; MorphY to MixY
tablew 6, 11, giModScale ; MorphY to Delay
tablew 46, 12, giModScale ; MorphY to LPF
tablew 34, 13, giModScale ; MorphY to SendAmount
tablew 77, 14, giModScale ; MorphY to DistortAmount
tablew 453, 15, giModScale ; MorphY to Shape
tablew 543, 16, giModScale ; MorphY to LfoFreq
tablew 23546, 17, giModScale ; MorphY to LfoAmp
tablew 6, 18, giModScale ; Audiodescriptor1 to MixX
tablew 5, 19, giModScale ; Audiodescriptor1 to MixY
tablew 5656, 20, giModScale ; Audiodescriptor1 to Delay
tablew 3, 21, giModScale ; Audiodescriptor1 to LPF
tablew 5, 22, giModScale ; Audiodescriptor1 to SendAmount
tablew 88, 23, giModScale ; Audiodescriptor1 to DistortAmount
tablew 46546, 24, giModScale ; Audiodescriptor1 to Shape
tablew 534, 25, giModScale ; Audiodescriptor1 to LfoFreq
tablew 67776767, 26, giModScale ; Audiodescriptor1 to LfoAmp
tablew 7, 27, giModScale ; Audiodescriptor2 to MixX
tablew 65, 28, giModScale ; Audiodescriptor2 to MixY
tablew 34, 29, giModScale ; Audiodescriptor2 to Delay
tablew 4, 30, giModScale ; Audiodescriptor2 to LPF
tablew 43, 31, giModScale ; Audiodescriptor2 to SendAmount
tablew 99, 32, giModScale ; Audiodescriptor2 to DistortAmount
tablew 767, 33, giModScale ; Audiodescriptor2 to Shape
tablew 534, 34, giModScale ; Audiodescriptor2 to LfoFreq
tablew 6778987, 35, giModScale ; Audiodescriptor2 to LfoAmp
tablew 323, 36, giModScale ; Audiodescriptor3 to MixX
tablew 3, 37, giModScale ; Audiodescriptor3 to MixY
tablew 534, 38, giModScale ; Audiodescriptor3 to Delay
tablew 2, 39, giModScale ; Audiodescriptor3 to LPF
tablew 6, 40, giModScale ; Audiodescriptor3 to SendAmount
tablew 88, 41, giModScale ; Audiodescriptor3 to DistortAmount
tablew 67, 42, giModScale ; Audiodescriptor3 to Shape
tablew 534, 43, giModScale ; Audiodescriptor3 to LfoFreq
tablew 789, 44, giModScale ; Audiodescriptor3 to LfoAmp
tablew 23, 45, giModScale ; Expression to MixX
tablew 2, 46, giModScale ; Expression to MixY
tablew 24, 47, giModScale ; Expression to Delay
tablew 3, 48, giModScale ; Expression to LPF
tablew 2, 49, giModScale ; Expression to SendAmount
tablew 55, 50, giModScale ; Expression to DistortAmount
tablew 6, 51, giModScale ; Expression to Shape
tablew 534, 52, giModScale ; Expression to LfoFreq
tablew 879, 53, giModScale ; Expression to LfoAmp
tablew 5, 54, giModScale ; LFO to MixX
tablew 0, 55, giModScale ; LFO to MixY
tablew 34, 56, giModScale ; LFO to Delay
tablew 5, 57, giModScale ; LFO to LPF
tablew 0, 58, giModScale ; LFO to SendAmount
tablew 345, 59, giModScale ; LFO to DistortAmount
tablew 4534, 60, giModScale ; LFO to Shape
tablew 534, 61, giModScale ; LFO to LfoFreq
tablew 78, 62, giModScale ; LFO to LfoAmp


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

cabbageSetValue "MixXOut", kMixX
cabbageSetValue "MixYOut", kMixY
cabbageSetValue "DelayOut", kDelay
cabbageSetValue "LPFOut", kLPF
cabbageSetValue "SendAmountOut", kSendAmount
cabbageSetValue "DistortAmountOut", kDistortAmount
cabbageSetValue "ShapeOut", kShape
cabbageSetValue "LfoFreqOut", kLfoFreq
cabbageSetValue "LfoAmpOut", kLfoAmp


