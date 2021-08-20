> brig <- as_tibble(briggsae_length)
> trop <- as_tibble(tropicalis_length)
> eleg <- as_tibble(elegans_length)
> brign <- brig
> elegn <- eleg
> tropn <- trop
> brign <- data.frame(length=rnorm(1604))
> elegn <- data.frame(length=rnorm(540))
> tropn <- data.frame(length=rnorm(670))
> tropn$worm='tropicalis'
> elegn$worm='elegans'
> brign$worm='briggsae'
> Lengths <- rbind(brign,elegn,tropn)
> view(Lengths)
> ggplot(Lengths,aes(length,fill=worm))+
+     geom_histogram(alpha=0.5,position='identity')

########
#Individual lengths
########

#brig
brig_graph <- ggplot(briggsae_length,aes(brigg_length_estimate))+geom_histogram(bins=20)
> ggplot(briggsae_length,aes(brigg_length_estimate))+geom_histogram(bins=20)
> ggplot(briggsae_length,aes(brigg_length_estimate))+geom_histogram(bins=25)
> ggplot(briggsae_length,aes(brigg_length_estimate))+geom_histogram(bins=20)
> brig_graph <- brig_graph+ggtitle("briggsae")+xlab("length")
> brig_graph

#eleg
> eleg_graph <- ggplot(elegans_length,aes(avg_telomere_length))+geom_histogram(bins=40) + ggtitle("elegans")+xlab("length")

#trop
> trop_graph <- ggplot(tropicalis_length,aes(length_estimate))+geom_histogram(bins=24) + ggtitle("tropicalis")+xlab("length")
