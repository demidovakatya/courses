# function f: takes in two integers, performs an unknown operation on them, and returns a value


def dict_interdiff(d1, d2):
    '''
    d1, d2: dicts whose keys and values are integers
    Returns a tuple of dictionaries according to the instructions above
    '''
    # inter: dictionary. keys: keys that are common in both d1 and d2.
    # values: result of applying f to values of inter's keys.
    inter = {}
    # diff: dictionary with only d1 elements and only d2 elements 
    diff = {}

    for key in d1.keys():
        if key in d2:
            inter[key] = f(d1[key], d2[key])
        else:
            diff[key] = d1[key]

    for key in d2:
        if key not in inter:
            diff[key] = d2[key]

    return (inter, diff)
