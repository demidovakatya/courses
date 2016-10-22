def dict_invert(d):
    '''
    d: dict
    Returns an inverted dictionary according to the instructions above
    '''

    inv = {}

    for k, v in d.iteritems():
        keys = inv.setdefault(v, [])
        keys.append(k)

    for k, v in inv.iteritems():
        inv[k] = sorted(v)

    return inv


# # Test
# print(dict_invert({1:10, 2:20, 3:30}))
# print(dict_invert({1:10, 2:20, 3:30, 4:30}))
# print(dict_invert({4:True, 2:True, 0:True}))
