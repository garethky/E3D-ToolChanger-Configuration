; probe-point.g
;
; This macro probes 1 point after the tool head has been positioned over it
; It uses the probes configured offsets, diveHeight, maxProbeCount and speed to perform probing 
; It has its own hysteresis height that is not part of the object model
; TODO: make hysteresis height configurable with a variable

; wait for move to the probe point to complete before checking the object model
M400

; log where the probing is taking place, removing the offsets of the sensor
; by convention RRF subtracts your offsets, so they are added back here to arrive at the Machine Position being probed
M118 L1 S{"Bed probe location: X:" ^ move.axes[0].machinePosition + sensors.probes[0].offsets[0] ^ " Y:" ^ move.axes[1].machinePosition + sensors.probes[0].offsets[1]}

; Safety Check: if the sensor is triggerd on arrival, back up by the dive height
if sensors.probes[0].value[0] > sensors.probes[0].threshold
    G91
    G1 Z{sensors.probes[0].diveHeight} F{sensors.probes[0].speed * 60}
    G90

; probe as many times as requsted by the probe's maxProbeCount config
while iterations < sensors.probes[0].maxProbeCount
    G30 S-1
    ; This backs up by the hysteresis height, for my sensor 0.4 seems reliable
    ; This is smaller than the dive height, saving z travel time
    G91
    G1 Z0.4 F{sensors.probes[0].speed * 60}
    G90
