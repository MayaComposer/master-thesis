;____________________________________ 

;parameter definitions 

kGrainRateIn chnget "GrainRateIn"
kDurationIn chnget "DurationIn"
kFreqIn chnget "FreqIn"
kFmPitchIn chnget "FmPitchIn"
kFmIndexIn chnget "FmIndexIn"
kEnvIn chnget "EnvIn"
kDistrIn chnget "DistrIn"
kRndMaskIn chnget "RndMaskIn"


;input parameters 

tablew kGrainRateIn, 0, giParam_In
tablew kDurationIn, 1, giParam_In
tablew kFreqIn, 2, giParam_In
tablew kFmPitchIn, 3, giParam_In
tablew kFmIndexIn, 4, giParam_In
tablew kEnvIn, 5, giParam_In
tablew kDistrIn, 6, giParam_In
tablew kRndMaskIn, 7, giParam_In


;coefficients:___________________________________________ 

tablew 0, 0, giModScale ; Mousex to GrainRate
tablew 0, 1, giModScale ; Mousex to Duration
tablew 0, 2, giModScale ; Mousex to Freq
tablew 0, 3, giModScale ; Mousex to FmPitch
tablew 0, 4, giModScale ; Mousex to FmIndex
tablew 0, 5, giModScale ; Mousex to Env
tablew 0, 6, giModScale ; Mousex to Distr
tablew 0, 7, giModScale ; Mousex to RndMask
tablew 0, 8, giModScale ; Mousey to GrainRate
tablew 0, 9, giModScale ; Mousey to Duration
tablew 0, 10, giModScale ; Mousey to Freq
tablew 0, 11, giModScale ; Mousey to FmPitch
tablew 0, 12, giModScale ; Mousey to FmIndex
tablew 0, 13, giModScale ; Mousey to Env
tablew 0, 14, giModScale ; Mousey to Distr
tablew 0, 15, giModScale ; Mousey to RndMask
tablew 0, 16, giModScale ; Audiodescriptor1 to GrainRate
tablew 0, 17, giModScale ; Audiodescriptor1 to Duration
tablew 0, 18, giModScale ; Audiodescriptor1 to Freq
tablew 0, 19, giModScale ; Audiodescriptor1 to FmPitch
tablew 0, 20, giModScale ; Audiodescriptor1 to FmIndex
tablew 0, 21, giModScale ; Audiodescriptor1 to Env
tablew 0, 22, giModScale ; Audiodescriptor1 to Distr
tablew 0, 23, giModScale ; Audiodescriptor1 to RndMask
tablew 0, 24, giModScale ; Audiodescriptor2 to GrainRate
tablew 0, 25, giModScale ; Audiodescriptor2 to Duration
tablew 0, 26, giModScale ; Audiodescriptor2 to Freq
tablew 0, 27, giModScale ; Audiodescriptor2 to FmPitch
tablew 0, 28, giModScale ; Audiodescriptor2 to FmIndex
tablew 0, 29, giModScale ; Audiodescriptor2 to Env
tablew 0, 30, giModScale ; Audiodescriptor2 to Distr
tablew 0, 31, giModScale ; Audiodescriptor2 to RndMask
tablew 0, 32, giModScale ; Audiodescriptor3 to GrainRate
tablew 0, 33, giModScale ; Audiodescriptor3 to Duration
tablew 0, 34, giModScale ; Audiodescriptor3 to Freq
tablew 0, 35, giModScale ; Audiodescriptor3 to FmPitch
tablew 0, 36, giModScale ; Audiodescriptor3 to FmIndex
tablew 0, 37, giModScale ; Audiodescriptor3 to Env
tablew 0, 38, giModScale ; Audiodescriptor3 to Distr
tablew 0, 39, giModScale ; Audiodescriptor3 to RndMask
tablew 0, 40, giModScale ; Audiodescriptor4 to GrainRate
tablew 0, 41, giModScale ; Audiodescriptor4 to Duration
tablew 0, 42, giModScale ; Audiodescriptor4 to Freq
tablew 0, 43, giModScale ; Audiodescriptor4 to FmPitch
tablew 0, 44, giModScale ; Audiodescriptor4 to FmIndex
tablew 0, 45, giModScale ; Audiodescriptor4 to Env
tablew 0, 46, giModScale ; Audiodescriptor4 to Distr
tablew 0, 47, giModScale ; Audiodescriptor4 to RndMask
tablew 0, 48, giModScale ; Audiodescriptor5 to GrainRate
tablew 0, 49, giModScale ; Audiodescriptor5 to Duration
tablew 0, 50, giModScale ; Audiodescriptor5 to Freq
tablew 0, 51, giModScale ; Audiodescriptor5 to FmPitch
tablew 0, 52, giModScale ; Audiodescriptor5 to FmIndex
tablew 0, 53, giModScale ; Audiodescriptor5 to Env
tablew 0, 54, giModScale ; Audiodescriptor5 to Distr
tablew 0, 55, giModScale ; Audiodescriptor5 to RndMask
tablew 0, 56, giModScale ; Audiodescriptor6 to GrainRate
tablew 0, 57, giModScale ; Audiodescriptor6 to Duration
tablew 0, 58, giModScale ; Audiodescriptor6 to Freq
tablew 0, 59, giModScale ; Audiodescriptor6 to FmPitch
tablew 0, 60, giModScale ; Audiodescriptor6 to FmIndex
tablew 0, 61, giModScale ; Audiodescriptor6 to Env
tablew 0, 62, giModScale ; Audiodescriptor6 to Distr
tablew 0, 63, giModScale ; Audiodescriptor6 to RndMask
tablew 0, 64, giModScale ; LFO to GrainRate
tablew 0, 65, giModScale ; LFO to Duration
tablew 0, 66, giModScale ; LFO to Freq
tablew 0, 67, giModScale ; LFO to FmPitch
tablew 0, 68, giModScale ; LFO to FmIndex
tablew 0, 69, giModScale ; LFO to Env
tablew 0, 70, giModScale ; LFO to Distr
tablew 0, 71, giModScale ; LFO to RndMask


