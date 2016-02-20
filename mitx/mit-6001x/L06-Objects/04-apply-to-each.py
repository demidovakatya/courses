def applyToEach(L, f):
    '''
    L - a list
    f - a function
    mutates L, replacing each element e with f(e)
    '''
    for i in range(len(L)):
        L[i] = f(L[i])