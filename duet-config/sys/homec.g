; homec.g
; called to home the C axis (coupler)

M913 C60                ; Motors to 60% current
G1 H2 C-500 F10000      ; Move to 500 to force a stall against the hard stop
G92 C-125               ; set location where the motor stalled to be -125 on the C axis

;Open Coupler
M98 P"/macros/Unlock Coupler"
