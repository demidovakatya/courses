# simple linear search
def search(L, e):
    for i in range(len(L)):
        if L[i] == e:
            return True
    return False
