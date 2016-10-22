def isPalindrome(aString):
    '''
    aString: a string
    '''
    def toChars(aString):
        # make A b a b -> abab 
        s = aString.lower()
        ans = ''
        for c in s:
            if c in 'abcdefghijklmnopqrstuvwxyz':
                ans = ans + c
        return ans

    def checkPalindrome(s):
        if len(s) <= 1:
            return True
        else:
            return (s[0] == s[-1]) & (checkPalindrome(s[1:-1]))

    return checkPalindrome(toChars(aString))

