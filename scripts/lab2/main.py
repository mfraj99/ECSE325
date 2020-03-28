import precision
import conversion
import macsim

# open files for X value
inputFileX = open("ThuFrilab2-x.txt")
outputFileX = open("lab2-x-binary.txt", "w+")

# open files for Y value
inputFileY = open("ThuFrilab2-y.txt")
outputFileY = open("lab2-y-binary.txt", "w+")

# read files for X and output arrays of strings the values
contentsX = inputFileX.read()
inputFileXString = contentsX.split()  # turns input file contents to array of strings
inputFileXFloat = []

# read files for Y and output arrays of strings of the values
contentsY = inputFileY.read()
inputFileYString = contentsY.split()  # turns input file contents to array of strings
inputFileYFloat = []

# close input Y files
inputFileX.close()
inputFileY.close()

# converts the array of strings to an array of floats for X inputs
for x in inputFileXString:
    xFloat = float(x)
    inputFileXFloat.append(xFloat)

# converts the array of strings to an array of floats for Y inputs
for x in inputFileYString:
    yFloat = float(x)
    inputFileYFloat.append(yFloat)

wordPrecisionX = precision.findNumberOfBitsForWord(precision.findMinWordValue(inputFileXFloat), precision.findMaxWordValue(inputFileXFloat))
wordPrecisionY = precision.findNumberOfBitsForWord(precision.findMinWordValue(inputFileYFloat), precision.findMaxWordValue(inputFileYFloat))

# outputs for X
print("****************FOR X INPUTS****************\n")
print("Highest value word from list:", precision.findMaxWordValue(inputFileXFloat))
print("Lowest value word from list:", precision.findMinWordValue(inputFileXFloat))
print("Lowest number of bits needed for word value range:", wordPrecisionX)
print("Longest fractional portion of the value of list (in digits):", precision.findMaxLengthOfFractional(inputFileXString))

for x in inputFileXFloat:
    outputFileX.write(conversion.decToFixedPointBin(x, wordPrecisionX, precision.findMaxLengthOfFractional(inputFileXString)))
    outputFileX.write("\n")

outputFileX.close()
print("Output file ready for X inputs.\n")

# outputs for Y
print("****************FOR Y INPUTS****************\n")
print("Highest value word from list:", precision.findMaxWordValue(inputFileYFloat))
print("Lowest value word from list:", precision.findMinWordValue(inputFileYFloat))
print("Lowest number of bits needed for word value range:", wordPrecisionY)
print("Longest fractional portion of the value of list (in digits):", precision.findMaxLengthOfFractional(inputFileYString))

for x in inputFileYFloat:
    outputFileY.write(conversion.decToFixedPointBin(x, wordPrecisionY, precision.findMaxLengthOfFractional(inputFileYString)))
    outputFileY.write("\n")

outputFileY.close()
print("Output file ready for Y inputs.\n")

print("****************ADDITIONAL INFO****************\n")
print("The total value calculated by the MAC should be approximately:", macsim.macSimulation(inputFileXFloat, inputFileYFloat))
