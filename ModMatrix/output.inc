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

tablew 0, 0, giModScale ; MorphX to MixX
tablew 0, 1, giModScale ; MorphX to MixY
tablew 0, 2, giModScale ; MorphX to Delay
tablew 0, 3, giModScale ; MorphX to LPF
tablew 0, 4, giModScale ; MorphX to SendAmount
tablew 0, 5, giModScale ; MorphX to DistortAmount
tablew 0, 6, giModScale ; MorphX to Shape
tablew 0, 7, giModScale ; MorphX to LfoFreq
tablew 0, 8, giModScale ; MorphX to LfoAmp
tablew 0, 9, giModScale ; MorphY to MixX
tablew 0, 10, giModScale ; MorphY to MixY
tablew 0, 11, giModScale ; MorphY to Delay
tablew 0, 12, giModScale ; MorphY to LPF
tablew 0, 13, giModScale ; MorphY to SendAmount
tablew 0, 14, giModScale ; MorphY to DistortAmount
tablew 0, 15, giModScale ; MorphY to Shape
tablew 0, 16, giModScale ; MorphY to LfoFreq
tablew 0, 17, giModScale ; MorphY to LfoAmp
tablew 0, 18, giModScale ; Audiodescriptor1 to MixX
tablew 0, 19, giModScale ; Audiodescriptor1 to MixY
tablew 0, 20, giModScale ; Audiodescriptor1 to Delay
tablew 0, 21, giModScale ; Audiodescriptor1 to LPF
tablew 0, 22, giModScale ; Audiodescriptor1 to SendAmount
tablew 0, 23, giModScale ; Audiodescriptor1 to DistortAmount
tablew 0, 24, giModScale ; Audiodescriptor1 to Shape
tablew 0, 25, giModScale ; Audiodescriptor1 to LfoFreq
tablew 0, 26, giModScale ; Audiodescriptor1 to LfoAmp
tablew 0, 27, giModScale ; Audiodescriptor2 to MixX
tablew 0, 28, giModScale ; Audiodescriptor2 to MixY
tablew 0, 29, giModScale ; Audiodescriptor2 to Delay
tablew 0, 30, giModScale ; Audiodescriptor2 to LPF
tablew 0, 31, giModScale ; Audiodescriptor2 to SendAmount
tablew 0, 32, giModScale ; Audiodescriptor2 to DistortAmount
tablew 0, 33, giModScale ; Audiodescriptor2 to Shape
tablew 0, 34, giModScale ; Audiodescriptor2 to LfoFreq
tablew 0, 35, giModScale ; Audiodescriptor2 to LfoAmp
tablew 0, 36, giModScale ; Audiodescriptor3 to MixX
tablew 0, 37, giModScale ; Audiodescriptor3 to MixY
tablew 0, 38, giModScale ; Audiodescriptor3 to Delay
tablew 0, 39, giModScale ; Audiodescriptor3 to LPF
tablew 0, 40, giModScale ; Audiodescriptor3 to SendAmount
tablew 0, 41, giModScale ; Audiodescriptor3 to DistortAmount
tablew 0, 42, giModScale ; Audiodescriptor3 to Shape
tablew 0, 43, giModScale ; Audiodescriptor3 to LfoFreq
tablew 0, 44, giModScale ; Audiodescriptor3 to LfoAmp
tablew 0, 45, giModScale ; Audiodescriptor4 to MixX
tablew 0, 46, giModScale ; Audiodescriptor4 to MixY
tablew 0, 47, giModScale ; Audiodescriptor4 to Delay
tablew 0, 48, giModScale ; Audiodescriptor4 to LPF
tablew 0, 49, giModScale ; Audiodescriptor4 to SendAmount
tablew 0, 50, giModScale ; Audiodescriptor4 to DistortAmount
tablew 0, 51, giModScale ; Audiodescriptor4 to Shape
tablew 0, 52, giModScale ; Audiodescriptor4 to LfoFreq
tablew 0, 53, giModScale ; Audiodescriptor4 to LfoAmp
tablew 0, 54, giModScale ; Audiodescriptor5 to MixX
tablew 0, 55, giModScale ; Audiodescriptor5 to MixY
tablew 0, 56, giModScale ; Audiodescriptor5 to Delay
tablew 0, 57, giModScale ; Audiodescriptor5 to LPF
tablew 0, 58, giModScale ; Audiodescriptor5 to SendAmount
tablew 0, 59, giModScale ; Audiodescriptor5 to DistortAmount
tablew 0, 60, giModScale ; Audiodescriptor5 to Shape
tablew 0, 61, giModScale ; Audiodescriptor5 to LfoFreq
tablew 0, 62, giModScale ; Audiodescriptor5 to LfoAmp
tablew 0, 63, giModScale ; Audiodescriptor6 to MixX
tablew 0, 64, giModScale ; Audiodescriptor6 to MixY
tablew 0, 65, giModScale ; Audiodescriptor6 to Delay
tablew 0, 66, giModScale ; Audiodescriptor6 to LPF
tablew 0, 67, giModScale ; Audiodescriptor6 to SendAmount
tablew 0, 68, giModScale ; Audiodescriptor6 to DistortAmount
tablew 0, 69, giModScale ; Audiodescriptor6 to Shape
tablew 0, 70, giModScale ; Audiodescriptor6 to LfoFreq
tablew 0, 71, giModScale ; Audiodescriptor6 to LfoAmp
tablew 0, 72, giModScale ; LFO to MixX
tablew 0, 73, giModScale ; LFO to MixY
tablew 0, 74, giModScale ; LFO to Delay
tablew 0, 75, giModScale ; LFO to LPF
tablew 0, 76, giModScale ; LFO to SendAmount
tablew 0, 77, giModScale ; LFO to DistortAmount
tablew 0, 78, giModScale ; LFO to Shape
tablew 0, 79, giModScale ; LFO to LfoFreq
tablew 0, 80, giModScale ; LFO to LfoAmp


