; homex.g
; called to home the x axis

; This axis can only be homes when Y is homes AND Y is at the correct position to hit the physical X switch
; in the GUI, X is first, so if someone pushes that button they could crash the machine
if !move.axes[1].homed
    M98 P"homey.g"            ; Home Y

; even if it was homed it might not be in the right location, so fix that
; And even if it is homed, the machine may have just crashed so use H1 just in case
G1 H1 Y-42.9  F2000 

G91                      ; use relative positioning

G1 H1 X-400 F2000        ; move left 400mm, stopping at the endstop
G1 X2 F2000              ; move away from end
G1 H1 X-400 F200         ; repeat the homing move because it doesn't always work first time
G1 X4 F2000              ; move away from end

G90                      ; back to absolute positioning
