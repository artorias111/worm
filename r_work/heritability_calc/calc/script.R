eleg <- eleg %>% add_column(AssayNumber=1:540)
eleg <- eleg %>% add_column(TraitName="TelLength")
eleg <- eleg %>% add_column(Replicate=1)

eleg <- eleg %>% rename(Strain=elegans_isotype)
eleg <- eleg %>% rename(Value=avg_telomere_length)

eleg <- eleg %>% relocate(Value)
eleg <- eleg %>% relocate(Replicate)
eleg <- eleg %>% relocate(TraitName)
eleg <- eleg %>% relocate(Strain)
eleg <- eleg %>% relocate(AssayNumber)