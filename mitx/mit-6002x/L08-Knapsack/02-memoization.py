def fastFib(x, memo):
    assert type(x) == int and x >= 0 and type(memo) == dict
    if x == 0 or x == 1:
        return 1
    if x in memo:
        return memo[x]
    result = fastFib(x-1, memo) + fastFib(x-2, memo)
    memo[x] = result
    return result

def testFastFib(n):
    assert type(n) == int and n >=  0
    for i in range(n):
        print ('fib of', i, '=', fastFib(i, {}))

def fib(x):
    assert type(x) == int and x >= 0
    if x == 0 or x == 1:
        return 1
    else:
        return fib(x-1) + fib(x-2)


def testFib(n):
    assert type(n) == int and n >=  0
    for i in range(n):
        print ('fib of', i, '=', fib(i)) 
