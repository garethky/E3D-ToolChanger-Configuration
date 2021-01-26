; save.g

; writes the baby stepping value into the work offsets and then stores them with M500
G10 L2 P9 X{state.currentTool} Y{move.axes[2].babystep} Z6
M98 P"/sys/copy_var.g"
M500