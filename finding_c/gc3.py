from Bio import SeqIO
from Bio.SeqUtils import GC

import re

ref = SeqIO.index('/projects/b1059/data/c_tropicalis/genomes/PRJNA53597/WS276/c_tropicalis.PRJNA53597.WS276.genome.fa.gz','fasta')

gc=0

for i in ref:
    seq = str(ref[i].seq).upper()
    start,end=0,l00
    while(True):
        gc_fraction=GC(seq[start:end])
        if(gc_fraction<=0.52 and gc_fraction>=0.48):
            gc+=100
        start+=100
        end+=100
    
    print(gc)
