; Disable Mesh Compensation.
G29 S2

; purge tool
;M98 Ppurge.g

; park tool
T-1

; clear all heater settings
M140 S0  ; set bed heater to 0
M104 S0 T0 ; set temperature to 0
M104 S0 T1 ; set temperature to 0
M104 S0 T2 ; set temperature to 0
M104 S0 T3 ; set temperature to 0

; Heaters off
M0

