# Normal Distribution
library(readxl)
library(ggplot2)
summary(IndexTiempo)

IndexTiempo <- read.csv2("/Users/wemigliari/Documents/R/tabelas/IndexTiempoSPTER.csv")

MinutosCTrab <- IndexTiempo$MinutosCTrabSP
MinutosCEB <- IndexTiempo$MinutosCTrabTER

par(mfrow = c(1,1), family= "Arial", cex = 0.5, oma = c(4, 1, 1, 4))

ggplot(IndexTiempo, aes(MinutosCTrab, fil = as.factor(MinutosCEB))) + geom_density(alpha = 0.3, col = 'lightblue', show.legend = TRUE) +
  labs(x = "Tempo", y = "Distribuição de Probabilidade") + geom_vline(xintercept = 60, size = 0.5, col = "red")


#Remembering the normal distribution

mean(MinutosCTrab)
sd(MinutosCTrab)

par(mfrow = c(1,1), family= "Arial", cex = 0.7, oma = c(4, 1, 1, 4))
plot(function(MinutosCTrab)dnorm(MinutosCTrab,mean=44.7,sd=25.49),1,95,
     xlab="Tempo", ylab= "Distribuição de Probabilidade")
