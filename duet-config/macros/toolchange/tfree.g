; tfree.g
; called when a tool is freed

; save babystepping value
M98 P"/macros/babystep/save.g"
; set the babystepping value to 0, mostly for web UI visibility and sanity checking
M290 S0 R0

;Drop the bed
G91
G1 Z4 F1000
G90

;mesh levelling off
G29 S2

;Purge nozzle
;M98 P"purge.g"

;Move In
G53 G1 X{move.axes[state.currentTool].workplaceOffsets[1]} Y150 F10500
G53 G1 X{move.axes[state.currentTool].workplaceOffsets[1]} Y200 F10500
G53 G1 X{move.axes[state.currentTool].workplaceOffsets[1]} Y230 F10500
G53 G1 X{move.axes[state.currentTool].workplaceOffsets[1]} Y{move.axes[state.currentTool].workplaceOffsets[2]} F4800

;Open Coupler
M98 P"/macros/Unlock Coupler"

; fan off
; part cooling fans are numbered 1, 3, 5, 7, so (tool number * 2) + 1
M106 P{(state.currentTool * 2) + 1} S0

;Move Out
G53 G1 X{move.axes[state.currentTool].workplaceOffsets[1]} Y150 F10500
