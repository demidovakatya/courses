import time

def count1(dna, base):
    i = 0
    for c in dna:
        if c == base:
            i += 1 
    return i

def count2(dna, base):
    i = 0 
    for j in range(len(dna)):
        if dna[j] == base:
            i += 1 
    return i 

def count3(dna, base):
    match = [c == base for c in dna]
    return sum(match)

# fastest
def count4(dna, base):
    return dna.count(base)

def count5(dna, base):
    return len([i for i in range(len(dna)) if dna[i] == base])

def count6(dna,base):
    return sum(c == base for c in dna)

dna = 'acgtacgactagcacgtacgactagcactagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgatcgactacgagcatcagcatcacacgtacgactagcactagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgtacgactagcactagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgatcgactacgagcatcagcatcacgatcgactacgagcatcaacgtacgactagcactagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgatcgactacgagcatcagcatcgcatctagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgatcgactacgagcatcagcatcacgtacgactagcacgtacgactagcactagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgatcgactacgagcatcagcatcacacgtacgactagcactagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgtacgactagcactagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgatcgactacgagcatcagcatcacgatcgactacgagcatcaacgtacgactagcactagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgatcgactacgagcatcagcatcgcatctagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgatcgactacgagcatcagcatcacgtacgactagcacgtacgactagcactagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgatcgactacgagcatcagcatcacacgtacgactagcactagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgtacgactagcactagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgatcgactacgagcatcagcatcacgatcgactacgagcatcaacgtacgactagcactagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgatcgactacgagcatcagcatcgcatctagcatcgactacgactacgatcgactacgactagactacgactagcatcgactatcagcgcatcagcacggcgcgcgcgactacgatcgactacgagcatcagcatc'
base = 'c'

start1 = time.clock()
print(count1(dna, base))
elapsed1 = (time.clock() - start1)
print(elapsed1)

start2 = time.clock()
print(count2(dna, base))
elapsed2 = (time.clock() - start2)
print(elapsed2)

start3 = time.clock()
print(count3(dna, base))
elapsed3 = (time.clock() - start3)
print(elapsed3)

start4 = time.clock()
print(count4(dna, base))
elapsed4 = (time.clock() - start4)
print(elapsed4)

start5 = time.clock()
print(count5(dna, base))
elapsed5 = (time.clock() - start5)
print(elapsed5)

start6 = time.clock()
print(count6(dna, base))
elapsed6 = (time.clock() - start6)
print(elapsed6)
