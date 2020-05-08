; tpost0.g
; called after tool 0 has been selected

;heatup
M116 P0

;prime nozzle
;M98 Pprime.g

; Restore fan speed if any
M106 R2

;mesh leveling on
G29 S1