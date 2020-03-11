import math
# from decimal import *


# finds the max and min values of the whole value portions of a inputted list of floats by flooring and ceiling
# the values
def findMaxMinWordValue(listOfFloats=[], *args):
    currentMax = 0
    currentMin = 0
    for x in listOfFloats:
        if x > 0:
            outputInteger = math.floor(x)  # convert list value from float to integer
            if outputInteger > currentMax:
                currentMax = outputInteger
        if x < 0:
            outputInteger = math.ceil(x)
            if outputInteger < currentMin:
                currentMin = outputInteger
    print("Lowest value word from list:", currentMin, "\nHighest value word from list:", currentMax)

# https://stackoverflow.com/questions/52013220/how-to-remove-the-floating-number-ending-in-python
# https://stackoverflow.com/questions/152580/whats-the-canonical-way-to-check-for-type-in-python
# https://stackoverflow.com/questions/4541155/check-if-a-number-is-int-or-float
# https://stackoverflow.com/questions/3501382/checking-whether-a-variable-is-an-integer-or-not

# finds the longest length in digits of the fractional portions of the inputted list by multiplying by ten
# subtracting by a floor or ceiling and incrementing a counter
def findMaxLengthOfFractional(listOfFloats=[], *args):
    currentMaxLength = 0
    finalMaxLength = 0
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

    for x in listOfFloats:
        if x > 0:
            while x != 0:
                x *= 10.0
                currentMaxLength += 1
                x = x - math.trunc(x)
                if currentMaxLength > finalMaxLength:
                    finalMaxLength = currentMaxLength
    #     if x < 0:  # this segment does not currently work in general due to infinite loop runtime error
    #         while x != 0:
    #             x *= 10
    #             currentMaxLength += 1
    #             x = x + math.ceil(x)
    #             if currentMaxLength > finalMaxLength:
    #                 finalMaxLength = currentMaxLength
    print("Longest fractional portion of the value of list (in digits):", finalMaxLength)