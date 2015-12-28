from Bio.Blast import NCBIWWW, NCBIXML

name = "dna.example.fasta"
f = open(name)


# Count records
text = f.read()
records = text.count(">")
print("There are %d records" % records)


# Find sequences
seqs = []
current_seq = ""
for line in text:
    if not line.startswith(">"):
        current_seq += line.strip()
    else:
        seqs.append(current_seq)
        current_seq = ""
seqs.append(current_seq)
seqs = seqs[1:]

# Find lengths
seq_lengths = [len(seq) for seq in seqs]

# Find longest sequence
print("Longest sequence is %d" % max(seq_lengths))

# Find shortest sequence
print("Shortest sequence is %d" % min(seq_lengths))

# Find longest ORF 2
