def flatten(aList):
    ''' 
    aList: a list 
    Returns a copy of aList, which is a flattened version of aList 
    '''
    flatList = []
    for elem in aList:
        if type(elem) == list:
            flatList.extend(flatten(elem))
        else:
            flatList.append(elem)
    return flatList
        
