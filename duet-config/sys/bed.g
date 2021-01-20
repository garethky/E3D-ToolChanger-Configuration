; Bed Mesh Leveling

; Home Z
; TODO: conditionally home Z only if not already homed
if move.axes[2].homed == false
    G28 Z

; run the custom mesh-bed-leveling macro
M98 P"/macros/mesh-bed-leveling/mesh-bed-probe.g"

M98 P"/macros/Park"