; tpost3.g
; called after tool 3 has been selected

;heatup
M116 P3

;prime nozzle
;M98 Pprime.g

; Restore fan speed if any
M106 R2

;mesh leveling on
G29 S1
