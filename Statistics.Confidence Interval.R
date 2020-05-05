library(ggplot2)
library(dplyr)
help("par")


summary(IndexTiempo)
View(IndexTiempo)
a <- mean(IndexTiempo$MinutosCTrab)
sd <- sd(IndexTiempo$MinutosCTrab)
n <- 40

### Z score for 95% of Confidence Interval

qnorm(0.975)

error <- qnorm(0.975)*sd/sqrt(n)


a - error
a + error

boxplot((IndexTiempo$MinutosCTrab), col = "lightyellow", xlab = "Boxplot Tiempo Casa Trabajo", ylab = "Minutos")
legend("bottomright",
       legend = c("Intervalo de Confianza 36.87 < Media < 52.67"),
       col = "black",
       cex = 0.5,
       pch = c(7, 7)
       )

