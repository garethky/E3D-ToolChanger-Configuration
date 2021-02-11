
; StealthChop Calibration

G91                     ; use relative positioning

M18                     ; cut all motor power
M915 P0 T5              ; set coolstep threshold (disables stall detection)
M915 P1 T5              ; set coolstep threshold (disables stall detection)
M915 P2 T5
M569 P0 D3 H16 V16      ; set stealthChop mode, set tpwmthrs and thigh
M569 P1 D3 H16 V16      ; set stealthChop mode, set tpwmthrs and thigh
M569 P2 D3 H16 V16      ; set stealthChop mode, set tpwmthrs and thigh

; log driver state after reset
M569 P0
M569 P1
M569 P2

M564 H0                 ; disable safe moves

; apply current to the motors
G1 Y0.02 F1000
G1 Z0.002 F1000
            
; dwell for at least 130ms
G4 P250

; For CoreX/Y: move Y by at least 400 full steps, this moves both motors
; The move needs to be made fairly fast
G1 Y100 Z10 F6000

; dwell for at least 130ms
G4 P250

; move back to the starting location to speed up homing
G1 Y-100 Z-10 F6000

; log driver state after tuning
M569 P0
M569 P1
M569 P2

M564 H1                 ; enable safe moves
G90                     ; back to absolute positioning