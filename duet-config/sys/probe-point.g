; probe-point.g
;
; This macro probes 1 point after the tool head has been positioned over it
; It uses the probes configured offsets, diveHeight, maxProbeCount and speed to perform probing 
; This code assumes the Z probe is Probe 0 (sensors.probes[0]). You should change this script to suit any custom axis and probe mappings.
;
; This code has its own hysteresis height that is not part of the object model.
; TODO: make hysteresis height configurable with a variable

; wait for move to the probe point to complete before checking the object model
M400

; enable relative moves
G91

; Safety Check: if the sensor is triggered on arrival, back up by the dive height
if sensors.probes[0].value[0] > sensors.probes[0].threshold
    G1 Z{sensors.probes[0].diveHeight} F{sensors.probes[0].speed * 60}

; probe as many times as requested by the probe's maxProbeCount config
while iterations < sensors.probes[0].maxProbeCount
    ; Probe the point but do not record anything
    G30 S-1

    ; log where the probing is taking place, removing the offsets of the sensor, and the Z position
    ; by convention RRF subtracts your sensor offsets, so they are added back here to arrive at the Machine Position being probed
    M118 L1 S{"Mesh Point: X" ^ move.axes[0].machinePosition + sensors.probes[0].offsets[0] ^ " Y" ^ move.axes[1].machinePosition + sensors.probes[0].offsets[1] ^ " Z" ^ move.axes[2].machinePosition}

    ; This drops the Z by the hysteresis height, for my sensor 0.2 seems reliable
    ; This is smaller than the dive height, saving z travel time
    ; also the retract speed is 1.5x the dive speed saving time
    G1 Z0.2 F{sensors.probes[0].speed * 2 * 60}

; At the end of the loop pick the sensor up an additional 0.2
;G1 Z0.2 F{sensors.probes[0].speed * 1.5 * 60}

; disable relative moves
G90
