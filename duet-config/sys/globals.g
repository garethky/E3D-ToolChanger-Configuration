; restore work offsets before writing over them
M501

; Set axis maxima & minima, this defines where 0,0 is relative to the homing point
M208 X-30.9:330.5 Y-45.1:257 Z0:280 C0:500

; Tool Offsets
; NOTE: Z-axis: making this number smaller (more negative) INCREASES the first layer height!
;       If your baby step value is negative, you want to decrease first layer height, so make this value more positive.
; Note: X/Y Axes: These work backwards
G10 P0 X5.0 Y41.5 Z-3.65 ; T1
G10 P1 X5.0 Y41.5 Z-3.65 ; T2
G10 P2 X5.0 Y41.5 Z-3.65 ; T3
G10 P3 X5.0 Y41.5 Z-3.65 ; T4

; Store per-tool configuration in work coordinate systems
; tools map to an axis, X = Tool 1, Y = Tool 2 etc.

; Tool's X Machine Coordinates for tool change in P2
G10 L2 P2 X-8.5 Y81.5  Z216.5 C306.5
; Tool's Y Machine Coordinates for tool change in P3
G10 L2 P3 X240.65 Y240.65 Z240.65 C240.65

; P4 & P5 used to store filament related variables that are related to the active tool
; P4
; X - filament temperature for printing and loading
; Y - bed temperature
; Z - Purge extrusion speed
; C - Feed-in extrusion speed
G10 L2 P4 X0 Y0 Z0 C0
; P5
; X - printing extrusion speed first layer
; Y - printing extrusion speed
; Z - 
; C -
G10 L2 P5 X0 Y0 Z0 C0

; P6 Is used to store the per-tool babystep value to enable saving of live-z adjustments made while a tool is in use
; Do not overwrite!

; P7: installed nozzle diameters
G10 L2 P7 X0.4 Y0.4 Z0.4 C0.4

; P8 unused

; P9 is reserved as the program stack for setting variables with /sys/copy_var.g
G10 L2 P9 X0 Y0 Z0 C0

; TODO: tool to store the bed configuration and make changing it in the UI possible
;M563 P8 S"Removable Print Surface"