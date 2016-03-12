def getSublists(L, n):
    return [L[i:i + n] for i in range(len(L) - n + 1)]
