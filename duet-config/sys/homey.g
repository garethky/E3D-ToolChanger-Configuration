; homey.g
; called to home the Y axis



G91                      ; use relative positioning

G1 H1 Y-400 F2000        ; move to the front 400mm, stopping at the endstop
G1 Y2 F2000              ; move away from end
G1 H1 Y-400 F200         ; repeat the homing move because it doesn't always work first time
G1 Y4 F2000              ; move away from end

G90                      ; back to absolute positioning
