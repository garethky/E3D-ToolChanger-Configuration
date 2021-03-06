; tpre.g
; called before the next tool is selected

; state at the start is that no tool is currently on the coupler

; Double check that the couper is unlocked
M98 P"/macros/Unlock Coupler"

M204 P1000    ; limit acceleration

; If the toolead is across the safety line, move back back behind the safety line
if move.axes[1].machinePosition > 200
    G53 G1 Y200 F10500

; Move to the X & Y location of the tool to pick up at the safety line
G1 X{move.axes[state.nextTool].workplaceOffsets[1]} Y200 F10500

; Move to within the length of the coupler which is tool position - 12mm
G1 Y{move.axes[state.nextTool].workplaceOffsets[2] - 12} Y230 F10500

; Insert the coupler to the final location slowly
G1 Y{move.axes[state.nextTool].workplaceOffsets[2]} F2400

; Close Coupler
M98 P"/macros/Lock Coupler"

;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
; TODO: we have the offset in the work offsets, maybe it should be that + 10mm?
G91
G1 Z10 F1000
G90

; Move off the dok pins, 27mm
G1 Y{move.axes[state.nextTool].workplaceOffsets[2] - 27} F4800

; move the tool out to the safe distance line
G1 Y160 F10500

