;M569 P0 S0 D3 H5 V5                     ; Drive 0 X
;M569 P1 S0 D3 H5 V5                     ; Drive 1 Y

; microstepping values
;M350 X256   Y256
;M92  X1600  Y1600

; stall guard and cool step
;M915 P0:P1 S2 F0 H206 R0 T50764

; try varying the motor currents:

;M569 P0					; read out motor parameters
;M569 P1					; read out motor parameters
;G28 X Y
;M569 P0					; read out parameters again
;M569 P1					; read out parameters again
M98 P"/macros/test_movement.g"

;M906 X1400 Y1400
;M569 P0					; read out motor parameters
;M569 P1					; read out motor parameters
;G28 X Y
;M569 P0					; read out parameters again
;M569 P1					; read out parameters again
M98 P"/macros/test_movement.g"

