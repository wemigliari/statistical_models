#Multiple Normal Distribution

library(ggplot2)
summary(IndexTiempo)

MinutosCTrab <- IndexTiempo$`MinutosCTrab`
MinutosCEB <- IndexTiempo$`MinutosCE&B`

ggplot(IndexTiempo, aes(IndexTiempo$`MinutosCTrab`, fil = as.factor(IndexTiempo$`MinutosCE&B`))) + geom_density(alpha = 0.3, col = 'lightblue', show.legend = TRUE) +
  labs(x = "Distr.Prob. Tiempo", y = "Valores") + geom_vline(xintercept = 60, size = 0.5, col = "red")


#Remembering the normal distribution

mean(IndexTiempo$MinutosCTrab)
sd(IndexTiempo$MinutosCTrab)

plot(function(MinutosCTrab)dnorm(MinutosCTrab,mean=44.7,sd=25.49),1,95,
     xlab="Distrib. de Probabilidad", ylab= "Values")
