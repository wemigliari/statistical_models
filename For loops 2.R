library(dplyr)

for (i in 1:20) {
  print(paste("This is the number", i))
  
}


for (i in 20:40){
  if (!i %% 23) {
    next
  }
  print(i)
}

####
library(readxl)

test <- read_excel("Documents/R/tabelas/commodities_price_wb3.xlsx", 
                   col_types = c("numeric", "numeric", "numeric", "text"))
test<- test[, -c(1,4)]

test_mean <- data.frame(test)

for (i in test_mean$iron_price_nom){
  if(!i > 60) 
  {
    next
  }
  print(i)
}

####

summarise_if(test_mean, is.numeric, mean)

summarise_if(test_mean, is.numeric, sd)

###


test <- read_excel("Documents/R/tabelas/commodities_price_wb3.xlsx", 
                   col_types = c("numeric", "numeric", "numeric", "text"))
test<- test[, -c(4)]

test <- data.frame(test)

library(ggplot2)

ggplot(data=test, aes(x=year, y=iron_price_nom)) +
  geom_bar(stat="identity", fill="gold")+
  geom_text(aes(label=iron_price_nom), position=position_dodge(width=0.9),
            vjust="center", hjust=1.4, color="black", size=2, angle=90)+
  theme_minimal()


require(reshape2)

test<- melt(test, "year")

cols <- c("gold","orange") 

ggplot(test, aes(x=year, y=value, fill=variable)) + 
  geom_bar(stat="identity", colour="white") +
  scale_fill_manual( values = cols) +
  labs(x = "", y="Preço (US$/ton. métrica)", fill="Tipos") +
  theme_bw()+
  

  
####

  theme_classic()
  scale_fill_brewer() ### set colors automatically

####
  

  
  
  
  
  
  
  
  


