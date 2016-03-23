import math

def stdDevOfLengths(L):
    """
    L: a list of strings

    returns: float, the standard deviation of the lengths of the strings,
      or NaN if L is empty.
    """
    if len(L) == 0:
        return float('NaN')
    else:
        lengths = list(map(len, L))
        N = len(lengths) * 1.0
        mu = sum(lengths) / N
        s = 0
        for t in lengths:
            s += (t - mu) ** 2
        s = math.sqrt(s / N)
        return s

# test
print("This should be 0:")
L = ['a', 'z', 'p']
print(stdDevOfLengths(L))
print("This should be 1.8708:")
L = ['apples', 'oranges', 'kiwis', 'pineapples']
print(stdDevOfLengths(L))
