#5808700 - elegans
#53507 - tropicalis

from Bio import SeqIO
import re

ref = SeqIO.index("/projects/b1059/data/c_tropicalis/genomes/PRJNA53597/WS276/c_tropicalis.PRJNA53597.WS276.genome.fa.gz", 'fasta')

gc_counter = 0
for k in ref:
    rl = 100
    seq = str(ref[k].seq).upper()
    start, end = 0, 100
    while rl == 100:
        seq_bin = seq[start:end]
        if len(seq_bin) != 100:
            print seq_bin
        rl = len(seq_bin)
        gcCount = len(re.findall("[GC]", seq_bin))
        totalBaseCount = len(re.findall("[GCTA]", seq_bin))
        if (totalBaseCount==0):
            print('base-count-error')
        gcFraction = float(gcCount) / totalBaseCount #Error : total base count is still 0
        if 0.52 >= gcFraction >= 0.48:
            gc_counter += 100
            print k, gc_counter
        start += 100
        end += 100
 