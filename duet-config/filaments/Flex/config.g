; X - filament temperature for printing and loading
; Y - bed temperature
; Z - Purge extrusion speed mm/min
; C - Feed-in extrusion speed mm/min
G10 L2 P4 Y240 Y50 Z{2.5 * 60} C{7 * 60}
; P5
; X - printing extrusion speed first layer mm/min
; Y - printing extrusion speed other layers mm/min
; Z - 
; C -
G10 L2 P5 X{10 * 60} Y{15 * 60} Z0 C0

; set retraction parameters
M207 P{state.currentTool} S0.8 F{5 * 60}

; enable pressure advance
G10 L2 P9 X0.030
M98 P"/sys/filament/set_pressure_advance.g"
