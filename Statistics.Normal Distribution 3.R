library(ggplot2)


### Selecting one cell from my table
sdus <- US[1, 2]

### Selecting one column
US %>% select(1:2)


### Mean and Standard Deviation Poverty Threshold for the model

mean(US15$`PersonsPoverty%`)
sd(US15$`PersonsPoverty%`)

## Mean and Standard Deviation Poverty Threshold for the U.S. Averagea

meanus <- c(11.8)
sdus <- c(8.47673)

# Plot 1

par(mfrow=c(1,3), mar=c(3,4,4,2))

plot.function(x = function(t) dnorm(x = t, mean = 20.07333, sd = 8.47673),
              family = "Times",
              from = -10,
              to = 100,
              col = "black",
              lwd=2, 
              cex=2,
              cex.axis=.8,
              xlab = "",
              ylab = "Densities")
plot.function(x = function(t) dnorm(x = t, mean = (2 * meanus), sd = (2 * sdus)),
              from = -10,
              to = 100,
              col = "gray",
              add = TRUE)

legend(35, 0.045, legend=c("Model", "US"),
       col=c("black", "gray"), lty=1:2, cex=0.8, bty = "n")

# Plot 2

plot.function(x = function(t) dnorm(x = t, mean = 2.6, sd = 8.47673),
              family = "Times",
              from = -10,
              to = 100,
              lwd=2, 
              cex=2,
              cex.axis=.8,
              col = "black",
              xlab = "",
              ylab = "Densities")
plot.function(x = function(t) dnorm(x = t, mean = (2 * meanus), sd = (2 * sdus)),
              from = -10,
              to = 100,
              col = "gray",
              add = TRUE)

legend(30, 0.045, legend=c("Farmington, MN", "US"),
       col=c("black", "gray"), lty=1:2, cex=0.8, bty = "n")

# Plot 3

plot.function(x = function(t) dnorm(x = t, mean = 41.2, sd = 8.47673),
              family = "Times",
              from = -10,
              to = 100,
              lwd=2, 
              cex=2,
              cex.axis=.8,
              col = "black",
              xlab = "",
              ylab = "Densities")
plot.function(x = function(t) dnorm(x = t, mean = (2 * meanus), sd = (2 * sdus)),
              from = -10,
              to = 100,
              col = "gray",
              add = TRUE)

legend(42, 0.045, legend=c("Flint", "MI", "US"),
       col=c("black", "gray"), lty=1:2, cex=0.8, bty = "n")

#######

#"p" - points
#"l" - lines
#"b" - both points and lines
#"c" - empty points joined by lines
#"o" - overplotted points and lines
#"s" and "S" - stair steps
#"h" - histogram-like vertical lines
#"n" - does not produce any points or lines
