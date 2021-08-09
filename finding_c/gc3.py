#5808700 - elegans
#5350700 - tropicalis

from Bio import SeqIO
from Bio.SeqUtils import GC

import re

#ref = SeqIO.index('/projects/b1059/data/c_tropicalis/genomes/PRJNA53597/WS276/c_tropicalis.PRJNA53597.WS276.genome.fa.gz','fasta')
ref=SeqIO.index('/home/bhats/thesis/data/genomes/c_tropicalis.PRJNA53597.WS276.genome.fa.gz','fasta')

gc=0

for i in ref:
    seq = str(ref[i].seq).upper()
    start,end=0,100

    while True:
        if(len(seq[start:end])!=100):
            break

        gc_frac=GC(seq[start:end])
        #print(gc_frac)
        if float(gc_frac) <=52 and float(gc_frac) >=48:
            gc+=100

        start=start+100
        end=end+100
    
print(gc)
