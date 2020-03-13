import math


# takes in the values from input file, length of bits for representing the whole number portion of the float and length
# of the fractional portion of the float, the whole number portion is calculated first and then has the floating point
# portion concatenated to it, it is then outputted through main to a new file
def decToFixedPointBin(decimalFloatValue, numberOfIntBits, numberOfFracBits):

    # for 0 and -0 outputs a binary string of 0s of length numberOfIntBits + numberOfFracBits
    if decimalFloatValue == 0:
        parameter = '{0:0' + str(numberOfIntBits + numberOfFracBits) + 'b}'
        return parameter.format(0)

    if decimalFloatValue > 0:
        intValue = int(math.floor(decimalFloatValue))
        parameter = '{0:0' + str(numberOfIntBits) + 'b}'
        binaryInt = parameter.format(intValue)

        decValue = float(decimalFloatValue - math.floor(decimalFloatValue))
        if decValue == 0.0:
            parameter = '{0:0' + str(numberOfFracBits) + 'b}'
            return binaryInt + parameter.format(0)
        binaryDec = decFractionalToBin(decValue, numberOfFracBits)
        return binaryInt + binaryDec

    if decimalFloatValue < 0:
        intValue = abs(math.ceil(decimalFloatValue))
        parameter = '{0:0' + str(numberOfIntBits) + 'b}'
        binaryInt = parameter.format(intValue)
        complementBinaryInt = ''
        for bit in binaryInt:
            if bit == '1':
                complementBinaryInt += '0'
            if bit == '0':
                complementBinaryInt += '1'
        complementBinaryInt = binAdd(complementBinaryInt, '1')
        decValue = abs(float(decimalFloatValue - math.ceil(decimalFloatValue)))
        if decValue == 0.0:
            parameter = '{0:0' + str(numberOfFracBits) + 'b}'
            return complementBinaryInt + parameter.format(0)
        binaryDec = decFractionalToBin(decValue, numberOfFracBits)
        wholeBin = binaryInt + binaryDec
        reversedWholeBin = ''
        for bit in wholeBin:
            if bit == '1':
                reversedWholeBin += '0'
            if bit == '0':
                reversedWholeBin += '1'
        reversedWholeBin = binAdd(reversedWholeBin, '1')
        return reversedWholeBin


# takes in the floating point decimal value and outputs a  binary string of the fractional portion
def decFractionalToBin(decimalFloatValue, numberOffFracBits):
    binaryDec = ''
    while decimalFloatValue != 0.0:
        decimalFloatValue = 2 * decimalFloatValue
        if decimalFloatValue >= 1:
            binaryDec = binaryDec + '1'
            decimalFloatValue = decimalFloatValue - 1
            continue
        if decimalFloatValue < 1:
            binaryDec = binaryDec + '0'
            continue
    while len(binaryDec) < numberOffFracBits:
        binaryDec = binaryDec + '0'
    return binaryDec
    #
    # if decimalFloatValue < 0:
    #     decimalFloatValue = abs(decimalFloatValue)
    #     while decimalFloatValue != 0.0:
    #         decimalFloatValue = 2 * decimalFloatValue
    #         if decimalFloatValue >= 1:
    #             binaryDec = binaryDec + '1'
    #             decimalFloatValue = decimalFloatValue - 1
    #             continue
    #         if decimalFloatValue < 1:
    #             binaryDec = binaryDec + '0'
    #             continue
    #     while len(binaryDec) < numberOffFracBits:
    #         binaryDec = binaryDec + '0'
    #     reversedBinDec = ''
    #     finalBinDec = ''
    #     for bit in binaryDec:
    #         if bit == '1':
    #             reversedBinDec += '0'
    #         if bit == '0':
    #             reversedBinDec += '1'
    #     finalBinDec = binAdd(reversedBinDec, '1')
    #     return finalBinDec


# adds binary numbers together
# taken from https://stackoverflow.com/questions/21420447/need-help-in-adding-binary-numbers-in-python
def binAdd(s1, s2):
    if not s1 or not s2:
        return ''

    maxlen = max(len(s1), len(s2))

    s1 = s1.zfill(maxlen)
    s2 = s2.zfill(maxlen)

    result = ''
    carry = 0

    i = maxlen - 1
    while i >= 0:
        s = int(s1[i]) + int(s2[i])
        if s == 2:  # 1+1
            if carry == 0:
                carry = 1
                result = "%s%s" % (result, '0')
            else:
                result = "%s%s" % (result, '1')
        elif s == 1:  # 1+0
            if carry == 1:
                result = "%s%s" % (result, '0')
            else:
                result = "%s%s" % (result, '1')
        else:  # 0+0
            if carry == 1:
                result = "%s%s" % (result, '1')
                carry = 0
            else:
                result = "%s%s" % (result, '0')

        i = i - 1;

    if carry > 0:
        result = "%s%s" % (result, '1')
    return result[::-1]
