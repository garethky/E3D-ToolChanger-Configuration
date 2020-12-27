; tfree2.g
; called when tool 2 is freed

;Drop the bed
G91
G1 Z4 F1000
G90

;mesh levelling off
G29 S2

;Purge nozzle
;M98 P"purge.g"

;Move In
G53 G1 X214.5 Y150 F15000
G53 G1 X214.5 Y200 F15000
G53 G1 X214.5 Y230 F15000
G53 G1 X214.5 Y240 F5000

;Open Coupler
M98 P"/macros/Unlock Coupler"

;fan off
M106 P5 S0

;Move Out
G53 G1 X214.5 Y150 F15000
