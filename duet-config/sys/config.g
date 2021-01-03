; Configuration; Configuration file for Duet 3 with Raspberry Pi + 3HC tool board
; executed by the firmware on start-up

; # Panel Duet Enable (soon to be useless with the Pi)
M575 P1 S1 B57600

; # General preferences
M111 S0                             ; Debugging off
G21                                 ; Work in millimetres
G90                                 ; Send absolute coordinates...
M83                                 ; ...but relative extruder moves
M555 P2                             ; Set firmware compatibility to look like Marlin
M667 S1                             ; Select CoreXY mode
M84 S120                            ; Set idle timeout

; # Drive direction
; ## main board drivers
M569 P0 S0 D3 V100                      ; Drive 0 X
M569 P1 S0 D3 V100                      ; Drive 1 Y
M569 P2 S1 D3 V100                      ; Drive 2 Z
M569 P3 S0                              ; Drive 3 C
M569 P4 S0 D3 V100                      ; Drive 4 E0
M569 P5 S1 D3 V100                      ; Drive 5 E1
; ## Tool board drivers
M569 P1.0 S0                            ; Drive 6 (no used)
M569 P1.1 S1 D3 V100                    ; Drive 7 E2
M569 P1.2 S0 D3 V100                    ; Drive 8 E3

M584 X0 Y1 Z2 C3 E4:5:1.1:1.2                       ; Apply custom axis to drive mapping
M350 X256 Y256 Z16 C16 E16:16:16:16 I1                ; Configure x16 microstepping with interpolation on all axes
M906 X1100 Y1100 Z1330 C400 E900:900:900:900 I30    ; Set motor currents (mA) and motor idle factor in percent

M208 X-35:328.5 Y-49:243 Z0:280 C0:500              ; Set axis maxima & minima
M92  X1600  Y1600  Z1600 C200 E816:816:816:816      ; Set steps per mm

; # Endstops
M574 X1 Y1 S3                       ; Set X / Y endstop stall detection
M574 Z0                             ; No Z endstop
M574 C1 S3                          ; Stall detect coupler at low end of its range

; ## switch type Z-Probe
M558 P8 C"io3.in" H2 F250 I0 T20000 ; Set Z probe type to switch, the axes for which it is used and the dive height + speeds
G31 P200 X5 Y-11 Z0                 ; Set Z probe trigger value and x/y offset
M557 X5:295 Y0:195 P10:7            ; Set mesh bed leveling grid to 10x7

; # Speed, Acceleration & Jerk
M203 X35000 Y35000 Z1200 C5000 E3600:3600:3600:3600    ; Set maximum speeds (mm/min) (support a max tool feed rate of 60mm/s)
M201 X6000  Y6000  Z600  C500  E5000:5000:5000:5000    ; Set maximum accelerations (mm/s^2).
M566 X400   Y400   Z40   C2    E100:100:100:100        ; Set maximum instantaneous speed changes/Jerk (mm/min).

; Movement Tuning
; M593 F50                            ; cancel ringing at 50Hz

; # Stall detection
; ## Stall Detection X/Y
M915 X Y S1 F0 H280 R0

; ## Stall Detection Coupler
M915 C S6 F0 H200 R0                ; This still never stalls?

; # Heaters

; ## Bed Heater
M308 S0 P"temp0" Y"thermistor" A"Bed Heater Temp" T100000 B4138 C0   ; Thermistor underneath the heating pad (controls bed heater)
M308 S5 P"temp3" Y"thermistor" A"Top Bed Temp" T100000 B4138 C0      ; Thermistor on top of the bed (monitors temp at the printing surface)
M950 H0 C"out0" T0                                  ; Bed heater
M143 H0 S150                                        ; Set temperature limit for heater 0 to 150C
M140 H0                                             ; Bed heater is heater 0, set temp to 0.

