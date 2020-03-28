import math
import re  # import for regex


# finds the max value of the whole value portions of a inputted list of floats by flooring the values
def findMaxWordValue(listOfFloats=[], *args):
    currentMax = 0
    for x in listOfFloats:
        if x > 0:
            outputInteger = math.floor(x)  # convert list value from float to integer
            if outputInteger > currentMax:
                currentMax = outputInteger
    return currentMax


# finds the min value of the whole value portions of a inputted list of floats by ceiling the values
def findMinWordValue(listOfFloats=[], *args):
    currentMin = 0
    for x in listOfFloats:
        if x < 0:
            outputInteger = math.ceil(x)
            if outputInteger < currentMin:
                currentMin = outputInteger
    return currentMin


# calculates the number of bits needed for the whole number portion of the inputs by incrementing by 1 and comparing
# outputs of the findmax and findmin functions with the range [-2^(n-1), 2^(n-1)-1]
def findNumberOfBitsForWord(lowestValue, highestValue):
    n = 1  # number of bits/ incrementor
    topRange = (2 ** (n - 1)) - 1
    bottomRange = -(2 ** (n - 1))
    while bottomRange > lowestValue or topRange < highestValue:
        n += 1
        topRange = (2 ** (n - 1)) - 1
        bottomRange = -(2 ** (n - 1))
    return n


# finds the longest length in digits of the fractional portions of the inputted list by using regex to select from the
# decimal point to the end of the string, subtracting 1 for decimal point and using an incrementor
def findMaxLengthOfFractional(listOfFloats=[], *args):
    currentMaxLength = 0
    finalMaxLength = 0
    for x in listOfFloats:
        fractionalSubstring = re.search('\.\d+', x)  # capture the decimal point and all things after it
        if fractionalSubstring:
            foundFractional = fractionalSubstring.group()
            currentMaxLength = len(foundFractional) - 1  # subtract 1 for the decimal point being captured by the regex
        if currentMaxLength > finalMaxLength:
            finalMaxLength = currentMaxLength
    return finalMaxLength

    # ###############<<<<UNUSED FUNCTION LOGIC>>>>################

    # https://stackoverflow.com/questions/52013220/how-to-remove-the-floating-number-ending-in-python
    # https://stackoverflow.com/questions/152580/whats-the-canonical-way-to-check-for-type-in-python
    # https://stackoverflow.com/questions/4541155/check-if-a-number-is-int-or-float
    # https://stackoverflow.com/questions/3501382/checking-whether-a-variable-is-an-integer-or-not

    # again this approach fails due to floating point error due to the *10 operation

    # for x in listOfFloats:
    #     while isinstance(x, float):  # again floating point error where it keeps extending .0 and loops infinitely,
    #         # tried multiple prebuilt functions, none work out of the box
    #
    #         # https://stackoverflow.com/questions/16794753/find-the-number-of-digits-in-the-fractional-part-of-a-decimal-number-in-python
    #
    #         # maybe try counting as a string instead?
    #         x *= 10
    #         currentMaxLength += 1
    #         if currentMaxLength > finalMaxLength:
    #             finalMaxLength = currentMaxLength

    # the below approach does not work do to floating point errors

    # for x in listOfFloats:
    #     if x > 0:
    #         while x != 0:
    #             x *= 10.0
    #             currentMaxLength += 1
    #             x = x - math.trunc(x)
    #             if currentMaxLength > finalMaxLength:
    #                 finalMaxLength = currentMaxLength
    #     if x < 0:  # this segment does not currently work in general due to infinite loop runtime error
    #         while x != 0:
    #             x *= 10
    #             currentMaxLength += 1
    #             x = x + math.ceil(x)
    #             if currentMaxLength > finalMaxLength:
    #                 finalMaxLength = currentMaxLength
