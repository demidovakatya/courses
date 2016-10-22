def modSwapSort(L): 
    """ L is a list on integers """
    print ("Original L: ", L)
    for i in range(len(L)):
        for j in range(len(L)):
            if L[j] < L[i]:
                # the next line is a short 
                # form for swap L[i] and L[j]
                L[j], L[i] = L[i], L[j] 
                print (L)
    print ("Final L: ", L)
      

L = [1, 5, 6, 3, 2, 0, 4, 3]
modSwapSort(L)
L = [6, 5, 4, 3, 3, 2, 1, 0]
modSwapSort(L)
modSwapSort([1, 0])
