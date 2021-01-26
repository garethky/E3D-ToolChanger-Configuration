# This script produces the G-Code lines that go into the macro to probe the bed
# it contains the minimum number of X/Y coordinate definitions to expand into the final probing points
# * X coordinates are reflected about the middle of the bed by the script
# * Y coordinates are used to repeat the same X-coordinate passes without having to re-specify the X-coordinates
# * Alternating lines of points have their X coordinates reversed to minimize travel moves
# * The order of the input lines does not matter, they get sorted by the Y coordinate from least to greatest


import collections

# this is the X coordinate where reflection of the lines happen, values less than this value are reflected
reflectionLine = 150

# format is ([X, X, X, X], [Y, Y, Y])
# The group of X coordinates is the left half of a single row of probing points
# Each Y value is the Y coordinate of a probing row where all of these X points will be sampled

rowDeffinitions = [
    ([32.35319, 67.03081, 99.22519, 133.90281], [-11.00000]),

    ([49.69200, 116.56400], [8.12800, 95.93600, 183.74400]),

    ([5.82832, 33.12800, 49.69200, 83.12800, 116.56400, 150.00000], [33.12800, 70.93600, 120.93600, 158.74400]),

    ([32.200, 67.18415, 99.07185], [203.00000])
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
            
            
            print('G1 X{{{} - sensors.probes[0].offsets[0]}} Y{{{} - sensors.probes[0].offsets[1]}} F{{sensors.probes[0].travelSpeed * 60}}'.format(xStr, yStr))
            print('M98 P"/sys/probe-point.g"')
            

reflectX()
printGCode(buildProbingRows())
