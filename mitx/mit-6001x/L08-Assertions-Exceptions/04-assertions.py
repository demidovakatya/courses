# helper functions
def getSubjectStats(subject, weights):
    return [[elt[0], elt[1], avg(elt[1], weights)]
            for elt in subject]

def dotProduct(a,b):
    result = 0.0
    for i in range(len(a)):
        result += a[i]*b[i]
    return result
# end of helper funcitons

def avg(grades, weights):
    # pre-conditions:
    assert not len(grades) == 0, 'no grades data'
    # error will print out 'no grades data' as part of the process
    assert len(grades) == len(weights), 'wrong number of grades'

    newgr = [convertLetterGrade(elt) for elt in grades]
    result = dotProduct(newgr, weights) / len(newgr)
    # post-condition:
    assert 0.0 <= result <= 100.0
    
    return result
