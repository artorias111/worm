# activate blast environment
source activate /projects/b1059/software/conda_envs/blast

# make blast database for strain pacbio genome
makeblastdb -in <name_of_genome_file> -dbtype nucl

# blast query to genome
blastn -query <name_of_query_file> -db <name_of_genome_file> -outfmt '6 qseqid sseqid pident mismatch gapopen qstart qend sstart send evalue bitscore qcovs qcovhsp qlen slen length' > output.blast

