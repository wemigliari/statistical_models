### Calculating frequencies with tables

library(plyr)

### Loading the data

barcelona1000_2017 <- read_excel("/Users/wemigliari/Documents/R/tabelas/nets_1.xlsx",
                                 sheet = "Level 10")

### Subsetting the data

freq_1000 <- as.data.frame(table(barcelona1000_2017$public_demand)) 

freq_contract_1000 <- sort(freq_1000$Freq) # Selecting the frequency in the subset data


### Plotting the data subset

plot(freq_contract_1000, type = "l", col = "green")