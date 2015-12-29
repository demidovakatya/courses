from Bio.Blast import NCBIWWW, NCBIXML
import re
import sys


# if len(sys.argv) < 1:
#     name = "dna.example.fasta"
# else:
#     name = sys.argv[1]


name = "dna.fasta"
handle = open(name)


records = {} # {header: sequence}
seqs = [] # [sequence]
current_seq = ""
current_req = ""

for line in handle:
    # print(line)
    if line.startswith(">"):
        current_req = line.split(" ")[0]
        records[current_req] = ""
        # current_seq += line.strip()
    else:
        records[current_req] = records[current_req] + line.strip()
        # print("Line doesn't startswith >")
        # seqs.append(current_seq)
        # records[line.split(" ")[0]] = current_seq
        # current_seq = ""
# seqs.append(current_seq)
# seqs = seqs[1:]
seqs = records.values()


print("There are %d records" % (len(records)))
print("Length of the longest sequence: %d" % max([len(seq) for seq in seqs]))
print("Length of the shortest sequence: %d" % min([len(seq) for seq in seqs]))


def find_orf(sequence, frame):
    """Looks for ORFs – open reading frames

    An open reading frame starts with a start codon, and ends with the next stop codon.
    """
    start_codons = ["ATG"]
    stop_codons = ["TAA", "TGA", "TAG"]
    # a_string = sequence[frame-1:]

    # starts = [a.start() for a in list(re.finditer('ATG', a_string))]

    # stops = [a.end() for a in list(re.finditer('TAA', a_string))] 
    # stops += [a.end() for a in list(re.finditer('TGA', a_string))] 
    # stops += [a.end() for a in list(re.finditer('TAG', a_string))]

    # starts.sort()
    # stops.sort()

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
 
    return orfs


orfs1 = []
for seq in seqs:
    orfs1 += find_orf(seq, 1)
print("Length of the longest ORF 1: %d" % max([len(orf) for orf in orfs1]))
orfs2 = []
for seq in seqs:
    orfs2 += find_orf(seq, 2)
print("Length of the longest ORF 2: %d" % max([len(orf) for orf in orfs2]))
orfs3 = []
for seq in seqs:
    orfs3 += find_orf(seq, 3)
print("Length of the longest ORF 3: %d" % max([len(orf) for orf in orfs3]))

orfs = orfs1 + orfs2 + orfs3

orf_lengths = [len(orf) for orf in orfs]
print("Length of the longest ORF: %d" % max(orf_lengths))


# What is the length of the longest forward ORF that appears in the sequence with the identifier gi|142022655|gb|EQ086233.1|16?
identifier = 'gi|142022655|gb|EQ086233.1|454'
seq_with_id = records['>' + identifier]
orfs = find_orf(seq_with_id, 1) + find_orf(seq_with_id, 2) + find_orf(seq_with_id, 3)
print("Length of the longest ORF: %d" % max([len(orf) for orf in orfs]))

# Find the most frequently occurring repeat of length 6 in all sequences. 
# How many times does it occur in all?


# Find all repeats of length 12 in the input file. 
# Let's use Max to specify the number of copies of the most frequent repeat of length 12. 
# How many different 12-base sequences occur Max times?


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
        num += [a.start() for a in list(re.finditer(rep, seq))]
    print("%s occurs: %d times" % (rep, num))
    occurrences.append((rep, num))
print(occurrences)

