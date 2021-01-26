; tfree.g
; called when a tool is freed

; save babystepping value
M98 P"/sys/babystep/save.g"
; set the babystepping value to 0, mostly for web UI visibility and sanity checking
M290 S0 R0

;Drop the bed
G91
G1 Z4 F1000
G90

;mesh levelling off
G29 S2

; assume the head is holding a tool, but the tool location is not safe to translate in X

; If the toolead is across the safety line, move back back behind the safety line
if move.axes[1].machinePosition > 160
    G53 G1 Y160 F10500

; 2) Move the head in X & Y location of the tool's dock at the safety line
G53 G1 X{move.axes[state.currentTool].workplaceOffsets[1]} Y160 F10500

; 3) Move forwrd to the tools Y offset - dock pin length of 27mm
G53 G1 Y{move.axes[state.currentTool].workplaceOffsets[2] - 27} F10500

; 4) Mount the tool on the dock pins, move to final tool Y location
G53 G1 Y{move.axes[state.currentTool].workplaceOffsets[2]} F4800

; fan off
; part cooling fans are numbered 1, 3, 5, 7, so (tool number * 2) + 1
M106 P{(state.currentTool * 2) + 1} S0

;Purge nozzle
;M98 P"purge.g"

; 5) unlock coupler
M98 P"/macros/Unlock Coupler"

; 6) Move back the length of the coupler, 12mm
G53 G1 Y{move.axes[state.currentTool].workplaceOffsets[2] - 12} F2400

; 7) move back to the safe distance with no tool mounted
;Move Out
G53 G1 Y200 F10500
