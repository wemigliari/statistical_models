library(ggplot2)
library(dplyr)
library(stats)

View(IndexTiempoSPTER)
summary(IndexTiempoSPTER)
boxplot(IndexTiempoSPTER$MinutosCTrabSP, IndexTiempoSPTER$MinutosCTrabTER , main = 'Commuting Time for S. Paulo and Terrassa', col = 'lightyellow', xlab = "Migliari, W. (2017)", labels = c("MinutosCTrabSP", "MinutosCTrabTER"), ylab = "Commuting Time in Minutes")


itspter <- aov(IndexTiempoSPTER$MinutosCTrabSP ~ IndexTiempoSPTER$Concepto + IndexTiempoSPTER$Concepto1)
summary(itspter)

itspter1 <- aov(IndexTiempoSPTER$MinutosCTrabTER ~ IndexTiempoSPTER$Concepto + IndexTiempoSPTER$Concepto1)
summary(itspter1)

TukeyHSD(aov(IndexTiempoSPTER$MinutosCTrabSP ~ IndexTiempoSPTER$Concepto1))
TukeyHSD(aov(IndexTiempoSPTER$MinutosCTrabTER ~ IndexTiempoSPTER$Concepto))
TukeyHSD(aov(IndexTiempoSPTER$MinutosCTrabSP ~ IndexTiempoSPTER$Concepto))
TukeyHSD(aov(IndexTiempoSPTER$MinutosCTrabTER ~ IndexTiempoSPTER$Concepto1))

plot(TukeyHSD(aov(IndexTiempoSPTER$MinutosCTrabSP ~ IndexTiempoSPTER$Concepto1)))
plot(TukeyHSD(aov(IndexTiempoSPTER$MinutosCTrabTER ~ IndexTiempoSPTER$Concepto)))
plot(TukeyHSD(aov(IndexTiempoSPTER$MinutosCTrabSP ~ IndexTiempoSPTER$Concepto)))
plot(TukeyHSD(aov(IndexTiempoSPTER$MinutosCTrabTER ~ IndexTiempoSPTER$Concepto1)))

kruskal.test(IndexTiempoSPTER$MinutosCTrabSP ~ IndexTiempoSPTER$MinutosCTrabTER)


###

attributes(it)
it$coefficients
