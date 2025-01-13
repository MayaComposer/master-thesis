;____________________________________ 

kMousex init 0
kMousey init 0
kRms init 0
kPitch init 0
kCentroid init 0
kFlatness init 0
kTransDens init 0
kSpread init 0
kLFO init 0


kInputCheck1 OSClisten  giOscHandler, "/Mousex", "f", kMousex
kInputCheck2 OSClisten  giOscHandler, "/Mousey", "f", kMousey
kInputCheck3 OSClisten  giOscHandler, "/Rms", "f", kRms
kInputCheck4 OSClisten  giOscHandler, "/Pitch", "f", kPitch
kInputCheck5 OSClisten  giOscHandler, "/Centroid", "f", kCentroid
kInputCheck6 OSClisten  giOscHandler, "/Flatness", "f", kFlatness
kInputCheck7 OSClisten  giOscHandler, "/TransDens", "f", kTransDens
kInputCheck8 OSClisten  giOscHandler, "/Spread", "f", kSpread
kInputCheck9 OSClisten  giOscHandler, "/LFO", "f", kLFO
;put this into the receiver instrument
chnset kMousex, "Mousex"
chnset kMousey, "Mousey"
chnset kRms, "Rms"
chnset kPitch, "Pitch"
chnset kCentroid, "Centroid"
chnset kFlatness, "Flatness"
chnset kTransDens, "TransDens"
chnset kSpread, "Spread"
chnset kLFO, "LFO"
