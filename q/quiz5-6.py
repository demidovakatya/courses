def valid_dna1(dna):
    for c in dna:
        if c in 'acgtACGT':
            return True
        else:
            return False
def valid_dna2(dna):
    for c in dna:
        if 'c' in 'acgtACGT':
                return 'True'
        else:
            return 'False'
def valid_dna3(dna):
    for c in dna:
        flag = c in 'acgtACGT'
    return flag
def valid_dna4(dna):
    for c in dna:
        if not c in 'acgtACGT':
            return False
    return True
