; copy_var.g

; this macro copies a variable from the temporary variable slot and stores it in the requested slot for the specified tool:

; How To use:
;
; G10 L2 P9 X{sate.CurrentTool} Y{value_to_store} Z{target_coordinate_system_index}
; G98 P"/macro/scripts/copy_var.g"
;
; Inputs:
;
; move.axes[0].workplaceOffsets[8] - tool number to store the value for
; move.axes[1].workplaceOffsets[8] - the value to store
; move.axes[2].workplaceOffsets[8] - the coordinate system number to store it in

if move.axes[0].workplaceOffsets[8] == 0
    G10 L2 P{move.axes[2].workplaceOffsets[8]} X{move.axes[1].workplaceOffsets[8]}
elif move.axes[0].workplaceOffsets[8] == 1
    G10 L2 P{move.axes[2].workplaceOffsets[8]} Y{move.axes[1].workplaceOffsets[8]}
elif move.axes[0].workplaceOffsets[8] == 2
    G10 L2 P{move.axes[2].workplaceOffsets[8]} Z{move.axes[1].workplaceOffsets[8]}
elif move.axes[0].workplaceOffsets[8] == 3
    G10 L2 P{move.axes[2].workplaceOffsets[8]} C{move.axes[1].workplaceOffsets[8]}
else
	abort   ; not taking any chances
