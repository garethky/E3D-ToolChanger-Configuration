; X - filament temperature for printing and loading
; Y - bed temperature
; Z - Purge extrusion speed mm/min
; C - Feed-in extrusion speed mm/min
G10 L2 P4 X215 Y60 Z{5 * 60} C{15 * 60}
; P5
; X - printing extrusion speed first layer mm/min
; Y - printing extrusion speed other layers mm/min
; Z - 
; C -
G10 L2 P5 X{30 * 60} Y{80 * 60} Z0 C0

; Extrusion factor: 95%
M221 S95

; set retraction parameters
M207 P{state.currentTool} S0.2 F{40 * 60}

; enable pressure advance
G10 L2 P9 X0.030
M98 P"/sys/filament/set_pressure_advance.g"

; cap max fan speed to 80%
; M106 P{tools[state.currentTool].fans[0]} L0.1  X0.8