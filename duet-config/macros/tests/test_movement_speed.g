while iterations < 16
	echo "moving at ", {50 + {iterations * 10}}, "mm/s"
	G1 F{{50 + {iterations * 10}} * 60}
	G1 X10 Y190
	;G1 X280
	G1 Y15
	;G1 X10
	G1 X10 Y190
