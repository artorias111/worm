from Bio import SeqIO
import re

ref = SeqIO.index("WBcel235.fa.gz", 'fasta')

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
        gcFraction = float(gcCount) / totalBaseCount
        if 0.52 >= gcFraction >= 0.48:
            gc_counter += 100
            print k, gc_counter
        start += 100
        end += 100