;input_channels to be read for input___________________________ 

kMorphX chnget "MorphX"
kMorphY chnget "MorphY"
kAudiodescriptor1 chnget "Audiodescriptor1"
kAudiodescriptor2 chnget "Audiodescriptor2"
kAudiodescriptor3 chnget "Audiodescriptor3"
kAudiodescriptor4 chnget "Audiodescriptor4"
kAudiodescriptor5 chnget "Audiodescriptor5"
kAudiodescriptor6 chnget "Audiodescriptor6"
kLFO chnget "LFO"


;modulators___________________________ 

tablew kMorphX, 0, giModulators
tablew kMorphY, 1, giModulators
tablew kAudiodescriptor1, 2, giModulators
tablew kAudiodescriptor2, 3, giModulators
tablew kAudiodescriptor3, 4, giModulators
tablew kAudiodescriptor4, 5, giModulators
tablew kAudiodescriptor5, 6, giModulators
tablew kAudiodescriptor6, 7, giModulators
tablew kLFO, 8, giModulators


; get the update flag
kupdate	init 1 ;chnget	"modulatorUpdateFlag"
inum_mod = 9
inum_param = 9
modmatrix giParam_Out, giModulators, giParam_In, giModScale, inum_mod, inum_param, kupdate
;output parameters___________________________ 

kMixXOut table 0, giParam_Out
kMixYOut table 1, giParam_Out
kDelayOut table 2, giParam_Out
kLPFOut table 3, giParam_Out
kSendAmountOut table 4, giParam_Out
kDistortAmountOut table 5, giParam_Out
kShapeOut table 6, giParam_Out
kLfoFreqOut table 7, giParam_Out
kLfoAmpOut table 8, giParam_Out


;channels to read parameters from___________________________ 

kwhen init 0

kmetro metro 5

kwhen += kmetro

kwhen = (kwhen%100)+1


cabbageSetValue "MixXOut", kMixXOut
OSCsend kMixXOut, "127.0.0.1", 9998, "/track/1/fx/1/fxparam/1/value", "f", kMixXOut
cabbageSetValue "MixYOut", kMixYOut
OSCsend kMixYOut, "127.0.0.1", 9998, "/track/1/fx/1/fxparam/2/value", "f", kMixYOut
cabbageSetValue "DelayOut", kDelayOut
OSCsend kDelayOut, "127.0.0.1", 9998, "/track/1/fx/1/fxparam/3/value", "f", kDelayOut
cabbageSetValue "LPFOut", kLPFOut
OSCsend kLPFOut, "127.0.0.1", 9998, "/track/1/fx/1/fxparam/4/value", "f", kLPFOut
cabbageSetValue "SendAmountOut", kSendAmountOut
OSCsend kSendAmountOut, "127.0.0.1", 9998, "/track/1/fx/2/fxparam/1/value", "f", kSendAmountOut
cabbageSetValue "DistortAmountOut", kDistortAmountOut
OSCsend kDistortAmountOut, "127.0.0.1", 9998, "/track/1/fx/2/fxparam/2/value", "f", kDistortAmountOut
cabbageSetValue "ShapeOut", kShapeOut
OSCsend kShapeOut, "127.0.0.1", 9998, "/track/1/fx/2/fxparam/3/value", "f", kShapeOut
cabbageSetValue "LfoFreqOut", kLfoFreqOut
OSCsend kLfoFreqOut, "127.0.0.1", 9998, "/track/1/fx/2/fxparam/4/value", "f", kLfoFreqOut
cabbageSetValue "LfoAmpOut", kLfoAmpOut
OSCsend kLfoAmpOut, "127.0.0.1", 9998, "/track/1/fx/2/fxparam/5/value", "f", kLfoAmpOut


