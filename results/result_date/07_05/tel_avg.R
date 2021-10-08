#Cleaning up
tel <- tel %>% mutate(strain_new = str_replace(strain, ".bam", ""))

#rename a column
tel <- tel %>% rename(length_estimate=LENGTH_ESTIMATE)

#Combine two tibbles with a common column
telfinal %>% inner_join(isotype)


#Find the mean length for each isotype
new_tel<-tel %>% group_by(isotype) %>% summarise(mean_length = mean(length_estimate))