import re

# name = "dna.example.fasta"
name = "dna.fasta"
handle = open(name)


records = {} # {header: sequence}
current_req = ""
for line in handle:
    # print(line)
    if line.startswith(">"):
        current_req = line.split(" ")[0]
        records[current_req] = ""
    else:
        records[current_req] = records[current_req] + line.strip()


seqs = [] # [sequence]
for val in records.values():
    seqs.append(val)


def max_len(stuff):
    """Computes maximum length for a list of strings.
    """
    return max([len(s) for s in stuff])


print("There are %d records" % (len(records)))
print("Longest sequence: %d" % max_len(seqs))
print("Shortest sequence: %d" % min([len(seq) for seq in seqs]))


def find_orf(sequence, frame):
    """Looks for ORFs – open reading frames in a SINGLE sequence.

    An open reading frame starts with a start codon, and ends with the next stop codon.
    """
    start_codons = ["ATG"]
    stop_codons = ["TAA", "TGA", "TAG"]

    starts = []
    ends = []
    for i in range(frame-1, len(sequence), 3):
        if sequence[i:i+3] in start_codons:
            starts.append(i)
        if sequence[i:i+3] in stop_codons:
            ends.append(i+2)

    orfs = []

    for i in starts:
        for j in ends:
            if (i > j) or (j - i < 6):
                continue
            # print("String from %d to %d. Length: %d" % (i, j+1, j+1-i))
            orfs.append(sequence[i:j+1])
            break
    
    # print("TEST Length of the longest ORF %d: %d" % (frame, max_len(orfs)))
    return orfs


def find_orf_seqs(sequences, frame):
    """Looks for ORFs – open reading frames in a SINGLE sequence.
    """
    orfs = []
    for sequence in sequences:
        orfs +=find_orf(sequence, frame)
    print("Longest ORF %d: %d" % (frame, max_len(orfs)))
    return orfs


orfs1 = find_orf_seqs(seqs, 1)
orfs2 = find_orf_seqs(seqs, 2)
orfs3 = find_orf_seqs(seqs, 3)

orfs = orfs1 + orfs2 + orfs3
print("Longest ORF: %d" % max_len(orfs))


# What is the length of the longest forward ORF that appears in the sequence with the identifier gi|142022655|gb|EQ086233.1|16?
identifier = 'gi|142022655|gb|EQ086233.1|454'
seq_with_id = records['>' + identifier]
orfs = find_orf(seq_with_id, 1) + find_orf(seq_with_id, 2) + find_orf(seq_with_id, 3)
print("Longest ORF with identifier %s:\n %d" % (identifier, max_len(orfs)))

def find_repeats(sequences, length):
    repeats_freq = {}
    for sequence in sequences:
        for i in range(0, len(sequence)-length+1): 
            rep = sequence[i:i+length]
            if rep in repeats_freq:
                repeats_freq[rep] += 1
                # print("Updated: %s" % rep)  
            else:
                repeats_freq[rep] = 1
                # print("Added: %s" % rep)
    # return repeats_freq
    top_freq = sorted(repeats_freq.values())[-1]
    print("Most frequently occurring repeats")
    print("(length: %d; frequency: %d)" % (length, top_freq))
    for rep in repeats_freq:
        if repeats_freq[rep] == top_freq:
            print("....%r: %d times" % (rep, repeats_freq[rep])) 

# Find the most frequently occurring repeat of length 6 in all sequences. 
# How many times does it occur in all?
find_repeats(seqs, 6)
# Find all repeats of length 12 in the input file. 
# Let's use Max to specify the number of copies of the most frequent repeat of length 12. 
# How many different 12-base sequences occur Max times?
find_repeats(seqs, 12)



# Which one of the following repeats of length 7 has a maximum number of occurrences?
# TGCGCGC
# GCGCGCA
# CGCGCCG
# AATGGCA

reps = ["TGCGCGC", "GCGCGCA", "CGCGCCG", "AATGGCA"]
occurrences = []
for rep in reps:
    num = 0
    for seq in seqs:
        num += len([a.start() for a in list(re.finditer(rep, seq))])
    print("%s occurs: %d times" % (rep, num))
    occurrences.append((rep, num))

