; homey.g
; called to home the Y axis

M569 P0 D2               ; Spread Cycle On
M569 P1 D2               ; Spread Cycle On
G91                      ; use relative positioning

G1 H2 X0.5 Y0.5 F10000   ; energise

M400                     ; make sure everything has stopped before we make changes
M574 X1 Y1 S3            ; set endstops to use motor stall

M913 X30 Y30             ; drop motor currents to 30%

G1 H2 Z3 F5000           ; lift Z 3mm
G1 H1 Y-400 F3000        ; move to the front 400mm, stopping at the endstop
G1 H1 Y2 F2000           ; move away from end
G1 H1 Y-400 F3000        ; Repeat
G1 H1 Y2 F2000           ; move away from end
G1 H2 Z-3 F1200          ; lower Z
G90                      ; back to absolute positioning

M400                     ; make sure everything has stopped before we reset the motor currents
G4 P100                  ; wait 400ms
M913 X100 Y100           ; motor currents back to 100%
M569 P0 D3               ; Stealth Chop on
M569 P1 D3               ; Stealth Chop on
