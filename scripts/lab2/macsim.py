# simulates mac functionality using the values from the file


def macSimulation(listOfXFloats=[], listOfYFloats=[], *args):
    macTotal = 0
    for x in range(1000):
        macTotal = macTotal + (listOfXFloats[x] * listOfYFloats[x])
    return macTotal
