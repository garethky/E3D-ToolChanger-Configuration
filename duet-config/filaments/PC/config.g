; set filament name and temperature "variables"
G10 L2 P9 X{sate.CurrentTool} Y275 Z4
G98 P"/macro/scripts/copy_var.g"

G10 L2 P9 X{sate.CurrentTool} Y300 Z5
G98 P"/macro/scripts/copy_var.g"

; set retraction parameters
M207 S0.4 F2100