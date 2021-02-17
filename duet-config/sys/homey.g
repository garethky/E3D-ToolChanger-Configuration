; homey.g
; called to home the Y axis

; Home the Y Axis
G91
M204 P1000               ; limit acceleration
G1 H1 Y-400 F2000        ; move to the front 400mm, stopping at the endstop
G1 Y2 F2000              ; move away from end
G1 H1 Y-400 F200         ; repeat the homing move at a lower speed for accuracy
G1 Y4 F2000              ; move away from end
G90                      ; back to absolute positioning
