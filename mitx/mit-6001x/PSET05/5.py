def search(L, e):
    for i in range(len(L)):
        if L[i] == e:
            return True
        if L[i] > e:
            return False
    return False

def newsearch(L, e):
    size = len(L)
    for i in range(size):
        if L[size-i-1] == e:
            return True
        if L[i] < e:
            return False
    return False
      
L = [0, 1, 2, 3, 4, 5, 6]
print(search(L, 4))
print(newsearch(L, 4))
print(search(L, 7))
print(newsearch(L, 7))

print("List of length 0")
L = []
print(search(L, 4))
print(newsearch(L, 4))
print(search(L, 7))
print(newsearch(L, 7))

print("List of length 1")
L = [4]
print(search(L, 4))
print(newsearch(L, 4))
print(search(L, 7))
print(newsearch(L, 7))

print("List of length 2")
L = [4, 5]
print(search(L, 4))
print(newsearch(L, 4))
print(search(L, 7))
print(newsearch(L, 7))

