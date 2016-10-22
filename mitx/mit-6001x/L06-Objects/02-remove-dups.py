def removeDups(L1, L2):
    # clone L1
    L1Start = L1[:]

    for item in L1Start:
        if item in L2:
            L1.remove(item)
