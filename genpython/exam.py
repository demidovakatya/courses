#! python3
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

# How many records are in the multi-FASTA file?
# What is the length of the longest sequence in the file?
# What is the length of the shortest sequence in the file?
print("There are %d records" % (len(records)))
print("Longest sequence: %d" % max_len(seqs))
print("Shortest sequence: %d\n" % min([len(seq) for seq in seqs]))


def find_orf(seq, frame):
    """Looks for ORFs – open reading frames in a SINGLE sequence.

    An open reading frame starts with a start codon, and ends with the next stop codon.
    """
    start_codons = ["ATG"]
    stop_codons = ["TAA", "TGA", "TAG"]

    starts = []
    ends = []
    for i in range(frame-1, len(seq), 3):
        if seq[i:i+3] in start_codons:
            starts.append(i)
        if seq[i:i+3] in stop_codons:
            ends.append(i+2)

    orfs = []

    for i in starts:
        for j in ends:
            if (i > j) or (j - i < 6):
                continue
            orfs.append(seq[i:j+1])
            break
    
    return orfs


def find_orf_seqs(seqs, frame):
    """Looks for ORFs – open reading frames in a SINGLE sequence.
    """
    orfs = []
    for seq in seqs:
        orfs +=find_orf(seq, frame)
    print("Longest ORF %d: %d" % (frame, max_len(orfs)))
    return orfs


# What is the length of the longest ORF appearing in reading frame 2 of any of the sequences?
# What is the starting position of the longest ORF in reading frame 3 in any of the sequences?
orfs1 = find_orf_seqs(seqs, 1)
orfs2 = find_orf_seqs(seqs, 2)
orfs3 = find_orf_seqs(seqs, 3)


# What is the length of the longest ORF appearing in any sequence and in any forward reading frame?
orfs = orfs1 + orfs2 + orfs3
print("Longest ORF: %d" % max_len(orfs))


# What is the length of the longest forward ORF that appears in the sequence with the identifier gi|142022655|gb|EQ086233.1|16?
identifier = 'gi|142022655|gb|EQ086233.1|454'
seq_with_id = records['>' + identifier]
orfs = find_orf(seq_with_id, 1) + find_orf(seq_with_id, 2) + find_orf(seq_with_id, 3)
# print("\nLongest ORF with identifier %s:\n %d" % (identifier, max_len(orfs)))
# print(max_len(find_orf(seq_with_id, 1)))
# print(max_len(find_orf(seq_with_id, 2)))
# print(max_len(find_orf(seq_with_id, 3)))


def find_repeats(seqs, length):
    repeat_frequencies = {}
    for seq in seqs:
        for i in range(0, len(seq)-length+1): 
            repeat = seq[i:i+length]
            if repeat in repeat_frequencies:
                repeat_frequencies[repeat] += 1
            else:
                repeat_frequencies[repeat] = 1
    # return repeats_freq
    top_frequency = sorted(repeat_frequencies.values())[-1]
    print("\nMost frequently occurring repeats")
    print("(length: %d; frequency: %d)" % (length, top_frequency))
    for repeat in repeat_frequencies:
        if repeat_frequencies[repeat] == top_frequency:
            print("....%r: %d times" % (repeat, repeat_frequencies[repeat])) 


# Find the most frequently occurring repeat of length 6 in all sequences. 
# How many times does it occur in all?
find_repeats(seqs, 6)


# Find all repeats of length 12 in the input file. 
# Let's use Max to specify the number of copies of the most frequent repeat of length 12. 
# How many different 12-base sequences occur Max times?
find_repeats(seqs, 12)


# Which one of the following repeats of length 7 has a maximum number of occurrences?
# TGCGCGC, GCGCGCA, CGCGCCG, AATGGCA
reps = ["TGCGCGC", "GCGCGCA", "CGCGCCG", "AATGGCA"]
repeat_occurrences = []
print(" ")
for repeat in reps:
    occurences = 0
    for seq in seqs:
        occurences += len([a.start() for a in list(re.finditer(repeat, seq))])
    print("%s occurs: %d times" % (repeat, occurences))
    repeat_occurrences.append((repeat, occurences))

