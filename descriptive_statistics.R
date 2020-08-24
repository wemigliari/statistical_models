library(dplyr)
library(ggplot2)

sapply(test8, mean, na.rm = TRUE)
plot(sapply(test8, mean, na.rm = TRUE))
plot(sapply(test8, quantile, na.rm = TRUE))

scatter.smooth(test8)
plot(quantile(test8, na.rm = TRUE))

library(pastecs)
res <- stat.desc(test8[,1:15])
round(res, 2)

###

max(test7$Spain)

x <- seq(-0.72, 2.3, by = 0.01)

y <- dnorm(x, mean = 1.16, sd = 0.4) #

plot(x, y, col = "red", type = "p")

z <- pnorm(x, mean = 1.16, sd = 0.4) #

plot(x, z, col = "blue", type = "p")

t <- qnorm(x, mean = 1.16, sd = 0.4) #

plot(x, t, col = "orange", type = "p")

r <- rnorm(48) # Not so good.

my_data <- rnorm(48, mean = 1.16, sd = 0.4)


hist(my_data, main = "Histogram")
hist(test7$Spain/1000000,mean = 1.16, sd = 0.4, col = "orange")



