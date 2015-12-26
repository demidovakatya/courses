from Bio.Blast import NCBIWWW, NCBIXML

sequence = "TGGGCCTCATATTTATCCTATATACCATGTTCGTATGGTGGCGCGATGTTCTACGTGAATCCACGTTCGAAGGACATCATACCAAAGTCGTACAATTAGGACCTCGATATGGTTTTATTCTGTTTATCGTATCGGAGGTTATGTTCTTTTTTGCTCTTTTTCGGGCTTCTTCTCATTCTTCTTTGGCACCTACGGTAGAG"

result_h = NCBIWWW.qblast("blastn", "nt", sequence)
blast_rec = NCBIXML.read(result_h)

E_VALUE_THRESH = 0.01

for alignment in blast_rec.alignments:
    for hsp in alignment.hsps:
        if hsp.expect < E_VALUE_THRESH:
            print('****Alignment****')
            print('sequence:', alignment.title)
            print('length:', alignment.length)
            print('e value:', hsp.expect)
            print(hsp.query)
            print(hsp.match)
            print(hsp.sbjct)

# ****Alignment****
# sequence: gi|927029471|gb|KR780036.1| Nicotiana tabacum cultivar zhongyan 100
# mitochondrion, complete genome
