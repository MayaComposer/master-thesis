;____________________________________ 

kMorphX init 0
kMorphY init 0
kExpression init 0
kLFO init 0


kInputCheck1 OSClisten  giOscHandler, "/Morph", "ff", kMorphX, kMorphY
kInputCheck3 OSClisten  giOscHandler, "/Expression", "f", kExpression
kInputCheck4 OSClisten  giOscHandler, "/LFO", "f", kLFO
;put this into the receiver instrument
chnset kMorphX, "MorphX"
chnset kMorphY, "MorphY"
chnset kExpression, "Expression"
chnset kLFO, "LFO"