; ## Tool Heaters
M308 S1 P"temp1" Y"thermistor" A"T1 Temp" T500000 B4723 C1.196220e-7 R4700     ; Slice Engineering Thermistor for T0
M950 H1 C"out1" T1                                                  ; Bind heater 1 to out1 pin and sensor 1
M143 H1 S350                                                        ; Set temperature limit for heater 1 to 350C

M308 S2 P"temp2" Y"thermistor" A"T2 Temp" T500000 B4723 C1.196220e-7 R4700     ; Slice Engineering Thermistor for T1
M950 H2 C"out2" T2                                                  ; Bind heater 2 to out2 pin and sensor 2
M143 H2 S350                                                        ; Set temperature limit for heater 2 to 350C

M308 S3 P"1.temp0" Y"thermistor" A"T3 Temp" R4700 T100000 B4388     ; E3D thermistor for T2
M950 H3 C"1.out0" T3                                                ; Bind heater 3 to 1.out0 pin and sensor 3
M143 H3 S350                                                        ; Set temperature limit for heater 3 to 350C

M308 S4 P"1.temp1" Y"thermistor" A"T4 Temp" R4700 T100000 B4388     ; E3D thermistor for T3
M950 H4 C"1.out1" T4                                                ; Bind heater 4 to 1.out1 pin and sensor 4
M143 H4 S350                                                        ; Set temperature limit for heater 4 to 350C

; Thermistor for testing
; M308 S6 P"1.temp2" Y"thermistor" A"Test Thermistor Temp" T100000 B4138 C0

; # Fan Setup
; ## Tool 0
M950 F0 C"out7"             ; Hot End Fan on out7
M106 P0 S1.0 H1 T40         ; Hot End Fan controls Heater 1, 100%, Shutoff at 40C
M950 F1 C"out4"             ; Part Cooling Fan
M106 P1 S0                  ; Part Cooling to 0 speed

; ## Tool 1
M950 F2 C"out8"             ; Hot End Fan on out8
M106 P2 S1.0 H2 T40         ; Hot End Fan controls Heater 2, 100%, Shutoff at 40C
M950 F3 C"out5"             ; Part Cooling Fan
M106 P3 S0                  ; Part Cooling to 0 speed

; ## Tool 2
M950 F4 C"1.out6"           ; Hot End Fan on expansion out 6
M106 P4 S1.0 H3 T40         ; Hot End Fan  Fan controls Heater 3, 100%, Shutoff at 40C
M950 F5 C"1.out3"           ; Part Cooling Fan
M106 P5 S0                  ; Part Cooling to 0 speed

; ## Tool 3
M950 F6 C"1.out7"           ; Hot End Fan on expansion out 7
M106 P6 S1.0 H4 T40         ; Hot End Fan Fan controls Heater 4, 100%, Shutoff at 40C
M950 F7 C"1.out4"           ; Part Cooling Fan
M106 P7 S0                  ; Part Cooling to 0 speed

; # Tools
M563 P0 S"T1" D0 H1 F1      ; Define tool 0
G10 P0 X0 Y0 Z0             ; Reset tool 0 axis offsets
G10 P0 R0 S0                ; Reset initial tool 0 active and standby temperatures to 0C

M563 P1 S"T2" D1 H2 F3      ; Define tool 1
G10 P1 X0 Y0 Z0             ; Reset tool 1 axis offsets
G10 P1 R0 S0                ; Reset initial tool 1 active and standby temperatures to 0C

M563 P2 S"T3" D2 H3 F5      ; Define tool 2
G10 P2 X0 Y0 Z0             ; Reset tool 2 axis offsets
G10 P2 R0 S0                ; Reset initial tool 2 active and standby temperatures to 0C

M563 P3 S"T4" D3 H4 F7      ; Define tool 3
G10 P3 X0 Y0 Z0             ; Reset tool 3 axis offsets
G10 P3 R0 S0                ; Reset initial tool 3 active and standby temperatures to 0C

; Load global variables
M98 P"/sys/globals.g"

;deselect tools
T-1
