; homeall.g
; called to home all axes

; X-Axis Homing Switch Avoidance
G91                      ; use relative positioning
M204 P1000               ; limit acceleration
M564 H0                  ; enable movement of unhomed X axis
M913 X30 Y30             ; Set a very low motor current to avoid damage if the X axis collides with the right side of the printer.
G1 X15 F2000             ; kick the X axis to the right by 15mm to clear the X axis limit switch. If this is not cleared the switch will break!
M913 X100 Y100           ; back to normal current and homing protections
M564 H1
G90

M98 P"homey.g"            ; Home Y

M98 P"homex.g"            ; Home X

M98 P"stealthchop.g"      ; calibrate drivers for StealthChop

M98 P"homey.g"            ; Home Y

M98 P"homex.g"            ; Home X

; TODO can Z and C homing happen simultaniously?

M98 P"homez.g"            ; Home Z

M98 P"homec.g"            ; Home C (ToolHead)
