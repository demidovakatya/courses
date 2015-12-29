from Bio.Blast import NCBIWWW, NCBIXML
import re
import sys


if len(sys.argv) < 1:
    name = "dna.example.fasta"
else:
    name = sys.argv[1]
handle = open(name)


records = 0
seqs = []
current_seq = ""

for line in handle:
    # print(line)
    if not line.startswith(">"):
        current_seq += line.strip()
    else:
        # print("Line doesn't startswith >")
        seqs.append(current_seq)
        current_seq = ""
        records += 1

seqs.append(seq)
seqs = seqs[1:]

# Count records
found_records = text.count(">")
print("There are %d (or %d) records" % (records, found_records))


# Find lengths
seq_lengths = [len(seq) for seq in seqs]
print("Length of the longest sequence: %d" % max(seq_lengths))
print("Length of the shortest sequence: %d" % min(seq_lengths))

# Find longest ORF
def find_orf(sequence, number):

    number = number - 1

    starts = [a.start() for a in list(re.finditer('ATG', sequence[number:]))]
    stops = [a.end() for a in list(re.finditer('TAA', sequence[number:]))] 
    stops += [a.end() for a in list(re.finditer('TGA', sequence[number:]))] 
    stops += [a.end() for a in list(re.finditer('TAG', sequence[number:]))]

    orfs = []

    for i in starts:
        for j in stops:
            if i > j:
                continue
            # print("String from %d to %d" % (i, j))
            orfs.append(sequence[i:j])

    return orfs
