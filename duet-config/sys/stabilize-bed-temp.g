; bed-temp-stabilize.g
;
; The heated bed has 2 thermistors installed, one directly on top of the heater and a second on top of the bed
; The top thermistor gives a realistic reading of th temp at the printing surface. This macro waits for that temprature to stabilize
; with respect to the bed heater temprature. The exact target temp wont be known but will be lower than the set temp due to thermal loss.
; So instead of waiting for a target temp this code waits to see rate of temprature change drop below a set value.
;
; The script also implements a timeout and issues an error if this happens
;
; TODO: needs variables

; if the bed is not active, just return
if heat.heaters[0].active <= 0.0
	M99

echo "Bed heater is active, waiting for temp to stabilize"

; wait for bed heater to reach temprature
M190 S{heat.heaters[0].active}

; wait for the top bed sensor to stabilize
G10 L2 P9 Y0 ; save the iterations counter here because its kinda broken in expressions
while true
    ; Store the current temprature reading from the Top Bed thermistor:
    G10 L2 P9 X{sensors.analog[5].lastReading}
    
    ; Dwell for 500ms
    G4 P500
    
    ; if the temprature delta is less than 0.01 C over that time break the loop
    if {sensors.analog[5].lastReading - move.axes[0].workplaceOffsets[8]} < 0.005
        echo "Top of bed temprature stabilized at ", sensors.analog[5].lastReading, "C in ", move.axes[1].workplaceOffsets[8] / 2, " seconds"
        break
    
    ; if 5 minutes has passed abort with an error
    if {{move.axes[1].workplaceOffsets[8] / 2} > {5 * 60}}:
        abort "Bed temp stabilization failed after 5 minutes"

    ; incrament the loop counter
    G10 L2 P9 Y{move.axes[1].workplaceOffsets[8] + 1}
