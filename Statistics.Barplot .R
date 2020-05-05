library(ggplot2)
library(readxl)

head(US15)

### Getting the data from my folder

US15 <- read_excel("/Users/wemigliari/Documents/R/data/RegioesMetropolitanas/US15.xlsx")

### Setting the margins

par(mar=c(3.5,9,5,1.5))

### Horizontal barplot. Averages of poverty in the U.S. cities from my dataset

barplot(US15$`PersonsPoverty%`, names = US15$Cities, 
        density=c(0,100,0,0,0,100,0,0,0,0,0,0,0,0,0), angle=c(8), col = "darkgreen",
        horiz = TRUE,
        ylim = rev(range(US15$`PersonsPoverty%`)),
        cex.names = 0.5, cex.axis = 0.5, space = 1, las = 1, family = "Times")

### Box plots

#number of people living under the poverty threshold and 
boxplot(US15$`2018`, US15$Proportion, col = "orange", log10 = "x", log10 = "y")

#percentage of poverty
boxplot(US15$`PersonsPoverty%`, col = "yellow", main = "Poverty Threshold (%)")
