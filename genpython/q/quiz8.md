# Lecture 8 Quiz

## Question 1

What module can we use to run BLAST over the internet in Biopython:

- Bio.Blast.NCBIXML
- NCBIWWW.qblast()
- WWW
- **Bio.Blast.NCBIWWW**

## Question 2

Which one of the following modules is not part of the Bio.Blast package in Biopython:

- **FastaIO**
- NCBIStandalone
- Applications
- ParseBlastTable

## Question 3

Using Biopython find out what species the following unknown DNA sequence comes from: 

```
TGGGCCTCATATTTATCCTATATACCATGTTCGTATGGTGGCGCGATGTTCTACGTGAATCCACGTTCGAAGGACATCATACCAAAGTCGTAC
AATTAGGACCTCGATATGGTTTTATTCTGTTTATCGTATCGGAGGTTATGTTCTTTTTTGCTCTTTTTCGGGCTTCTTCTCATTCTTCTTTGGCAC
CTACGGTAGAG
```

- Hint. Identify the alignment with the lowest E value.
- Cucumis sativus
- **Nicotiana tabacum**
- Rhazya stricta
- Sambucus canadensis

## Question 4

Seq is a sequence object that can be imported from Biopython using the following statement: 
```
from Bio.Seq import Seq 
```

If `my_seq` is a Seq object, what is the correct Biopython code to print the reverse complement of `my_seq`? 
Hint. Use the built-in function help you find out the methods of the Seq object.

- `print('reverse complement is %s' % my_seq.complement())` - Returns the complement sequence. New Seq object.
- `print('reverse complement is %s' % complement(my_seq.reverse()))`
- `print('reverse complement is %s' % my_seq.reverse())`
- **`print('reverse complement is %s' % my_seq.reverse_complement())`** - Returns the reverse complement sequence. New Seq object.

## Question 5

Create a Biopython Seq object that represents the following sequence: 

```
TGGGCCTCATATTTATCCTATATACCATGTTCGTATGGTGGCGCGATGTTCTACGTGAATCCACGTTCGAAGGACATCATACCAAAGTCGTAC
AATTAGGACCTCGATATGGTTTTATTCTGTTTATCGTATCGGAGGTTATGTTCTTTTTTGCTCTTTTTCGGGCTTCTTCTCATTCTTCTTTGGCAC
CTACGGTAGAG
```

Its protein translation is:

- TQCRYPLLLRLSLIGARDLEATTRMKYYLIVEMPCQAHLSESEQTNYQIHLSSPA*P*KRSLKKRE
- **WASYLSYIPCSYGGAMFYVNPRSKDIIPKSYN*DLDMVLFCLSYRRLCSFLLFFGLLLILLWHLR**
- *FWPHIYPIYHVRMVARCSTSIHVRRTSYQSRTIRTSIWFYCLSYRRLCSFLLFFGLLLILLWHLR
- ILASYLSYIPCSYGGAMFYVNPRSKDIIPKSYN*DLDMVLLFIVSEVMFFFALFRASSHSSLAPTV
