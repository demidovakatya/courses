def isPalindrome(s):
    '''
    checks if a string `s` is a palindrome
    '''
    def toChars(s):
        # make A b a b -> abab 
        s = s.lower()
        ans = ''
        for c in s:
            if c in 'abcdefghijklmnopqrstuvwxyz':
                ans = ans + c
        return ans

    def checkPalindrome(s):
        if len(s) <= 1:
            return True
        else:
            return s[0] == s[-1] and checkPalindrome(s[1:-1])

    return checkPalindrome(toChars(s))


# Test
print("ababa:")
print(isPalindrome("ababa"))
print("abab:")
print(isPalindrome("abab"))
print("A baba:")
print(isPalindrome("A baba"))
