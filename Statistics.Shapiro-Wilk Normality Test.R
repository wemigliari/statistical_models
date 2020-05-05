#Shapiro-Wilk Normality Test

plot(density(IndexTiempo$MinutosCTrab))
qqnorm(IndexTiempo$MinutosCTrab); qqline(IndexTiempo$MinutosCTrab, col = 2)

shapiro.test(IndexTiempo$MinutosCTrab)
shapiro.test(IndexTiempo$`MinutosCE&B`)
shapiro.test(IndexTiempo$`MinutosCC&S`)
shapiro.test(IndexTiempo$MinutosCHosp)
