def FancyDivide(list_of_numbers, index):
    try:
        try:
            denom = list_of_numbers[index]
            for i in range(len(list_of_numbers)):
                list_of_numbers[i] /= denom
        finally:
            raise Exception("0")
    except Exception, e:
        print e

# print "1--"
# FancyDivide([0, 2, 4], 1)
# print "2--"
# FancyDivide([0, 2, 4], 4)
# print "3--"
FancyDivide([0, 2, 4], 0)