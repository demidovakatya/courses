
def iter_mul(a, b):
    '''
    Returns a * b
    '''
    result = 0
    while b > 0:
        result += a
        b -= 1
    return result

