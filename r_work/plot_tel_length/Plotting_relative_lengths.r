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