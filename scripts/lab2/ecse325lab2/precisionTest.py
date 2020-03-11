import math
import precision
import conversion

inputFile = open("lab2-x.txt")
outputFile = open("lab2-x-binary.txt", "w+")

contents = inputFile.read()
inputDec = contents.split()
outputBin = []
for x in inputDec:
    xFloat = float(x)
    outputBin.append(xFloat)

# test = []
# W = 0
# F = 0
# b = 0b0101

precision.findMaxMinWordValue(outputBin)
precision.findMaxLengthOfFractional([1.555])
"""
for x in inputDec:
    xFloat = float(x)
    xInt = int(math.floor(xFloat))
    xW = xInt.bit_length()
    if xW > W:
        W = xW
    outputBin.append(xInt)
    test.append(bin(xInt))
print(W)
print("\n")
print(outputBin)
print("\n")
print(test)
print("\n")
print(math.floor(-3.9375))
print("\n")
print(math.floor(3.9375))
"""


