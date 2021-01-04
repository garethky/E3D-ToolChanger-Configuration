; set filament name and temperature "variables"
G10 L2 P9 X{sate.CurrentTool} Y240 Z4
G98 P"/macro/scripts/copy_var.g"

G10 L2 P9 X{sate.CurrentTool} Y150 Z5
G98 P"/macro/scripts/copy_var.g"

; set retraction parameters
M207 S0.6 F1300