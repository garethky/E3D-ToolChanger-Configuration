;tool offsets
; NOTE: Z-axis: making this number smaller (more negative) INCREASES the first layer height!
;       If your baby step value is negative, you want to decrease first layer height, so make this value more positive.
; Note: X/Y Axes: These work backwards
G10 P0 X9.0 Y40.5 Z-5.150  ; T1
G10 P1 X9.0 Y40.5 Z-5.150  ; T2
G10 P2 X9.0 Y40.5 Z-5.150  ; T3
G10 P3 X9.0 Y40.5 Z-5.150  ; T4

; Store per-tool configuration in work coordinate systems
; tools map to an axis, X = Tool 1, Y = Tool 2 etc.

; Tools X Coordinates for tool change in P2
G10 L2 P2 X-10.5 Y79.5 Z214.5 C304.5
; Tools Y Coordinates for tool change in P3
G10 L2 P3 X239.8 Y239.8 Z239.8 C239.8

; nozzel diameters in P4
G10 L2 P3 X0.4 Y0.4 Z0.4 C0.4

; P5 & P6 used to store filament temp and extrusion rate

; P7 - unused
; P8 - unused

; P9 is used as scratch space to save scripts from having lengthy tool # to axis mapping code

; TODO: tool to store the bed configuration and make changing it in the UI possible
;M563 P8 S"Removable Print Surface"