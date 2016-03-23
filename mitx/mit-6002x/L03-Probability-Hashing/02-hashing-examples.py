import random

def strToInt(s):
    number = ''
    for c in s:
        number = number + str(ord(c))
    index = int(number)
    return index

#print 'Index =', strToInt('a')
#print 'Index =', strToInt('John is a cool dude')


def hashStr(s, tableSize = 101):
    number = ''
    for c in s:
        number = number + str(ord(c))
    index = int(number)%tableSize
    return index

##print hashStr('a')
##print hashStr('John is a cool dude')


print hashStr('Eric', 7)
print hashStr('Chris', 7)
print hashStr('Sarina', 7)


print hashStr('Jill', 7)
