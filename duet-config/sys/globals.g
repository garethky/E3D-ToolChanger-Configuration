; Define virtual axes used to store per-tool variables

; Filament Settings axis
M584 A6        ; stores the filament temprature used for loading, unloding and printing live-z calibration
               ; accessed with {tools[n].offsets[4]}
M208 A0:400    ; set the max range for the axis to be something good for filament temp

M584 B7        ; Feed rate for purging filament {tools[n].offsets[5]}
M208 B0:10000  ; feed rates can be high in mm/min

M584 D8        ; nozzle diameter {tools[n].offsets[6]}
M208 D0:4      ;

M584 U9        ; X offset for tool changes {tools[n].offsets[7]}
M208 U-100:500 ;

M584 V10       ; Y offset for tool changes {tools[n].offsets[8]}
M208 V-100:500 ;

M584 W11       ; unused
M208 W0:1      ;

; setting the position of these fake axes causes Duet to consider them homed
; This prevents errors related to unhomed axes and complaints in the GUI
G92 A0 B0 D0 U0 V0 W0


;tool offsets
; NOTE: Z-axis: making this number smaller (more negative) INCREASES the first layer height!
;       If your baby step value is negative, you want to decrease first layer height, so make this value more positive.
; Note: X/Y Axes: These work backwards
G10 P0 X9.0 Y40.5 Z-5.150  ; T1
G10 P1 X9.0 Y40.5 Z-5.150  ; T2
G10 P2 X9.0 Y40.5 Z-5.150  ; T3
G10 P3 X9.0 Y40.5 Z-5.150  ; T4

; Tools X and Y Coordinate for toolchanges
G10 P0 U-10.5 V239.8
G10 P1 U79.5  V239.8
G10 P2 U214.5 V239.8
G10 P3 U304.5 V239.8

; nozzel diameters
G10 P0 D0.4
G10 P1 D0.4
G10 P2 D0.4
G10 P3 D0.4

; TODO: Tools to store nozzle diameter and make changing it in the UI possible
;M563 P5 S"T1 Nozzle"
;M563 P6 S"T2 Nozzle"
;M563 P7 S"T3 Nozzle"
;M563 P8 S"T4 Nozzle"

; TODO: tool to store the bed configuration and make changing it in the UI possible
;M563 P8 S"Removable Print Surface"

; M584 P4 ; hide fake axes? Fake axes cant have offsets :(