def isPal(x):
    assert type(x) == list
    # temp = x # wrong
    # print(temp, x) # added for debugging
    temp = x[:] # correct
    temp.reverse()
    # print(temp, x) # added for debugging
    if temp == x:
        return True
    else:
        return False

def silly(n):
    result = [] # it should be here
    for i in range(n):
        # result = [] # it shouldn't be here
        elem = input('Enter element: ')
        result.append(elem)
    # print(result) # added for debugging
    if isPal(result):
        print('Yes')
    else:
        print('No')