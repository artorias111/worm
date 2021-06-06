#!/usr/bin/env nextflow

//Calling telseq

process telseq {
    script:
    """
    telseq -z TTAGGC -H $params.file > telseq_out.txt
    """
}

