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
tablew 0, 16, giModScale ; Rms to GrainRate
tablew 0, 17, giModScale ; Rms to Duration
tablew 0, 18, giModScale ; Rms to Freq
tablew 0, 19, giModScale ; Rms to FmPitch
tablew 0, 20, giModScale ; Rms to FmIndex
tablew 0, 21, giModScale ; Rms to Env
tablew 0, 22, giModScale ; Rms to Distr
tablew 0, 23, giModScale ; Rms to RndMask
tablew 0, 24, giModScale ; Pitch to GrainRate
tablew 0, 25, giModScale ; Pitch to Duration
tablew 0, 26, giModScale ; Pitch to Freq
tablew 0, 27, giModScale ; Pitch to FmPitch
tablew 0, 28, giModScale ; Pitch to FmIndex
tablew 0, 29, giModScale ; Pitch to Env
tablew 0, 30, giModScale ; Pitch to Distr
tablew 0, 31, giModScale ; Pitch to RndMask
tablew 0, 32, giModScale ; Centroid to GrainRate
tablew 0, 33, giModScale ; Centroid to Duration
tablew 0, 34, giModScale ; Centroid to Freq
tablew 0, 35, giModScale ; Centroid to FmPitch
tablew 0, 36, giModScale ; Centroid to FmIndex
tablew 0, 37, giModScale ; Centroid to Env
tablew 0, 38, giModScale ; Centroid to Distr
tablew 0, 39, giModScale ; Centroid to RndMask
tablew 0, 40, giModScale ; Flatness to GrainRate
tablew 0, 41, giModScale ; Flatness to Duration
tablew 0, 42, giModScale ; Flatness to Freq
tablew 0, 43, giModScale ; Flatness to FmPitch
tablew 0, 44, giModScale ; Flatness to FmIndex
tablew 0, 45, giModScale ; Flatness to Env
tablew 0, 46, giModScale ; Flatness to Distr
tablew 0, 47, giModScale ; Flatness to RndMask
tablew 0, 48, giModScale ; TransDens to GrainRate
tablew 0, 49, giModScale ; TransDens to Duration
tablew 0, 50, giModScale ; TransDens to Freq
tablew 0, 51, giModScale ; TransDens to FmPitch
tablew 0, 52, giModScale ; TransDens to FmIndex
tablew 0, 53, giModScale ; TransDens to Env
tablew 0, 54, giModScale ; TransDens to Distr
tablew 0, 55, giModScale ; TransDens to RndMask
tablew 0, 56, giModScale ; Spread to GrainRate
tablew 0, 57, giModScale ; Spread to Duration
tablew 0, 58, giModScale ; Spread to Freq
tablew 0, 59, giModScale ; Spread to FmPitch
tablew 0, 60, giModScale ; Spread to FmIndex
tablew 0, 61, giModScale ; Spread to Env
tablew 0, 62, giModScale ; Spread to Distr
tablew 0, 63, giModScale ; Spread to RndMask
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
kRms chnget "Rms"
kPitch chnget "Pitch"
kCentroid chnget "Centroid"
kFlatness chnget "Flatness"
kTransDens chnget "TransDens"
kSpread chnget "Spread"
kLFO chnget "LFO"


;modulators___________________________ 

tablew kMousex, 0, giModulators
tablew kMousey, 1, giModulators
tablew kRms, 2, giModulators
tablew kPitch, 3, giModulators
tablew kCentroid, 4, giModulators
tablew kFlatness, 5, giModulators
tablew kTransDens, 6, giModulators
tablew kSpread, 7, giModulators
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

kwhen init 0 
 kmetro metro 10 
 kwhen += kmetro 
 kwhen = (kwhen%100)+1
cabbageSetValue "GrainRateOut", kGrainRateOut
OSCsend kwhen, "127.0.0.1", 9998, "GrainRateOut", "f", kGrainRateOut
cabbageSetValue "DurationOut", kDurationOut
OSCsend kwhen, "127.0.0.1", 9998, "DurationOut", "f", kDurationOut
cabbageSetValue "FreqOut", kFreqOut
OSCsend kwhen, "127.0.0.1", 9998, "FreqOut", "f", kFreqOut
cabbageSetValue "FmPitchOut", kFmPitchOut
OSCsend kwhen, "127.0.0.1", 9998, "FmPitchOut", "f", kFmPitchOut
cabbageSetValue "FmIndexOut", kFmIndexOut
OSCsend kwhen, "127.0.0.1", 9998, "FmIndexOut", "f", kFmIndexOut
cabbageSetValue "EnvOut", kEnvOut
OSCsend kwhen, "127.0.0.1", 9998, "EnvOut", "f", kEnvOut
cabbageSetValue "DistrOut", kDistrOut
OSCsend kwhen, "127.0.0.1", 9998, "DistrOut", "f", kDistrOut
cabbageSetValue "RndMaskOut", kRndMaskOut
OSCsend kwhen, "127.0.0.1", 9998, "RndMaskOut", "f", kRndMaskOut


