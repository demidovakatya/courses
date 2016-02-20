
def recur_mul(a, b):
    '''
    Recursive version of multiplication.
    '''
    if b == 1:
        return a
    else:
        return a + recur_mul(a, b - 1)
