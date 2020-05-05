summary(gapminder)
x <- mean(gapminder$gdpPercap)

attach(gapminder)
median(pop)
hist(lifeExp)
hist(log(pop))
boxplot(lifeExp ~ continent)
plot(lifeExp ~ log(gdpPercap))

summary(GiniRB)
x <- mean(GiniRB$Gini2015)

attach(GiniRB)
median(Gini2015)
hist(Gini2015, main = "Histograma Gini Index 2015 Brasil (IBGE)", xlab = "Freq.", ylab = "Dados", prob = TRUE, col = "lightgray")
hist(Gini2015, main = "Histograma Gini Index 2015 Brasil (IBGE)", xlab = "Freq.", ylab = "Dados", prob = TRUE, col = "yellow")
hist(log(Gini2015))
boxplot(Gini2015  ~ Territ.rio)
plot(Gini2015 ~ log(Gini2014))

summary(IndexTiempo)
boxplot(IndexTiempo, main = 'Datos Formularios Tiempo', col = 'lightyellow', xlab = "Migliari, W. (2017)", ylab = "Minutos")


