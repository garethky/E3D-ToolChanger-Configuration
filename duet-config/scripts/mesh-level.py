# mesh-level.py

import argparse
import sys
import re
import numpy as np
from scipy.interpolate import Rbf


colonSeparatedNumbersPattern = re.compile('-?\\d+:-?\\d+')

def colonSeparatedNumbersArgType(arg_value):
    if not colonSeparatedNumbersPattern.match(arg_value):
        raise argparse.ArgumentTypeError
    return arg_value

parser = argparse.ArgumentParser(description='Supply arguments for processing mesh bed file')
# Add the arguments
parser.add_argument('-l',
                       '--probe-log-file',
                       metavar='POINTS_FILE',
                       type=str,
                       action='store',
                       required=True,
                       help='the path to points file')

parser.add_argument('-m',
                       '--mesh-file',
                       metavar='MESH_FILE',
                       type=str,
                       default='heightmap.csv',
                       action='store',
                       help='the path to save the mesh file')

parser.add_argument('-X',
                       '--x-extents',
                       metavar='X_EXTENTS',
                       type=colonSeparatedNumbersArgType,
                       action='store',
                       required=True,
                       help='Minimum and maximum X coordinates of the final reported grid, separated by \':\'. E.g. -X -10:200')

parser.add_argument('-Y',
                       '--y-extents',
                       metavar='Y_EXTENTS',
                       type=colonSeparatedNumbersArgType,
                       action='store',
                       required=True,
                       help='Minimum and maximum Y coordinates of the final reported grid, separated by \':\'. E.g. -Y 3:305')

parser.add_argument('-P',
                       '--num-points',
                       metavar='Y_EXTENTS',
                       type=colonSeparatedNumbersArgType,
                       action='store',
                       required=True,
                       help='Number of evently spaced points to record in the X and Y axis directions, separated by \':\'. E.g. -P 3:305')

parsedArgs = parser.parse_args()
xMin, xMax = [int(val) for val in parsedArgs.x_extents.split(':')]
yMin, yMax = [int(val) for val in parsedArgs.y_extents.split(':')]
xPoints, yPoints = [int(val) for val in parsedArgs.num_points.split(':')]


# Matches: Bed probe location: X:20.485, Y:-13
probePointPattern = re.compile('Bed probe location: X:(-?\\d*\\.?\\d*), Y:(-?\\d*\\.?\\d*)')
# Matches: Stopped at height -0.802
probeResultsPattern = re.compile('Stopped at height (-?\\d*\\.?\\d*)')
def parseProbedPoints() -> {}:
    # open the bed sample file and read all lines
    bedFile = open(parsedArgs.probe_log_file, 'r')
    lines = bedFile.readlines()
    bedFile.close()

    probedPoints = {}
    xyCoordinate = (0, 0)

    for line in lines:
        match = probePointPattern.search(line)
        if match != None:
            captured = match.groups()
            xyCoordinate = (float(captured[0]), float(captured[1]))
            continue

        match = probeResultsPattern.search(line)
        if match != None:
            captured = match.groups()
            zOffset = float(captured[0])

            if xyCoordinate not in probedPoints:
                probedPoints[xyCoordinate] = [];

            probedPoints[xyCoordinate].append(zOffset)
            continue

    return probedPoints

def averageZOffset(probedPoints):
    x = []
    y = []
    z = []

    for xyCoordinate, zOffsets in probedPoints.items():
        x.append(xyCoordinate[0])
        y.append(xyCoordinate[1])
        z.append(sum(zOffsets) / len(zOffsets))
    
    return (x, y, z)

def buildMeshPoints():
    minval = -1
    maxval =  1
    return np.meshgrid(np.linspace(xMin, xMax, xPoints), np.linspace(yMin, yMax, yPoints))

def upsampleBedMesh(averagedPoints):
    # This technique uses Radial Basis Functions (RBF) to interpolate the bed surface from random sample points
    # to see how RBF compare to other techniques: https://stackoverflow.com/questions/37872171/how-can-i-perform-two-dimensional-interpolation-using-scipy
    # https://docs.scipy.org/doc/scipy/reference/generated/scipy.interpolate.Rbf.html

    rbfInterpolator = Rbf(averagedPoints[0], averagedPoints[1], averagedPoints[2], smooth=0)
    return rbfInterpolator(*buildMeshPoints())   # sample the interpolated surface for the final bed mesh

def writeHeightmap(upsampledBedMesh):
    # open the bed sample file and read all lines
    meshFile = open(parsedArgs.mesh_file, 'w')

    # the header is necessary to convince RRF that we know what we are doing
    meshFile.write('RepRapFirmware height map file v2 generated at 2021-01-16 16:48\n')  #TODO: insert exact time
    meshFile.write('xmin,xmax,ymin,ymax,radius,xspacing,yspacing,xnum,ynum\n')
    settingsLine = [xMin, xMax, yMin, yMax, -1.00, round((xMax - xMin) / (xPoints - 1), 2), round((yMax - yMin) / (yPoints - 1), 2), xPoints, yPoints]
    meshFile.write(','.join(str(val) for val in settingsLine))
    meshFile.write('\n')

    for row in upsampledBedMesh:
        meshFile.write(',  '.join(str(round(val, 3)) for val in row))
        meshFile.write('\n')

    meshFile.close()

# process the line data into a heigtmap file
writeHeightmap(upsampleBedMesh(averageZOffset(parseProbedPoints())))
