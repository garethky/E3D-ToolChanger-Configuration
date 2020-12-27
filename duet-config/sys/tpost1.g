; tpost1.g
; called after tool 1 has been selected

;heatup
M116 P1

;prime nozzle
;M98 P"prime.g"

; Restore fan speed if any
M106 R2

;mesh leveling on
G29 S1

