; set filament name and temperature "variables"
G10 L2 P9 X{state.currentTool} Y215 Z4
M98 P"/macros/scripts/copy_var.g"

G10 L2 P9 X{state.currentTool} Y300 Z5
M98 P"/macros/scripts/copy_var.g"

; set retraction parameters
M207 S0.4 F2100