# Problem 4-1
# O(1)
def modten(n):
    return n%10

# Problem 4-2
# O(len(n))
def multlist(m, n):
    '''
    m is the multiplication factor
    n is a list.
    '''
    result = []
    for i in range(len(n)):
        result.append(m*n[i])
    return result

# Problem 4-3
# O(log(n))
def foo(n):
    # print("new iteration")
    if n <= 1:
        return 1
    return foo(n/2) + 1

# Problem 4-4
# O(n)
def recur(n):
    if n <= 0:
        return 1
    else:
        return n*recur(n-1)

# Problem 4-5
# O(n^2)
def baz(n):
    for i in range(n):
        for j in range(n):
            print (i,j)
