; homez.g
; called to home the Z axis

G91                     ; Relative mode
G1 H2 Z5 F5000            ; Lower the un-home Z-axis bed 5mm in individual motor mode
G90                        ; back to absolute positioning

G1 X150 Y50 F15000        ; Position the endstop above the bed centre

G91                     ; Relative mode
G30                     ; Probe Z-axis using the sensor
G1 Z5 F5000                ; Drop the Z-axis 5mm
G90                        ; Back to absolute positioning
