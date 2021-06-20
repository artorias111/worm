date = new Date().format( 'yyyyMMdd' )
params.out = "TELOMERE-${date}"
params.bam = "/projects/b1059/data/c_elegans/WI/alignments/*.{bam,bam.bai}"

Channel.fromFilePairs( params.bam )
       .map { it -> [it[0], it[1][0], it[1][1]] }
       .set { bam_snp_individual }


process call_telseq {
    publishDir "${params.out}/individual", mode: 'copy'
    tag { SM }
    input:
        set val(SM), file("${SM}.bam"), file("${SM}.bam.bai") from bam_snp_individual
    output:
        file("telseq_out.txt") into telseq_results

    """
        telseq -z TTAGGC -u -H ${SM}.bam > telseq_out.txt
    """
}

process combine_telseq {
    executor 'local'
    publishDir "${params.out}", mode: 'copy'
    input:
        file("ind_telseq?.txt") from telseq_results.toSortedList()
    output:
        file("telseq.tsv")

    '''
        telseq -h > telseq.tsv
        cat ind_telseq*.txt | egrep -v '\\[|BAMs' >> telseq.tsv
    '''
}