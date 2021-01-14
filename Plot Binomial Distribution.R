### Binomial Distribution

summary(IndexTiempo)
x <- seq(1,45, by = 1)
y <- dbinom(x, IndexTiempo$MinutosCTrab, 0.5)
z <- dbinom(x, IndexTiempo$`MinutosCE&B`, 0.5)

### Drawing the bars

plot(x, y, col = "darkgreen", type = "h", main = "Different Values of p", 
     xlab = "Minutes", ylab = "Probability", xlim = c(0, 50), ylim = c(0.00, 0.20))
lines(x,z, col = "blue", type = "h")
legend(25, 0.1, c("p=0.5", "p=0.5"), c(col = "blue", col = "darkgreen"), text.width = 10)


### Drawing the lines

library(dplyr)
library(ggplot2)
plot.new()

xx <- seq((27*0.5) - 5*(sqrt(27*0.5*0.5)), (27*0.5) + 5*(sqrt(27*0.5*0.5)), length.out = 100)

xxx <- seq((45*0.5) - 5*(sqrt(45*0.5*0.5)), (45*0.5) + 5*(sqrt(45*0.5*0.5)), length.out = 100)
lines(xx, dnorm(xx, 27*0.5, sqrt(27*0.5*0.5)))
lines(xxx, dnorm(xxx, 45*0.5, sqrt(45*0.5*0.5)))  
