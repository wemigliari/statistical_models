library(dplyr)
library(ggplot2)

# Binomial Distribution. Similar to a normal distribution. 

dbin <- seq(1, 513, by = 1)
mean(dbin)
y <- dbinom(dbin, 513, 0.5) #Binomial distribution beeing dbin = sequence 1 to 513; n and probability of success for each trial.

## Cumulative Probability Function

dbin <- seq(1, 513, by = 1)
mean(dbin)
sd(dbin)
p <- pnorm(dbin, 257, 148.2346) #Cumulative Probability Function - probability in y axis and values in x axis.
plot(dbin, y, typ = 'l')

# Quantile-quantile plot - 

qqnorm(dbin, typ = 'l', lty = 1, lwd = 1, col = 'purple')
qqline(dbin, lwd = 0.5, col = 'gray')



##

dbin1 <- seq(1,81, by = 1)
mean(dbin1)
sd(dbin1)

q <- pnorm(dbin1, 41, 23.52658) #Cumulative Probability Function - probability in y axis and values in x axis.

plot(p, col = 'red', lwd = 1, typ = 'l', main = "Cumulative Probability Function for p and q")
lines(q, col = 'darkgreen', lwd = 1, typ = 'l')

##

z <- dnorm(dbin, 257, 148.2346)
plot(dbin, z, type = 'l')

pt(0.99, 512)

qt(0.25, 512)
qt(0.50, 512)
qt(0.75, 512)
qt(0.005, 512)
