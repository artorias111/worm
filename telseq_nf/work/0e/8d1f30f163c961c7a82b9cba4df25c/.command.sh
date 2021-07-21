#!/bin/bash -ue
telseq -h > telseq.tsv
cat ind_telseq*.txt >> telseq.tsv
