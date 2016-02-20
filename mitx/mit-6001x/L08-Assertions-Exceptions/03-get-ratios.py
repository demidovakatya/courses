def getRatios(v1, v2):
    '''
    assumes: v1 and v2 are lists of equal length of numbers 
    returns: a list containing the meaningful values of v1[i]/v2[i]
    '''
    ratios = []

    for index in range(len(v1)):
        try:
            ratios.append(v1[index] / float(v2[index]))
        except ZeroDivisionError:
            ratios.append(float('NaN'))
        except:
            raise ValueError("getRatios called with a bad arg")
            
    return ratios