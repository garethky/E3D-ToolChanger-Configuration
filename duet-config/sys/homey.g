; homey.g
; called to home the Y axis

G91                      ; use relative positioning

M564 H0                  ; enable movement of unhomed X axis
M913 X30 Y30             ; Set a very low motor current to avoid damage if the X axis collides with the right side of the printer.
G1 X15 F2000             ; kick the X axis to the right by 15mm to clear the X axis limit switch. If this is not cleared the switch will break!
M913 X100 Y100			 ; back to normal current and homing protections
M564 H1

G1 H1 Y-400 F2000        ; move to the front 400mm, stopping at the endstop
G1 Y2 F2000              ; move away from end
G1 H1 Y-400 F200         ; repeat the homing move at a lower speed for accuracy
G1 Y4 F2000              ; move away from end

G90                      ; back to absolute positioning
