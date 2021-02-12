; Configuration; Configuration file for Duet 3 with Raspberry Pi + 3HC tool board
; executed by the firmware on start-up

; # General preferences
M111 S0                             ; Debugging off
G21                                 ; Work in millimeters
G90                                 ; Send absolute coordinates...
M83                                 ; ...but relative extruder moves
M555 P2                             ; Set firmware compatibility to look like Marlin
M667 S1                             ; Select CoreXY mode
M84 S120                            ; Set idle timeout

; #######################
; # Drives & Axes

; ## main board drivers
M569 P0   S1 D3 F3 H16 V16              ; Drive 0 X
M569 P1   S0 D3 F3 H16 V16              ; Drive 1 Y
M569 P2   S1 D3 H16 V16                 ; Drive 2 Z
M569 P3   S0 D2                         ; Drive 3 C
M569 P4   S0 D2 H5 V5                   ; Drive 4 E0
M569 P5   S1 D2 H5 V5                   ; Drive 5 E1
; ## Tool board drivers
M569 P1.1 S1 D2 H5 V5                   ; Drive 7 E2
M569 P1.2 S0 D2 H5 V5                   ; Drive 8 E3
M569 P1.0 S0                            ; Drive 6 (not used)

; Create machine axes and assign drives to them
M584 X0 Y1 Z2 C3 E4:5:1.1:1.2      

; ############################
; Machine Movement Parameters

; Microstepping
M350 X16 Y16 Z16 C16 E16:16:16:16 I1     ; Configure x16 microstepping with interpolation on all axes

; Steps per MM (computed from microstepping)
M92 X{6.25 * move.axes[0].microstepping.value} Y{6.25 * move.axes[1].microstepping.value} Z{100 * move.axes[2].microstepping.value}
M92 C{12.5 * move.axes[3].microstepping.value}
M92 E830:830:830:830   ;TODO: I don't know the correct expression syntax for this

; Set motor currents (mA) and motor idle factor in percent
M906 X1700 Y1700 Z1330 C400 E700:700:700:700 I30 

; Enabled Stall Guard™️ and Cool Step™️ in the Trinamic stepper drivers
;M915 P0:P1 S10 F0 H80 R0 T50764

; Speed, Acceleration & Jerk
M203 X{170 * 60} Y{170 * 60} Z{10 * 60} C{300 * 60}  E3600:3600:3600:3600    ; Max speeds (mm/min)
M201 X2000       Y2000       Z240       C400         E3000:3000:3000:3000    ; Max accelerations (mm/s^2)
M566 X{10 * 60}  Y{10 * 60}  Z{2 * 60}  C{0.6 * 60}  E600:600:600:600        ; Max instantaneous speed changes/Jerk (mm/min)

; cancel ringing at 50Hz
;M593 F0

; #######################
; # Homing Configuration

; ## Endstops
M574 X1 S1 P"io1.in"                ; Set X / Y endstop switches
M574 Y1 S1 P"io0.in"
M574 Z0                             ; No Z endstop
M574 C1 S3                          ; Stall detect coupler at low end of its range

; ## Z-axis homing switch
M558 P8 C"io4.in" I0 A3 S0.03 H2 F150 T{200 * 60} ; Set Z probe type to switch, the axes for which it is used and the dive height + speeds
G31 P200                            ; Set Z probe trigger value, see bed.g for the offset
M557 X5:295 Y5:195  P15:10          ; Set mesh bed leveling grid

; ## Stall Detection Coupler.
; It never truly stalls correctly so the detection is range is set to the minimum value, also stall logging is enabled as it might notify you of an error
M915 C S63 F0 H200 R1

; #######################
; # Heaters

; ## Bed Heater
M308 S0 P"temp0" Y"thermistor" A"Bed Heater Temp" T100000 B4138 C0   ; Thermistor underneath the heating pad (controls bed heater)
M308 S5 P"temp3" Y"thermistor" A"Top Bed Temp" T100000 B4138 C0      ; Thermistor on top of the bed (monitors temp at the printing surface)
M950 H0 C"out0" T0 Q60                              ; Bed heater
M143 H0 S150                                        ; Set temperature limit for heater 0 to 150C
M140 H0                                             ; Bed heater is heater 0, set temp to 0.

; ## Tool Heaters
M308 S1 P"temp1" Y"thermistor" A"T1 Temp" R4700 T100000 B4388       ; E3D thermistor for T1
M950 H1 C"out1" T1                                                  ; Bind heater 1 to out1 pin and sensor 1
M143 H1 S350                                                        ; Set temperature limit for heater 1 to 350C

M308 S2 P"temp2" Y"thermistor" A"T2 Temp" T500000 B4723 C1.196220e-7 R4700     ; Slice Engineering Thermistor for T2
M950 H2 C"out2" T2                                                  ; Bind heater 2 to out2 pin and sensor 2
M143 H2 S350                                                        ; Set temperature limit for heater 2 to 350C

M308 S3 P"1.temp0" Y"thermistor" A"T3 Temp" R4700 T100000 B4388     ; E3D thermistor for T3
M950 H3 C"1.out0" T3                                                ; Bind heater 3 to 1.out0 pin and sensor 3
M143 H3 S350                                                        ; Set temperature limit for heater 3 to 350C

M308 S4 P"1.temp1" Y"thermistor" A"T4 Temp" R4700 T100000 B4388     ; E3D thermistor for T4
M950 H4 C"1.out1" T4                                                ; Bind heater 4 to 1.out1 pin and sensor 4
M143 H4 S350                                                        ; Set temperature limit for heater 4 to 350C

; Thermistor for testing
; M308 S6 P"1.temp2" Y"thermistor" A"Test Thermistor Temp" T100000 B4138 C0

; # Fan Setup
; ## Tool 0
M950 F0 C"out7"             ; Hot End Fan on out7
M106 P0 S1.0 H1 T40         ; Hot End Fan controls Heater 1, 100%, Shutoff at 40C
M950 F1 C"out4" Q10         ; Part Cooling Fan
M106 P1 S0                  ; Part Cooling to 0 speed

; ## Tool 1
M950 F2 C"out8"             ; Hot End Fan on out8
M106 P2 S1.0 H2 T40         ; Hot End Fan controls Heater 2, 100%, Shutoff at 40C
M950 F3 C"out5" Q10         ; Part Cooling Fan
M106 P3 S0                  ; Part Cooling to 0 speed

; ## Tool 2
M950 F4 C"1.out6"           ; Hot End Fan on expansion out 6
M106 P4 S1.0 H3 T40         ; Hot End Fan  Fan controls Heater 3, 100%, Shutoff at 40C
M950 F5 C"1.out3" Q10       ; Part Cooling Fan
M106 P5 S0                  ; Part Cooling to 0 speed

; ## Tool 3
M950 F6 C"1.out7"           ; Hot End Fan on expansion out 7
M106 P6 S1.0 H4 T40         ; Hot End Fan Fan controls Heater 4, 100%, Shutoff at 40C
M950 F7 C"1.out4" Q10       ; Part Cooling Fan
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
