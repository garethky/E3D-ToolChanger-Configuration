
; disable any active mesh compensation
G29 S2

; delete any previous log file so previously probed points dont get sampled
M30 "/sys/bed-sample.log"
; start DEBUG logging to the SD card
M929 S3 P"/sys/bed-sample.log"

; probe bed points by moving to each X/Y coordinate and then calling the point probe script
; Probing row #1, Direction: ->
G1 X{20.485 - sensors.probes[0].offsets[0]} Y{-13 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{51.807 - sensors.probes[0].offsets[0]} Y{-13 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{83.128 - sensors.probes[0].offsets[0]} Y{-13 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{-13 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{150.0 - sensors.probes[0].offsets[0]} Y{-13 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{-13 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{216.872 - sensors.probes[0].offsets[0]} Y{-13 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{248.193 - sensors.probes[0].offsets[0]} Y{-13 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{279.515 - sensors.probes[0].offsets[0]} Y{-13 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
; Probing row #2, Direction: <-
G1 X{263.744 - sensors.probes[0].offsets[0]} Y{8.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{236.872 - sensors.probes[0].offsets[0]} Y{8.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{196.872 - sensors.probes[0].offsets[0]} Y{8.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{170.0 - sensors.probes[0].offsets[0]} Y{8.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{130.0 - sensors.probes[0].offsets[0]} Y{8.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{103.128 - sensors.probes[0].offsets[0]} Y{8.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{63.128 - sensors.probes[0].offsets[0]} Y{8.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{36.256 - sensors.probes[0].offsets[0]} Y{8.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
; Probing row #3, Direction: ->
G1 X{10.0 - sensors.probes[0].offsets[0]} Y{28.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{28.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{83.128 - sensors.probes[0].offsets[0]} Y{28.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{28.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{150.0 - sensors.probes[0].offsets[0]} Y{28.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{28.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{216.872 - sensors.probes[0].offsets[0]} Y{28.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{28.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{290.0 - sensors.probes[0].offsets[0]} Y{28.128 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
; Probing row #4, Direction: <-
G1 X{290.0 - sensors.probes[0].offsets[0]} Y{52.032 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{52.032 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{216.872 - sensors.probes[0].offsets[0]} Y{52.032 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{52.032 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{150.0 - sensors.probes[0].offsets[0]} Y{52.032 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{52.032 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{83.128 - sensors.probes[0].offsets[0]} Y{52.032 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{52.032 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{10.0 - sensors.probes[0].offsets[0]} Y{52.032 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
; Probing row #5, Direction: ->
G1 X{10.0 - sensors.probes[0].offsets[0]} Y{75.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{75.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{83.128 - sensors.probes[0].offsets[0]} Y{75.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{75.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{150.0 - sensors.probes[0].offsets[0]} Y{75.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{75.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{216.872 - sensors.probes[0].offsets[0]} Y{75.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{75.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{290.0 - sensors.probes[0].offsets[0]} Y{75.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
; Probing row #6, Direction: <-
G1 X{263.744 - sensors.probes[0].offsets[0]} Y{95.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{236.872 - sensors.probes[0].offsets[0]} Y{95.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{196.872 - sensors.probes[0].offsets[0]} Y{95.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{170.0 - sensors.probes[0].offsets[0]} Y{95.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{130.0 - sensors.probes[0].offsets[0]} Y{95.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{103.128 - sensors.probes[0].offsets[0]} Y{95.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{63.128 - sensors.probes[0].offsets[0]} Y{95.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{36.256 - sensors.probes[0].offsets[0]} Y{95.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
; Probing row #7, Direction: ->
G1 X{10.0 - sensors.probes[0].offsets[0]} Y{115.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{115.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{83.128 - sensors.probes[0].offsets[0]} Y{115.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{115.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{150.0 - sensors.probes[0].offsets[0]} Y{115.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{115.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{216.872 - sensors.probes[0].offsets[0]} Y{115.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{115.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{290.0 - sensors.probes[0].offsets[0]} Y{115.936 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
; Probing row #8, Direction: <-
G1 X{290.0 - sensors.probes[0].offsets[0]} Y{139.84 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{139.84 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{216.872 - sensors.probes[0].offsets[0]} Y{139.84 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{139.84 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{150.0 - sensors.probes[0].offsets[0]} Y{139.84 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{139.84 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{83.128 - sensors.probes[0].offsets[0]} Y{139.84 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{139.84 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{10.0 - sensors.probes[0].offsets[0]} Y{139.84 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
; Probing row #9, Direction: ->
G1 X{10.0 - sensors.probes[0].offsets[0]} Y{163.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{49.692 - sensors.probes[0].offsets[0]} Y{163.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{83.128 - sensors.probes[0].offsets[0]} Y{163.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{163.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{150.0 - sensors.probes[0].offsets[0]} Y{163.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{163.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{216.872 - sensors.probes[0].offsets[0]} Y{163.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{250.308 - sensors.probes[0].offsets[0]} Y{163.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{290.0 - sensors.probes[0].offsets[0]} Y{163.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
; Probing row #10, Direction: <-
G1 X{263.744 - sensors.probes[0].offsets[0]} Y{183.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{236.872 - sensors.probes[0].offsets[0]} Y{183.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{196.872 - sensors.probes[0].offsets[0]} Y{183.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{170.0 - sensors.probes[0].offsets[0]} Y{183.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{130.0 - sensors.probes[0].offsets[0]} Y{183.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{103.128 - sensors.probes[0].offsets[0]} Y{183.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{63.128 - sensors.probes[0].offsets[0]} Y{183.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{36.256 - sensors.probes[0].offsets[0]} Y{183.744 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
; Probing row #11, Direction: ->
G1 X{10.0 - sensors.probes[0].offsets[0]} Y{205.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{43.564 - sensors.probes[0].offsets[0]} Y{205.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{83.128 - sensors.probes[0].offsets[0]} Y{205.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{116.564 - sensors.probes[0].offsets[0]} Y{205.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{150.0 - sensors.probes[0].offsets[0]} Y{205.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{183.436 - sensors.probes[0].offsets[0]} Y{205.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{216.872 - sensors.probes[0].offsets[0]} Y{205.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{256.436 - sensors.probes[0].offsets[0]} Y{205.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"
G1 X{290.0 - sensors.probes[0].offsets[0]} Y{205.0 - sensors.probes[0].offsets[1]} F{sensors.probes[0].travelSpeed * 60}
M98 P"/macros/mesh-bed-leveling/probe-point.g"

; stop logging
M929 S0


; call the custom command to create the heightmap file
; M1029 P"bed-sample.log"