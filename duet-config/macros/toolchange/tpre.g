; tpre.g
; called before the next tool is selected

; Unlock Coupler
M98 P"/macros/Unlock Coupler"

; Move to safe Y distance from Tool heads
G1 Y150 F15000

;Move to location
G1 X{move.axes[state.currentTool].workplaceOffsets[1]} Y200 F15000

;Move in
G1 X{move.axes[state.currentTool].workplaceOffsets[1]} Y230 F15000

;Collect
G1 X{move.axes[state.currentTool].workplaceOffsets[1]} Y{move.axes[state.currentTool].workplaceOffsets[2]} F2500

;Close Coupler
M98 P"/macros/Lock Coupler"

;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
; TODO: we have the offset in the work offsets, maybe it should be that + 10mm?
G91
G1 Z10 F1000
G90

;Move Out
G1 X{move.axes[state.currentTool].workplaceOffsets[1]} Y150 F5000

