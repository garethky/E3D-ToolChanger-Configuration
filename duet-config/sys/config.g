; Configuration; Configuration file for Duet WiFi / Ethernet
; executed by the firmware on start-up

; General preferences
M111 S0                         ; Debugging off
G21                             ; Work in millimetres
G90                             ; Send absolute coordinates...
M83                             ; ...but relative extruder moves
M555 P2                         ; Set firmware compatibility to look like Marlin

; Network
M550 P"ToolChanger"                     ; Set machine name
M552 P0.0.0.0 S1                                        ; enable network and acquire dynamic address via DHCP
M586 P0 S1                         ; Enable HTTP
M586 P1 S0                         ; Disable FTP
M586 P2 S0                         ; Disable Telnet

M667 S1                         ; Select CoreXY mode    

; Drive direction
M569 P0 S0                         ; Drive 0 X
M569 P1 S0                         ; Drive 1 Y
M569 P2 S1                         ; Drive 2 Z
M569 P3 S0                         ; Drive 3 E0
M569 P4 S0                         ; Drive 4 E1
M569 P5 S1                         ; Drive 5 E2
M569 P6 S1                         ; Drive 6 E3
M569 P7 S0                         ; Drive 7 C (COUPLER)
M569 P8 S0                         ; Drive 8 UNUSED
M569 P9 S0                         ; Drive 9 UNUSED

; Endstops
M574 X1 Y1 S3                             ; Set X / Y endstop stall detection
M574 Z0                                 ; No Z endstop
M574 C1 S3                                ; Stall detect coupler at low end of its range

; Z- Probe
M950 F9 C"out9"                            ; We need a 24 volt 2 pin source to power the Z-Probe, this is it
M106 P9 S1.0                            ; turn the "fan" on 100% aka, 24 volt supply
M558 P5 C"io3.in" I0 H2 F360 T20000 A4 S0.005        ; Set Z probe type to switch, the axes for which it is used and the dive height + speeds
G31 P200 X5 Y-11                           ; Set Z probe trigger value, offset and trigger height
M557 X15:285 Y15:185 S45:42.5            ; Set mesh bed leveling size and density
M376 H10                                ; Set mesh compensation to taper linearly to nothing at 10mm

; Stepper Setup
M584 X0 Y1 Z2 C3 E4:5:6:7                         ; Apply custom axis to drive mapping
M208 X-35:328.5 Y-49:243 Z0:300 C0:500 S0         ; Set axis maxima & minima
M350 X16 Y16 Z16 I1                               ; Configure microstepping with interpolation for axes
M350 E16:16:16:16 I1                              ; Configure microstepping with interpolation for extruders
M350 C16 I1                                       ; Configure microstepping without interpolation for tool changer stepper
M92 X100 Y100 Z1600 C200 E816:816:816:816         ; Set steps per mm
M906 X1500 Y1500 Z1330 C400 E900:900:900:900 I30  ; Set motor currents (mA) and motor idle factor in percent (was 2000, 8000, 9000)

; X/Y StealthChop setup, credit mkudzia84@ https://github.com/mkudzia84/e3dtc-reprap3-conf/blob/master/macros/1.%20Stealth%20Enable
M569 P0 D3 F3 B2 Y05:01 V0 H20  ; force Stealth Chop mode
                                ; off time = 3
                                ; blanking time = 2
                                ; Histeresis start = 5, end 1
                                ; disable tpwmthrs by setting it to 0, force the driver never to leave stelth chop mode
                                ; thigh = 20
 
M569 P1 D3 F3 B2 Y05:01 V0 H20
; see if DC42's settings work before trying these stall detection settings
; M915 P0.0 S3 R0 T1
; M915 P0.1 S3 R0 T1

; Speeds
M203 X35000 Y35000 Z1200 C5000 E3600:3600:3600:3600    ; Set maximum speeds (mm/min) (support a max tool feed rate of 60mm/s)
M201 X6000  Y6000  Z600  C500  E5000:5000:5000:5000    ; Set maximum accelerations (mm/s^2).
M566 X400   Y400   Z60   C2    E100:100:100:100        ; Set maximum instantaneous speed changes/Jerk (mm/min).

