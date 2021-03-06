; Bed Mesh Leveling

; wait for top of bed temp to stabilize (this returns immediatly if the bed is not active)
M98 P"/sys/stabilize-bed-temp.g"

; Home Z, only if not already homed
if move.axes[2].homed == false
    G28 Z

; set the sensor offset, this seems to get reset to 0,0 on my printer for some reason that I dont fully understand
G31 P200 X11.7 Y7.1 Z0

; delete any previous log file so previously probed points dont get sampled
M30 "/sys/meshbedprobe.log"
; start INFO logging to the SD card
M929 S2 P"/sys/meshbedprobe.log"

; probe bed points by moving to each X/Y coordinate and then calling the point probe script
; Probing row #1, Direction: ->
G1 X{32.353 - sensors.probes[0].offsets[0]} Y{-11.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{67.031 - sensors.probes[0].offsets[0]} Y{-11.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{99.225 - sensors.probes[0].offsets[0]} Y{-11.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{133.903 - sensors.probes[0].offsets[0]} Y{-11.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{166.097 - sensors.probes[0].offsets[0]} Y{-11.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{200.775 - sensors.probes[0].offsets[0]} Y{-11.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{232.969 - sensors.probes[0].offsets[0]} Y{-11.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{267.647 - sensors.probes[0].offsets[0]} Y{-11.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
; Probing row #2, Direction: <-
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{8.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{8.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{8.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{8.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
; Probing row #3, Direction: ->
G1 X{5.828 - sensors.probes[0].offsets[0]} Y{33.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{33.128 - sensors.probes[0].offsets[0]} Y{33.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{33.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{83.128 - sensors.probes[0].offsets[0]} Y{33.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{33.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{150.0 - sensors.probes[0].offsets[0]} Y{33.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{33.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{216.872 - sensors.probes[0].offsets[0]} Y{33.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{33.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{266.872 - sensors.probes[0].offsets[0]} Y{33.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{294.172 - sensors.probes[0].offsets[0]} Y{33.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
; Probing row #4, Direction: <-
G1 X{294.172 - sensors.probes[0].offsets[0]} Y{70.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{266.872 - sensors.probes[0].offsets[0]} Y{70.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{70.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{216.872 - sensors.probes[0].offsets[0]} Y{70.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{70.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{150.0 - sensors.probes[0].offsets[0]} Y{70.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{70.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{83.128 - sensors.probes[0].offsets[0]} Y{70.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{70.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{33.128 - sensors.probes[0].offsets[0]} Y{70.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{5.828 - sensors.probes[0].offsets[0]} Y{70.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
; Probing row #5, Direction: ->
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{95.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{95.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{95.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{95.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
; Probing row #6, Direction: <-
G1 X{294.172 - sensors.probes[0].offsets[0]} Y{120.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{266.872 - sensors.probes[0].offsets[0]} Y{120.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{120.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{216.872 - sensors.probes[0].offsets[0]} Y{120.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{120.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{150.0 - sensors.probes[0].offsets[0]} Y{120.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{120.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{83.128 - sensors.probes[0].offsets[0]} Y{120.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{120.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{33.128 - sensors.probes[0].offsets[0]} Y{120.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{5.828 - sensors.probes[0].offsets[0]} Y{120.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
; Probing row #7, Direction: ->
G1 X{5.828 - sensors.probes[0].offsets[0]} Y{158.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{33.128 - sensors.probes[0].offsets[0]} Y{158.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{158.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{83.128 - sensors.probes[0].offsets[0]} Y{158.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{158.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{150.0 - sensors.probes[0].offsets[0]} Y{158.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{158.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{216.872 - sensors.probes[0].offsets[0]} Y{158.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{158.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{266.872 - sensors.probes[0].offsets[0]} Y{158.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{294.172 - sensors.probes[0].offsets[0]} Y{158.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
; Probing row #8, Direction: <-
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{183.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{183.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{183.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{183.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
; Probing row #9, Direction: ->
G1 X{32.2 - sensors.probes[0].offsets[0]} Y{203.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{67.184 - sensors.probes[0].offsets[0]} Y{203.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{99.072 - sensors.probes[0].offsets[0]} Y{203.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{200.928 - sensors.probes[0].offsets[0]} Y{203.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{232.816 - sensors.probes[0].offsets[0]} Y{203.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"
G1 X{267.8 - sensors.probes[0].offsets[0]} Y{203.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/sys/probe-point.g"

; stop logging
M929 S0

; call the custom GCode to create the heightmap file, all params must be passed as strings
; the paths to the files here need to be in relative format, the scripts working directory is the root of the virtual SD card
M7029 X"0:300" Y"0:200"

; Update DWC with new mesh
; The DWC only updates the mesh in the GUI when G29 is used to load it, so load it now and then disable compensation
G29 S1
G29 S2

M98 P"/macros/Park"