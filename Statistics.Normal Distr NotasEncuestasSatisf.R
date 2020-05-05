notasencuestasatisf <- c(4,5,5,3,5,4,5,4,4,4,4,4,5,2,4,4,4,3,4,3.5,
4,0,4,4,4,5,5,5,5,4,4,5,5,4,4,5,5,5,5,4,4,5,3,3,3,5,3,5,5,4,4,5,4,5,
4,5,5,5,5,3,4,5,5,4,5,3,5,4,4,3.5,4,5,5,4,4,4,5,5,4,3,3,5,5,3,3,2,5,
4,5,3,4,3,4,5,4,2,4,4,4,3.5,4,3,5,4,2,1,5,4,3,3.5,5,5,5,4,5,4,4,4,5,
4,4,5,5,4,5,4,5,5,5,4,4,3,5,3,5,4,5,5,4,5,5,5,5,5,5,5,5,5,4,5,4,3,5,
2,3,3,5,5,3,4,4,5,5,4,4,4,5,5,4,4.5,4,5,5,4,3,4,5,5,5,4,3,5,5,4,4,4,
5,5,4,5)
mean(notasencuestasatisf)
sd(notasencuestasatisf)

plot(function(notasencuestasatisf)dnorm(notasencuestasatisf,
     mean=4.207895,sd=0.872987),
     0,5,xlab="DistNormalNotas",
     ylab="Ciclo de Seminarios Transdisciplinarios")

mean(IndexTiempo$MinutosCTrab)
sd(IndexTiempo$MinutosCTrab)

MinutosCTrab <- IndexTiempo$MinutosCTrab
plot(function(MinutosCTrab)dnorm(MinutosCTrab, mean = 44.77, sd = 25.49), 0,5, xlab = "Distribuci??n Normal", ylab = "Probabilidad")



