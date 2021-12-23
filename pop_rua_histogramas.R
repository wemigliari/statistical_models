
library(readxl)
library(dplyr)

perfil <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                    sheet = "Perfil")

perfil <- data.frame(perfil)

#### Histograma
par(mfrow = c(1,1), family= "Arial", cex = 0.5, oma = c(4, 1, 1, 4))
hist(perfil$Total, breaks=9, col="#fff6e5",
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






