library(ggplot2)
library(dplyr)
library(stats)

View(IndexTiempo)
summary(IndexTiempo)
boxplot(IndexTiempo, main = 'Commuting Time for Terrassa, Catalonia', col = 'lightyellow', xlab = "Migliari, W. (2017)", ylab = "Commuting Time in Minutes")

IndexTiempo <- aov(IndexTiempo$MinutosCTrab ~ IndexTiempo$`MinutosCE&B` + IndexTiempo$`MinutosCC&S`)
summary(IndexTiempo)
