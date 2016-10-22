def dotProduct(listA, listB):
    result = 0
    for i in range(len(listA)):
        result += listA[i]*listB[i]
    return result
