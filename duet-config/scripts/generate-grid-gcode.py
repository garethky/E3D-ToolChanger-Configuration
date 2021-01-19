# This script produces the G-Code lines that go into the macro to probe the bed
# it contains the minimum number of X/Y coordinate definitions to expand into the final probing points
# * X coordinates are reflected about the middle of the bed
# * Y coordinates are used to repeat the same X-coordinate passes without having to re-specify the X-coordinates
# * Alternating lines of points have their X coordinates reversed to minimize travel moves
# * The order of the input lines does not matter, they get sorted by the Y coordinate from least to greatest


import collections

xProbeOffset = 0
yProbeOffset = -12
probeTravelSpeed = str(round(150 * 60))
probeDiveSpeed = str(round(4.2 * 60))
probeDiveHeight = "1"

# this is the X coordinate where reflection of the lines happen
reflectionLine = 150

# format is ([X, X, X, X], [Y, Y, Y])
# The group of X coordinates is the left half of a single row of probing points
# Each Y value is the Y coordinate of a probing row where all of these X points will be sampled

rowDeffinitions = [
    # row 1 is unique
    ([20.48528, 51.80664, 83.12800, 116.56400, 150.00000], [-13]),

    # row 2 repeats 3 times
    ([36.25600, 63.12800, 103.12800, 130.00000], [8.12800, 95.93600, 183.74400]),

    # row 4 repeats 6 times
    ([10.00000, 49.69200, 83.12800, 116.564, 150.00000], [28.12800, 52.03200, 75.93600, 115.93600, 139.84000, 163.74400]),

    # row 4 is unique
    ([10.00000, 43.56400, 83.12800, 116.56400, 150.00000], [205.00000])
]

# Step 1 is to extend the X arrays by reflecting them about the reflectionLine
def reflectX():
    for rowDef in rowDeffinitions:
        xArray = rowDef[0]
        for xVal in reversed(xArray):
            if (xVal < reflectionLine):
                xArray.append(reflectionLine + (reflectionLine - xVal))

# Then the rowDeffinitions are expanded into a map with a unique Y value as the key for each row of probe points
# The Y values in the map are sorted from smallest to largest
def buildProbingRows():
    probingRows = {}
    for rowDef in rowDeffinitions:
        xValues = rowDef[0]
        yValues = rowDef[1]
        for y in yValues:
            probingRows[y] = xValues
    
    return collections.OrderedDict(sorted(probingRows.items()))

# Finally the G-Code is emitted with the X values reversed in order on alternating rows
def printGCode(probingRows):
    rowCount = 1
    for y, xValues in probingRows.items():
        xValuesOrdered = reversed(xValues) if rowCount % 2 == 0  else xValues
        print('; Probing row #' + str(rowCount) + ', Direction: ' + ('<-' if rowCount % 2 == 0  else '->'));
        rowCount += 1
        
        yStr = str(round(y, 3))
        for x in xValuesOrdered:
            xStr = str(round(x, 3))
            xOffsetStr = str(round(x - xProbeOffset, 3))
            yOffsetStr = str(round(y - yProbeOffset, 3))
            print('M118 L1 S"Bed probe location: X:{} Y:{}"'.format(xStr, yStr))
            print('G1 X{} Y{} F{}'.format(xOffsetStr, yOffsetStr, probeTravelSpeed))
            # probe twice
            for i in range(0, 2):
            	print('G30 S-1')
            	print('G1 Z{} F{}'.format(probeDiveHeight, probeDiveSpeed))
            

reflectX()
printGCode(buildProbingRows())
