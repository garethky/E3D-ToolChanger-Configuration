; set_pressure_advance.g

; fix to get around D parameter not taking an expression: https://forum.duet3d.com/topic/20788/m572-s-d-parameter-doesn-t-process-expressions
; G10 L2 P9 X0.1
; value in X is the pressure advance

if {state.currentTool} == 0
    M572 D0 S{move.axes[0].workplaceOffsets[8]}
elif {state.currentTool} == 1
    M572 D1 S{move.axes[0].workplaceOffsets[8]}
elif {state.currentTool} == 2
    M572 D2 S{move.axes[0].workplaceOffsets[8]}
elif {state.currentTool} == 3
    M572 D3 S{move.axes[0].workplaceOffsets[8]}
else
    abort   ; -1 is not a valid tool
