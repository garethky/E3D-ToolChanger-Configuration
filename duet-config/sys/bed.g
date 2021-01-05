; Bed Mesh Leveling

; Home Z
; TODO: conditionally home Z only if not already homed
G28 Z

G1 H2 Z2 F5000        ; lift Z 3mm

G29 S2  ; clear height map
G29     ; run mesh bed leveling   

; disable mesh leveling, needs to be enabled at the start of your print and disabled again when finished.
G29 S2

M98 P"/macros/Park"