library(ggplot2)
library(dplyr)
library(readr)
library(pastecs)

### US15 Population and Poverty Threshold
## https://www.r-bloggers.com/normal-distribution-functions/
## Percentage of Poor People

View(US15$`PersonsPoverty%`)
mean(US15$`PersonsPoverty%`)
sd(US15$`PersonsPoverty%`)

set.seed(19500)
xseq <- seq(8.3, 37.9, .01)
densities<-dnorm(xseq, 20.07333, 16.17)
cumulative<-pnorm(xseq, 20.07333, 16.17)
randomdeviates<-rnorm(19500,20.07333, 16.17)

par(mfrow=c(1,3), mar=c(3,4,4,2))

plot(xseq, densities, col="darkgreen",xlab="", ylab="Density", type="l",lwd=2, cex=2, main="Distribution of Poverty", cex.axis=.8)

plot(xseq, cumulative, col="darkorange", xlab="", ylab="Cumulative Probability",type="l",lwd=2, cex=2, main="Probability of Poverty", cex.axis=.8)

hist(randomdeviates, main="Histogram of Poverty", cex.axis=.8, xlim=c(8,50))



#####################################################################################

par(pty='s')
par(family="serif", font=1)
x = rnorm(US15$Proportion)
p = ecdf(x) #equation of cumulative distribution function
p(0.0)
plot((p), family = "serif", main = "Fig. 1. Persons in Poverty", 
     xlab = "Families and individuals under the poverty threshold of $30,718 per year", ylab = "P(x)",
     col = "lightblue")

legend(-1, 0.1, legend=c("Cumulative Probability Distribution"),
       col=c("black"), lty=1:2, cex=0.5,
       box.lty=0)

####https://www.dummies.com/education/math/statistics/step-step-empirical-cumulative-distribution-function-r/

proportion.q <-quantile(US15$Proportion)

ggplot(NULL, aes(x=US15$Proportion)) +
   geom_step(stat="ecdf") +
   labs(family = "serif", main = "Fig. 1. Persons in Poverty", x= "Families and individuals under the poverty threshold of $30,718 per year",y = "Fn(Poverty)") +
   theme_bw() +
   theme(text=element_text(family="Times New Roman", size=12)) +
   geom_vline(aes(xintercept=proportion.q),linetype = "dashed")