;input_channels to be read for input___________________________ 

kMousex chnget "Mousex"
kMousey chnget "Mousey"
kAudiodescriptor1 chnget "Audiodescriptor1"
kAudiodescriptor2 chnget "Audiodescriptor2"
kAudiodescriptor3 chnget "Audiodescriptor3"
kAudiodescriptor4 chnget "Audiodescriptor4"
kAudiodescriptor5 chnget "Audiodescriptor5"
kAudiodescriptor6 chnget "Audiodescriptor6"
kLFO chnget "LFO"


;modulators___________________________ 

tablew kMousex, 0, giModulators
tablew kMousey, 1, giModulators
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
inum_param = 8
modmatrix giParam_Out, giModulators, giParam_In, giModScale, inum_mod, inum_param, kupdate
;output parameters___________________________ 

kGrainRateOut table 0, giParam_Out
kDurationOut table 1, giParam_Out
kFreqOut table 2, giParam_Out
kFmPitchOut table 3, giParam_Out
kFmIndexOut table 4, giParam_Out
kEnvOut table 5, giParam_Out
kDistrOut table 6, giParam_Out
kRndMaskOut table 7, giParam_Out


;channels to read parameters from___________________________ 

kwhenOut init 0 
kmetro metro 10 
kwhenOut += kmetro 
kwhenOut = (kwhenOut%100)+1

cabbageSetValue "GrainRateOut", kGrainRateOut
OSCsend kwhenOut, "127.0.0.1", 9998, "/track/1/fx/1/fxparam/1/value", "f", kGrainRateOut
cabbageSetValue "DurationOut", kDurationOut
OSCsend kwhenOut, "127.0.0.1", 9998, "/track/1/fx/1/fxparam/4/value", "f", kDurationOut
cabbageSetValue "FreqOut", kFreqOut
OSCsend kwhenOut, "127.0.0.1", 9998, "/track/1/fx/1/fxparam/7/value", "f", kFreqOut
cabbageSetValue "FmPitchOut", kFmPitchOut
OSCsend kwhenOut, "127.0.0.1", 9998, "/track/1/fx/1/fxparam/10/value", "f", kFmPitchOut
cabbageSetValue "FmIndexOut", kFmIndexOut
OSCsend kwhenOut, "127.0.0.1", 9998, "/track/1/fx/1/fxparam/13/value", "f", kFmIndexOut
cabbageSetValue "EnvOut", kEnvOut
OSCsend kwhenOut, "127.0.0.1", 9998, "/track/1/fx/1/fxparam/16/value", "f", kEnvOut
cabbageSetValue "DistrOut", kDistrOut
OSCsend kwhenOut, "127.0.0.1", 9998, "/track/1/fx/1/fxparam/17/value", "f", kDistrOut
cabbageSetValue "RndMaskOut", kRndMaskOut
OSCsend kwhenOut, "127.0.0.1", 9998, "/track/1/fx/1/fxparam/18/value", "f", kRndMaskOut