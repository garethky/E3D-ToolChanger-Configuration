; homeall.g
; called to home all axes

; home fake axes as they become un-homed when the home all button is pressed
G92 A0 B0 D0 U0 V0 W0

M98 P"homec.g"            ; Home C (ToolHead)

M98 P"homey.g"            ; Home Y

M98 P"homex.g"            ; Home X

M98 P"homez.g"            ; Home Z
