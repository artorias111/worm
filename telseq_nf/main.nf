#!/usr/bin/env nextflow

//Calling telseq

process telseq {
    script:
    """
    telseq -z TTAGGC -H $PWD/data/bam/AB1.bam > telseq_out.txt
    """
}

