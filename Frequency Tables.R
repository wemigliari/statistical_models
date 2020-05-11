### Calculating frequencies with tables

library(plyr)
library(gplots)

### Loading the data

barcelona1000_2017 <- read_excel("/Users/wemigliari/Documents/R/tabelas/nets_1.xlsx",
                                 sheet = "Level 10")
barcelona800_2017 <- read_excel("/Users/wemigliari/Documents/R/tabelas/nets_1.xlsx",
                                sheet = "Level 9")
barcelona600_2017 <- read_excel("/Users/wemigliari/Documents/R/tabelas/nets_1.xlsx",
                                sheet = "Level 8")
barcelona400_2017 <- read_excel("/Users/wemigliari/Documents/R/tabelas/nets_1.xlsx",
                                sheet = "Level 7")
barcelona200_2017 <- read_excel("/Users/wemigliari/Documents/R/tabelas/nets_1.xlsx",
                                sheet = "Level 6")


### Subsetting the data as data.frame

public_demand_1000 <- as.data.frame(table(barcelona1000_2017$public_demand))
public_demand_800 <- as.data.frame(table(barcelona800_2017$public_demand))
public_demand_600 <- as.data.frame(table(barcelona600_2017$public_demand))
public_demand_400 <- as.data.frame(table(barcelona400_2017$public_demand))
public_demand_200 <- as.data.frame(table(barcelona200_2017$public_demand))

freq_contract_1000 <- sort(public_demand_1000$Freq) # Selecting the frequency in the subset data
freq_contract_800 <- sort(public_demand_800$Freq)
freq_contract_600 <- sort(public_demand_600$Freq)
freq_contract_400 <- sort(public_demand_400$Freq)
freq_contract_200 <- sort(public_demand_200$Freq)


### Plotting the data subset

plot(freq_contract_1000, type = "b", bty = "l", pch=15, col = "darkgreen", xlab = "Number of Contracts", ylab = "Frequency")
lines(freq_contract_800, type = "b", bty = "l", pch=16, col = "gray")
lines(freq_contract_600, type = "b", bty = "l", pch=17, col = "orange")
lines(freq_contract_400, type = "b", bty = "l", pch=18, col = "black")
lines(freq_contract_200, type = "b", bty = "l", pch=19, col = "red")
legend("topleft", legend = c("1000", "800", "600", "400", "200"),
       col = c("darkgreen", "gray", "orange", "black", "red"), 
       pch = c(15, 16, 16, 17, 18, 19),
       bty = "n", cex = 0.7)







