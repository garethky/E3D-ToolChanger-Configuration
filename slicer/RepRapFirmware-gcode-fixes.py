#RRF-fixes.py
# Save in Prusa Slicer Scripts folder
# Add to Prusa Slicer post processing scripts


import sys

f = open(sys.argv[1],"r")
gcode = f.read()
f.close()

gcode = gcode.replace("M204 S","M204 P")  # pending this issue: https://github.com/prusa3d/PrusaSlicer/issues/5599

f = open(sys.argv[1],"w")
f.write(gcode)
f.close()