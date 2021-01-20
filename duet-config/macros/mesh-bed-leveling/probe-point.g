; probe-point.g

; log where the probing is taking plaxe, removing the offsets of the sensor
M118 L1 S{"Bed probe location: X:" ^ move.axes[0].machinePosition + sensors.probes[0].offsets[0] ^ " Y:" ^ move.axes[1].machinePosition + sensors.probes[0].offsets[1]}

; Safety Check: if triggered, back up by the dive height
if sensors.probes[0].value[0] > sensors.probes[0].threshold
	G91
	G1 Z{sensors.probes[0].diveHeight} F{sensors.probes[0].speed * 60}
	G90

; probe as many times as requsted by the probe config
while iterations < sensors.probes[0].maxProbeCount
	G30 S-1
	G91
	; This back up by the hysteresis height, for my sensor 0.4 seems reliable
	; TODO: make this height configurable with a variable
	G1 Z0.4 F{sensors.probes[0].speed * 60}
	G90