# For this problem, write a recursive function, lenRecur, which computes 
# the length of an input argument (a string), 
# by counting up the number of characters in the string.

# Hint: String slicing may be useful in this problem...

def lenRecur(aStr):
    '''
    aStr: a string
    
    returns: int, the length of aStr
    '''
    if aStr == "":
        return 0
    else:
        return lenRecur(aStr[1:]) + 1

# Test
print("length of `hi`?")
print(lenRecur("hi"))
print("length of an empty string?")
print(lenRecur(""))
