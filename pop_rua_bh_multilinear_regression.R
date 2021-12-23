library(readxl)
library(dplyr)

perfil <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                    sheet = "Perfil")


simple.fit = lm(perfil$Total~perfil$Ate_seis_meses_tempo_rua, data=perfil)
summary(simple.fit)



multi.fit = lm(perfil$Total~perfil$Ate_seis_meses_tempo_rua+
                 perfil$Entre_seis_meses_e_um_ano_tempo_rua+
                 perfil$Entre_um_e_dois_anos_tempo_rua+
                 perfil$Entre_dois_e_cinco_anos_tempo_rua+
                 perfil$Entre_cinco_e_dez_anos_tempo_rua+
                 perfil$Mais_de_dez_anos_tempo_rua, data=perfil)

summary(multi.fit)

residuos <- resid(multi.fit)

par(mfrow = c(1,1), family= "Arial", cex = 0.6, oma = c(1, 1, 1, 1))
plot(perfil$Total, residuos, 
 ylab="Resíduos", xlab="Totais de Moradores da Série Histórica Analisada Set 2020/Jun 2021", 
main="Regressão Multilinear Totais e Tempo de Rua") 
abline(0, 0)  

#### Excluindo a coluna repetida na regressao multilinear

perfil2 <- data.frame(perfil)
perfil2 <- perfil[-c(7),]

multi.fit2 = lm(perfil2$Total~perfil2$Ate_seis_meses_tempo_rua+
                       perfil2$Entre_seis_meses_e_um_ano_tempo_rua+
                       perfil2$Entre_um_e_dois_anos_tempo_rua+
                       perfil2$Entre_dois_e_cinco_anos_tempo_rua+
                       perfil2$Entre_cinco_e_dez_anos_tempo_rua+
                       perfil2$Mais_de_dez_anos_tempo_rua, data=perfil2)

summary(multi.fit2)

residuos2 <- resid(multi.fit2)

par(mfrow = c(1,1), family= "Arial", cex = 0.6, oma = c(1, 1, 1, 1))
plot(perfil2$Total, residuos2, 
     ylab="Resíduos", xlab="Totais de Moradores da Série Histórica Analisada Set 2020/Jun 2021", 
     main="Regressão Multilinear Totais e Tempo de Rua (Dados Redundantes Excluídos)") 
abline(0, 0)  

####

library(broom)
test <- tidy(summary(multi.fit))

library("writexl")
write_xlsx(test, "/Users/wemigliari/Documents/R/tabelas/pop_rua_bh_regress_multi.xlsx")



####

library(fBasics)
jarqueberaTest(simple.fit$residuals) #Test residuals for normality
#Null Hypothesis: Skewness and Kurtosis are equal to zero
#Residuals X-squared: 0.0252 p Value: 0.9875. 


###Normal distribution change file
library(readxl)
library(pastecs) 

perfil <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                    sheet = "Perfil")
perfil_stast_tab <- perfil[, -c(1)]
stat1 <- data.frame(stat.desc(perfil_stast_tab))

#####

hist(multi.fit$resid, main="Histogram of Residuals",
     ylab="Residuals")
#Q-Q Plot
qqnorm(multi.fit$resid)
qqline(multi.fit$resid)

#####Dnorm

mean(perfil$Total)
sd(perfil$Total)


d1 <- seq(7900, 9500, by = 0.1)
d2 <- dnorm(d1, mean = 8671, sd = 242)


par(mfrow = c(1,1), family= "Arial", cex = 0.5, oma = c(4, 1, 1, 4))
plot(d1, d2, col = "#e59400",  type = "l", lty = 1, lwd = 1, 
     xlim = c(7900,9500), ylim = c(0,0.0018),
     xlab = "Total de Moradores. Média 8.671. Desvio-Padrão 242. Série Temporal 09/2020-06/2021.",
     ylab = "Densidades")
abline(v = mean(perfil$Total), col="#e59400", lwd=0.5, lty=2)
text(x=mean(perfil$Total), y= 0.0005, "Média 8.671", pos = 2, cex=0.65,col="black") 
text(x=mean(perfil$Total), y= 0.00045, "Desvio-Padrão 242", pos = 2, cex=0.65,col="black") 

lines(x3, y3, col = "darkgreen", type = "l", lty = 1, lwd = 1)
lines(x4, y4, col = "yellowgreen", type = "l", lty = 1, lwd = 1)
lines(x5, y5, col = "olivedrab", type = "l", lty = 1, lwd = 1)


#### Pnorm

mean(perfil$Total)
sd(perfil$Total)


p1 <- seq(7900, 9500, by = 0.1)
p2 <- pnorm(p1, mean = 8671, sd = 242)

par(mfrow = c(1,1), family= "Arial", cex = 0.5, oma = c(4, 1, 1, 4))
plot(p1, p2, col = "#e59400",  type = "l", lty = 4, lwd = 1, 
     xlim = c(7900,9500), ylim = c(0,1),
     xlab = "Total de Moradores. Média 8.671. Desvio-Padrão 242. Série Temporal 09/2020-06/2021.",
     ylab = "Frequência Acumulada")

#### Qnorm

q1 <- seq(0, 1, by = 0.01)
q2 <- qnorm(q1,  mean = 8671, sd = 242)


par(mfrow = c(1,1), family= "Arial", cex = 0.5, oma = c(4, 1, 1, 4))
plot(q1, q2, col = "brown",  type = "l", lty = 3, lwd = 1, 
     xlab = "Distribuição de Probabilidades. Série Temporal 09/2020-06/2021.",
     ylab = "Total de Moradores")

#### Histograma
par(mfrow = c(1,1), family= "Arial", cex = 0.5, oma = c(4, 1, 1, 4))
hist(perfil$Total, breaks=50, col="#fff6e5",
     main="",
     ylab="Frequência", 
     xlab="Total de Moradores. Série Histórica: Prefeitura de Belo Horizonte. Set 2020-Jun 2021.") 

n = rnorm(10000, mean=8671, sd=242) 

hist(n, breaks=10, col="#ffedcc", 
     main="",
     ylab="Frequência", 
     xlab="Total de Moradores. 10 Meses.") 
hist(n, breaks=20, col="#ffdb99", 
     main="", 
     xlab="Total de Moradores. 20 Meses.") 
hist(n, breaks=30, col="#ffc966", 
     main="", 
     xlab="Total de Moradores. 30 Meses.") 
hist(n, breaks=40, col="#ffb732", 
     main="", 
     xlab="Total de Moradores. 40 Meses.") 
hist(n, breaks=50, col="#ffa500", 
     main="", 
     xlab="Total de Moradores. 50 Meses.") 






