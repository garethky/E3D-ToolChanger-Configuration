; homec.g
; called to home the C axis (coupler)

; The coupler doesnt reliably stall, so this code drives it to the end stop reliably with as little current as possible
; First we give the system a "kick" at full power
M913 C100
M400
G1 H2 C-5 F5000

; Then the power is reduced to limit force when it hits tha hard stop
M400
M913 C65  
M400
G1 H2 C-200 F5000       ; Move to the hard stop

G92 C-125               ; set location where the motor stalled to be -125 on the C axis

;Open Coupler
M98 P"/macros/Unlock Coupler"
