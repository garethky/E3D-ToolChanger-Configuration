;brush in
G1 X-32.5 Y124 F50000
G1 X-35.5 Y155 F50000
G1 X-38.5 Y124 F50000
G1 X-41.5 Y155 F50000

;Park for prime/purge
G1 X-37.5 Y176 F50000

;Prime
G92 E0
G1 E10 F200
G1 F50
G1 E5 F50
G1 E-0.25 F200
G92 E0
;G4 S2

;Run Out
G1 X-37.5 Y160 F50000

;Brush Out
G1 X-41.5 Y155 F50000
G1 X-32.5 Y150 F50000
G1 X-41.5 Y145 F50000
G1 X-32.5 Y140 F50000
G1 X-41.5 Y135 F50000
G1 X-32.5 Y130 F50000
G1 X-41.5 Y125 F50000


