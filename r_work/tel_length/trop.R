library("tidyverse")

#input: telseq.tsv (Check sample files)

briggsae_telseq <- read.delim("~/thesis/worm/r_work/briggsae_telseq.tsv", header=FALSE)
brig <- as_tibble(briggsae_telseq)

brig <- brig %>% select(V1,V7)

#Filtering data with length estimates
v7 <- brig %>% select(V7)
v7 <- v7 %>% filter(V7!='')

#filtering the row names with [*.bam]
v1 <- brig %>% select(V1)
v1 <- v1 %>% filter(V1!="UNKNOWN")
v1 <- v1 %>% filter(V1!="1 BAMs")

#merging the tibbles v1 and v7 to get the final length estimates

#cleaning up data

tel <- as_tibble(v1_final)

tel <- tel %>% mutate(strain_new = str_replace(strain, ".bam", ""))
tel <- tel %>% mutate(strain_new = str_replace(strain_new, "\\[", ""))

tel <- tel %>% select(strain_new,Length_estimate)

#Find the equivalent lengths for ctropicalis
tel %>% mutate(ctrop_val=(Length_estimate/(332720800/46000)) * (5350700/12000))
final <- tel %>% mutate(ctrop_val_rounded=round(ctrop_val,0))