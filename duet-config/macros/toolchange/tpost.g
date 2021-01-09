; tpost.g
; called after a tool has been selected

; Configure filament
M703

; restore babystepping
M98 P"/macros/babystep/restore.g"

;heatup
M116 P{state.currentTool}

;prime nozzle
;M98 P"prime.g"

; Restore fan speed if any
M106 R2

;mesh leveling on
G29 S1
