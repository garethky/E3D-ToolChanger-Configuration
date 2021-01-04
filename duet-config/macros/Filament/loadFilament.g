; loadFilament.g

; because of the way offsets work, we need to copy the temporary variables into the axis for the right tool
if ()

; ask the user if they really want to light up the heater and load some filament
M291 S3 P{"Click OK to heat to " ^ {move.axes[state.currentTool].workplaceOffsets[4]} ^ "C and load " ^ move.extruders[state.currentTool].filament} R{"Load " ^ move.extruders[state.currentTool].filament ^ "?"}

; Set current the configured temperature and wait for the extruder to reach temp
M109 S{move.axes[state.currentTool].workplaceOffsets[4]}

; Pause and ask the user to position the filament for feeding
M291 S2 P{"Load filament in the extruder and click OK to start loading " ^ move.extruders[state.currentTool].filament} R{"Ready to Load " ^ move.extruders[state.currentTool].filament} 

M83 ; Extruder to relative mode

; rapidly feed filament from the gears to the bottom of the heat break
G1 E58 F900 ; Feed 58mm of filament at 15mm/s
; G1 E15 F{move.axes[state.currentTool].workplaceOffsets[5]} ; Feed 15mm of filament slowly
G1 E15 F300

; purge and ask for more loop
while true
    ; G1 E30 F{move.axes[state.currentTool].workplaceOffsets[5]} ; Feed 30mm of filament slowly
    G1 E15 F300
    M400; Wait for moves to complete

    ; ask the user if they want to do that again?
    M291 S3 P{"Click OK to purge some more"} R{"Continue purging?"}