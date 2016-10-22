
def fact_iter(n):
    '''
    Iterative version of factorial
    '''
    res = 1
    while n > 1:
        res = res * n
        n -= 1
    return res

def fact_rec(n):
    '''
    Recursive version of factorial
    '''
    if n == 1:
        return 1
    else:
        return n * fact_rec(n - 1)

# test
# should be 24
print(fact_iter(4))
print(fact_rec(4))
