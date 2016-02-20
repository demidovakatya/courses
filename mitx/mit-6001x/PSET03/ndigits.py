def ndigits(x):
    '''
    x: an integer, positive or negative
    returns: a number of digits in n
    '''
    x = abs(x) # for negative cases

    if (x - x % 10) == 0:
        return 1
    else:
        return ndigits(int(x/10)) + 1

# ndigits(0)
# ndigits(1)
# ndigits(2)