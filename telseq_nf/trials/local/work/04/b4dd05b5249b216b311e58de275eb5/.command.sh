#!/bin/bash -ue
telseq -h > telseq.tsv
cat ind_telseq*.txt | egrep -v '\[|BAMs' >> telseq.tsv
