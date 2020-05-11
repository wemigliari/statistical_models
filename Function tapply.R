#Working with lists and crossing factors.
#tapply structure tapply(x, index, function, ...)


library(dplyr)

polesp
apply(polesp[,2], 2, mean)
apply(polesp[,2], 2, min)
apply(polesp[,2], 2, max)

listpolesp1 <- c(polesp$Salary) #Creating a vector for salary.
listpolesp2 <- c(polesp$Age) #Creating a vector for age.
listpolesp3 <- c(polesp$Party) #Creating a vector for party.
listpolesp4 <- c(polesp$Housing) #Creating a vector for housing.

listpolesp1
listpolesp2
listpolesp3
listpolesp4



#Observing the average of age for those people voting for each party

tapply(listpolesp2, listpolesp3, mean)

tapply(listpolesp2, listpolesp4, mean)

#or using a call to refer to specific columns

tapply(polesp$Age, polesp$Housing, mean)






