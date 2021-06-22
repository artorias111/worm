#!/usr/bin/env nextflow


date = new Date().format( 'yyyyMMdd' )
params.out = "Telseq_${date}"


process call_telseq {
    script:
    """
    telseq -z TTAGGC -H $params.file > telseq_out.txt
    """
}

process combine_telseq {
    //hmm
}

