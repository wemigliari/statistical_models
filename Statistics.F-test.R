### F-Test

library(dplyr)
summary(US15)
sample_n(US15, 5)


first <- c(US15$`2018`)
second <- c(US15$Proportion)

var.test(first, second, alternative = "two.sided")


first2 <- c(US15$`PersonsPoverty%`)
second2 <- c(US15$`2018`)


var.test(first2, second2, alternative = "two.sided")

first3 <- c(US15$Proportion)
second3 <- c(US15$`PersonsPoverty%`)

var.test(first3, second3, alternative = "two.sided")

table(US15$`2018`, US15$Proportion)
