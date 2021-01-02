; unloadFilament.g

; ask the user if they really want to light up the heater and unload some filament?
M291 S3 P{"Click OK to heat to " ^ tools[5].offsets[0] ^ "C and unload " ^ tools[5].name} R{"Unload " ^ tools[5].name ^ "?"}

; Set current the configured temperature and wait for the extruder to reach temp
M109 S{tools[5].offsets[0]}

M83 ; Extruder to relative mode

; G1 E-10 F{tools[5].offsets[0] * 2} ; gently pull for 10mm at 2x the regular extrusion rate
; G1 E-10 F600 ; gently pull for 10mm at 2x the regular extrusion rate
G1 E-100 F6000 ; rapidly eject filament, feed -100mm of filament at 100mm/s

; shut the heater off
M109 S0

; non-blocking user notification
M291 S1 P{"Please remove filament from the extruder"} R{"Unloading " ^ tools[5].name ^ " complete"}

; Reset the name "variable"
M563 P5 S"Filament Variables"

; reset the temp "variable"
G10 P5 X0