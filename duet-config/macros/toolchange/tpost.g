; tpost.g
; called after a tool has been selected

;heatup
M116 P{state.currentTool}

; restore babystepping
M98 P"/macros/babystep/restore.g"

;prime nozzle
;M98 P"prime.g"

; Restore fan speed if any
M106 R2

;mesh leveling on
G29 S1

; Configure filament
M703
