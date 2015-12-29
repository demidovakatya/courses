from Bio.Blast import NCBIWWW, NCBIXML
import re
import sys


if len(sys.argv) < 1:
    name = "dna.example.fasta"
else:
    name = sys.argv[1]

handle = open(name)


records = {}
seqs = []
current_seq = ""

for line in handle:
    # print(line)
    if not line.startswith(">"):
        current_seq += line.strip()
    else:
        # print("Line doesn't startswith >")
        seqs.append(current_seq)
        records[line.split(" ")[0]] = current_seq
        current_seq = ""
seqs.append(current_seq)
seqs = seqs[1:]

print("There are %d records" % (len(records)))


# Find lengths
seq_lengths = [len(seq) for seq in seqs]
print("Length of the longest sequence: %d" % max(seq_lengths))
print("Length of the shortest sequence: %d" % min(seq_lengths))


def find_orf(sequence, number):

    a_string = sequence[number-1:]

    starts = [a.start() for a in list(re.finditer('ATG', a_string))]

    stops = [a.end() for a in list(re.finditer('TAA', a_string))] 
    stops += [a.end() for a in list(re.finditer('TGA', a_string))] 
    stops += [a.end() for a in list(re.finditer('TAG', a_string))]

    orfs = []

    for i in starts:
        for j in stops:
            if i > j:
                continue
            # print("String from %d to %d" % (i, j))
            orfs.append(sequence[i:j])

    return orfs


orfs1 = []
for seq in seqs:
    orfs1 += find_orf(seq, 1)
print("Length of the longest ORF: %d" % max([len(orf) for orf in orfs1]))
orfs2 = []
for seq in seqs:
    orfs2 += find_orf(seq, 2)
print("Length of the longest ORF: %d" % max([len(orf) for orf in orfs2]))
orfs3 = []
for seq in seqs:
    orfs3 += find_orf(seq, 3)
print("Length of the longest ORF: %d" % max([len(orf) for orf in orfs3]))

orfs = orfs1 + orfs2 + orfs3

orf_lengths = [len(orf) for orf in orfs]
print("Length of the longest ORF: %d" % max(orf_lengths))
