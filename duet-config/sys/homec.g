; homec.g
; called to home the C axis (coupler)

M913 C50                ; Motors to 60% current
G1 H2 C-1000 F10000     ; Move to -1000 to force a stall against the hard stop
G92 C-125               ; set location where the motor stalled to be -125 on the C axis

;Open Coupler
M98 P"/macros/Unlock Coupler"