M84 S120                         ; Set idle timeout

;Stall Detection Coupler
M915 C S6 F0 H200 R0

;Stall Detection X/Y
M915 X Y S1 F0 H280 R0                    ; X / Y Axes from dag's config

; Heaters

; bed heater
M308 S0 P"temp0" Y"thermistor" T100000 B4138 C0                 ; Set Bed thermistor
M950 H0 C"out0" T0                        ; Bed heater
M143 H0 S225                            ; Set temperature limit for heater 0 to 225C
M140 H0                                    ; Bed heater is heater 0, set them to 0.

/ Tool Heaters
M305 S"T0" P1 T500000 B4723 C1.196220e-7 R4700          ; Slice Engineering Thermistor for T0
M143 H1 S300                         ; Set temperature limit for heater 1 to 300C
M307 H1 A398.8 C120.7 D4.3 S1.00 V24.2 B0               ; heater auto tune

M305 S"T1" P2 T500000 B4723 C1.196220e-7 R4700          ; Slice Engineering Thermistor for T1
M143 H2 S300                         ; Set temperature limit for heater 2 to 300C
M307 H2 A398.8 C120.7 D4.3 S1.00 V24.2 B0               ; heater auto tune

M305 S"T2" P3 R4700 T100000 B4388            ; Set thermistor
M143 H3 S300                         ; Set temperature limit for heater 3 to 300C
M307 H3 A398.8 C120.7 D4.3 S1.00 V24.2 B0               ; heater auto tune

M305 S"T3" P4 R4700 T100000 B4388             ; Set thermistor 
M143 H4 S300                         ; Set temperature limit for heater 4 to 300C
M307 H4 A398.8 C120.7 D4.3 S1.00 V24.2 B0               ; heater auto tune

; Tools
M563 P0 S"T0" D0 H1 F2                    ; Define tool 0
G10 P0 X0 Y0 Z0                     ; Reset tool 0 axis offsets
G10 P0 R0 S0                         ; Reset initial tool 0 active and standby temperatures to 0C

M563 P1 S"T1" D1 H2 F4                    ; Define tool 1
G10 P1 X0 Y0 Z0                     ; Reset tool 1 axis offsets
G10 P1 R0 S0                         ; Reset initial tool 1 active and standby temperatures to 0C

M563 P2 S"T2" D2 H3 F6                    ; Define tool 2
G10 P2 X0 Y0 Z0                     ; Reset tool 2 axis offsets
G10 P2 R0 S0                         ; Reset initial tool 2 active and standby temperatures to 0C

M563 P3 S"T3" D3 H4 F8                    ; Define tool 3
G10 P3 X0 Y0 Z0                     ; Reset tool 3 axis offsets
G10 P3 R0 S0                         ; Reset initial tool 3 active and standby temperatures to 0C

; Fans
M106 P0 S0                        ; UNUSED
M106 P1 S255 H1 T40                    ; T0 HE
M106 P2 S0                        ; T0 PCF
M106 P3 S255 H2 T40                     ; T1 HE
M106 P4 S0                        ; T1 PCF 
M106 P5 S255 H3 T40                     ; T2 HE 
M106 P6 S0                         ; T2 PCF
M106 P7 S255 H4 T40                    ; T3 HE
M106 P8 S0                        ; T3 PCF

M593 F50                        ; cancel ringing at 50Hz

;tool offsets
; NOTE: Z-axis: making this number smaller (more negative) INCREASES the first layer height!
;       If your baby step value is negative, you want to decrease first layer height, so make this value more positive.
;       newValue = oldValue 
; Note: X/Y Axes: These work backwards. If you are off off your reference nozzle
G10 P0 X9.0    Y40.5   Z-4.050                    ; T0
G10 P1 X9.0    Y40.5   Z-4.050                    ; T1
G10 P2 X9.0    Y40.5   Z-4.051                      ; T2
G10 P3 X9.0    Y40.5   Z-4.200                       ; T3

;deselect tools
T-1
