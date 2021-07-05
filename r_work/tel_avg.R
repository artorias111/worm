library(tidyverse)

#load telseq results and isotype list data as tibbles
tel <- read.csv("telseq_results.tsv",sep="\t")
tel <-as_tibble(tel)
isotype <-read.csv("20210115_isotype_assignment.tsv",sep="\t")
isotype <- as_tibble(isotype)

#Cleaning up tel
tel <- tel %>% mutate(strain_new = str_replace(strain, ".bam", ""))
telfinal <- tel %>% rename(length_estimate=LENGTH_ESTIMATE)

#Combine the two tibbles with a common column
telfinal %>% inner_join(isotype)

#Find the mean length for each isotype
new_tel<-telfinal %>% group_by(isotype) %>% summarise(mean_length = mean(length_estimate))


#Rescaling to celegans length from human length
#human c value : (332720800/46000)
#celegans c value : ((5808700/12000))
new_tel %>% mutate(celegans_val=(mean_length/(332720800/46000)) * (5808700/12000))

#round the mean length
final <- new_tel %>% mutate(celegans_val_rounded=round(celegans_val,0))

#Keep only the necessary columns
final_stripped <- final %>% select(isotype, celegans_val_rounded)