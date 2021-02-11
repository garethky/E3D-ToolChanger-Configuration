; stabilize-bed-temp.g
;
; The heated bed has 2 thermistors installed, one directly on top of the heater and a second on top of the bed
; The top thermistor gives a realistic reading of the temp at the printing surface. This macro waits for that temperature to stabilize. 
; The exact target temp wont be known but will be lower than the set temp due to thermal loss.
; So instead of waiting for a target temp this code waits to see rate of temperature change drop below a set value.
;
; The script also implements a timeout and issues an error if this happens
;
; TODO: needs variables

; if the bed is not active, just return
if heat.heaters[0].active <= 0.0
	M99

echo "Bed heater is active, waiting for temp to stabilize"

; wait for bed heater to reach temperature
M190 S{heat.heaters[0].active}

; wait for the top bed sensor to stabilize
G10 L2 P9 Y0 ; keep the loop counter here because it can't be used in sub-expressions
while true
    ; Store the current temperature reading from the Top Bed thermistor:
    G10 L2 P9 X{sensors.analog[5].lastReading}
    
    ; Dwell for 1s
    G4 P1000
    
    ; if the temperature increase is less than 0.005 C over that time break the loop
    if {sensors.analog[5].lastReading - move.axes[0].workplaceOffsets[8]} < 0.0025
        echo "Top of bed temperature stabilized at ", sensors.analog[5].lastReading, "C in ", move.axes[1].workplaceOffsets[8], " seconds"
        break
    
    ; if 5 minutes has passed abort with an error
    if {{move.axes[1].workplaceOffsets[8]} > {5 * 60}}:
        abort "Bed temp stabilization failed after 5 minutes"

    ; increment the loop counter
    G10 L2 P9 Y{move.axes[1].workplaceOffsets[8] + 1}
