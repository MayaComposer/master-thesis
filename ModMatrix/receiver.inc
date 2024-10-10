;____________________________________ 

kMorphX init 0
kMorphY init 0
kAudiodescriptor1 init 0
kAudiodescriptor2 init 0
kAudiodescriptor3 init 0
kExpression init 0
kLFO init 0


kInputCheck1 OSClisten  giOscHandler, "/MorphX", "f", kMorphX
kInputCheck2 OSClisten  giOscHandler, "/MorphY", "f", kMorphY
kInputCheck3 OSClisten  giOscHandler, "/Audiodescriptor1", "f", kAudiodescriptor1
kInputCheck4 OSClisten  giOscHandler, "/Audiodescriptor2", "f", kAudiodescriptor2
kInputCheck5 OSClisten  giOscHandler, "/Audiodescriptor3", "f", kAudiodescriptor3
kInputCheck6 OSClisten  giOscHandler, "/Expression", "f", kExpression
kInputCheck7 OSClisten  giOscHandler, "/LFO", "f", kLFO
;put this into the receiver instrument
chnset kMorphX, "MorphX"
chnset kMorphY, "MorphY"
chnset kAudiodescriptor1, "Audiodescriptor1"
chnset kAudiodescriptor2, "Audiodescriptor2"
chnset kAudiodescriptor3, "Audiodescriptor3"
chnset kExpression, "Expression"
chnset kLFO, "LFO"
