def fib(x):
    '''
    assumes x is an int and x >= 0
    returns fibonacci of x
    '''

    assert type(x) == int and x >=0

    if x == 1 or x == 0:
        return 1
    else:
        return fib(x - 1) + fib(x - 2)
