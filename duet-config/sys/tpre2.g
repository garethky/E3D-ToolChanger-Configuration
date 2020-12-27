; tpre2.g
; called before tool 2 is selected

;Unlock Coupler
M98 P"/macros/Unlock Coupler"

; Move to safe Y distance from Tool heads
G1 Y150 F15000

;Move to location
G1 X214.5 Y200 F15000

;Move in
G1 X214.5 Y230 F15000

;Collect
G1 X214.5 Y240 F2500

;Close Coupler
M98 P"/macros/Lock Coupler"

;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
G91
G1 Z10 F1000
G90

;Move Out
G1 X214.5 Y150 F5000
