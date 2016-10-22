def isIn(char, s):
    '''
    char: a single character
    s: an alphabetized string
    
    returns: True if char is in s; False otherwise
    '''
    # Your code here
    if len(s) <= 0:
        return False
    elif s[len(s) / 2] == char:
        return True
    elif char < s[len(s) / 2]:
        return isIn(char, s[0:len(s) / 2])
    else:
        return isIn(char, s[(len(s) / 2) + 1:])
