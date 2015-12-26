from Bio.Blast import NCBIWWW, NCBIXML

f = open("dna.example.fasta")
input = f.read()

# how many records
def count_records(input):
    records = 0
    for line in input:
        if line.startswith(">"):
            records += 1
    return records

def len_longest_seq(input):
    pass

def len_shortest_seq(input):
    pass
