; loadFilament.g

; ask the user if they really want to light up the heater and load some filament
M291 S3 P{"Click OK to heat to " ^ tools[5].offsets[0] ^ "C and load " ^ tools[5].name} R{"Load " ^ tools[5].name ^ "?"}

; Set current the configured temperature and wait for the extruder to reach temp
M109 S{tools[5].offsets[0]}

; Pause and ask the user to position the filament for feeding
M291 S2 P{"Load filament in the extruder and click OK to start loading " ^ tools[5].name} R{"Ready to Load " ^ tools[5].name} 

M83 ; Extruder to relative mode

; rapidly feed filament from the gears to the bottom of the heat break
G1 E58 F900 ; Feed 58mm of filament at 15mm/s
;G1 E30 F{tools[5].offsets[0]} ; Feed 30mm of filament slowly
G1 E30 F300 ; Feed 30mm of filament slowly

; purge and ask for more loop
while true
    ; G1 E30 F{tools[5].offsets[0]} ; Feed 30mm of filament slowly
    ; G1 E30 F300 ; Feed 30mm of filament slowly
    M400; Wait for moves to complete

    ; ask the user if they want to do that again?
    M291 S3 P{"Click OK to purge some more"} R{"Continue purging?"}