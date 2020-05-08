; homec.g
; called to home the C axis (coupler)

;crashc
;G92 C500
;M913 C40            ; C MOTOR TO 40% CURRENT
;G1 C-500 F2400
;M913 C100            ; C MOTOR TO 100% CURRENT
;G1 C1 F50000
;G92 C0


M913 C60                ; Motors to 60% current
G1 H2 C-1000 F10000        ; Move to -1000 to force a stall agains the hard stop
G92 C-125                ; set stall location to be -125 on the C axis
G90                        ; back to absolute mode
M913 C100                ; Motors to 100% current
G1 C0 F10000            ; move C back to 0

;Open Coupler
M98 P/macros/Unlock Coupler
