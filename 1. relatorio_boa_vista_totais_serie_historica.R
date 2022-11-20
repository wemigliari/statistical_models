library(readxl)
library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(extrafont)
library(RColorBrewer)
library(ggrepel)
library(reshape2)
library(writexl)

totais <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/serie_historica_capitais_observatorio.xlsx")
totais <- data.frame(totais)

# Plot
library(hrbrthemes)
library(ggrepel)

totais %>%
  ggplot(aes(x=Ano, y=Boa.Vista)) +
  geom_line( color="grey") +
  geom_point(shape=21, color="black", fill="#69b3a2", size=3) +
  theme_ipsum() +
  ggtitle("População em Situação de Rua no Município de Boa Vista, 2012-2021") +
  labs(x ="", y = "Pessoas em Situação de Rua em Boa Vista",
       subtitle = "Série Histórica, Ministério da Cidadania",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0))) +
  geom_label_repel(aes(label = Belo.Horizonte),
                   box.padding   = 0.45, 
                   point.padding = 0.9,
                   size= 3,
                   segment.color = 'grey50') 

###### Auxílio Brasil

boa_vista_totais_2021_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2021.xlsx", 
                                   sheet="Bolsa Família")
boa_vista_totais_2021_bf  <- data.frame(boa_vista_totais_2021_bf)
boa_vista_totais_2021_bf$...1 <- NULL
boa_vista_totais_2021_bf$Ano <- "2021"
names(boa_vista_totais_2021_bf)[1] <- "MARC_PBF"

boa_vista_totais_2020_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2020.xlsx", 
                                   sheet="Bolsa Família")
boa_vista_totais_2020_bf  <- data.frame(boa_vista_totais_2020_bf)
boa_vista_totais_2020_bf$...1 <- NULL
boa_vista_totais_2020_bf$Ano <- "2020"

boa_vista_totais_2019_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2019.xlsx", 
                                   sheet="Bolsa Família")
boa_vista_totais_2019_bf  <- data.frame(boa_vista_totais_2019_bf)
boa_vista_totais_2019_bf$...1 <- NULL
boa_vista_totais_2019_bf$Ano <- "2019"

boa_vista_totais_2018_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2018.xlsx", 
                                   sheet="Bolsa Família")
boa_vista_totais_2018_bf  <- data.frame(boa_vista_totais_2018_bf)
boa_vista_totais_2018_bf$...1 <- NULL
boa_vista_totais_2018_bf$Ano <- "2018"


boa_vista_totais_2017_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2017.xlsx", 
                                   sheet="Bolsa Família")
boa_vista_totais_2017_bf  <- data.frame(boa_vista_totais_2017_bf)
boa_vista_totais_2017_bf$...1 <- NULL
boa_vista_totais_2017_bf$Ano <- "2017"

boa_vista_totais_2016_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2016.xlsx", 
                                   sheet="Bolsa Família")
boa_vista_totais_2016_bf  <- data.frame(boa_vista_totais_2016_bf)
boa_vista_totais_2016_bf$...1 <- NULL
boa_vista_totais_2016_bf$Ano <- "2016"

boa_vista_totais_2015_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2015.xlsx", 
                                   sheet="Bolsa Família")
boa_vista_totais_2015_bf  <- data.frame(boa_vista_totais_2015_bf)
boa_vista_totais_2015_bf$...1 <- NULL
boa_vista_totais_2015_bf$Ano <- "2015"

boa_vista_totais_2014_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2014.xlsx", 
                                   sheet="Bolsa Família")
boa_vista_totais_2014_bf  <- data.frame(boa_vista_totais_2014_bf)
boa_vista_totais_2014_bf$...1 <- NULL
boa_vista_totais_2014_bf$Ano <- "2014"

boa_vista_totais_2013_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2013.xlsx", 
                                   sheet="Bolsa Família")
boa_vista_totais_2013_bf  <- data.frame(boa_vista_totais_2013_bf)
boa_vista_totais_2013_bf$...1 <- NULL
boa_vista_totais_2013_bf$Ano <- "2013"

boa_vista_totais_2012_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2012.xlsx", 
                                   sheet="Bolsa Família")
boa_vista_totais_2012_bf  <- data.frame(boa_vista_totais_2012_bf)
boa_vista_totais_2012_bf$...1 <- NULL
boa_vista_totais_2012_bf$Ano <- "2012"


serie_historica_bf <- rbind(boa_vista_totais_2021_bf, 
                               boa_vista_totais_2020_bf, 
                               boa_vista_totais_2019_bf,
                               boa_vista_totais_2018_bf,
                               boa_vista_totais_2017_bf,
                               boa_vista_totais_2016_bf,
                               boa_vista_totais_2015_bf,
                               boa_vista_totais_2014_bf,
                               boa_vista_totais_2013_bf,
                               boa_vista_totais_2012_bf)

write_xlsx(serie_historica_bf, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/serie_historica_bf.xlsx")

ggplot(serie_historica_bf, aes(x = Ano, y = freq, fill = MARC_PBF)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista, Bolsa Família/Auxílio Brasil",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 12),
        axis.title.y = element_text(face="bold", colour="gray", size = 12),
        legend.title = element_text(face="bold", size = 10)) +
  scale_fill_manual(values = c("#DCDCDC", "#778899")) +
  theme(legend.title=element_blank())


###### Cor

boa_vista_totais_2021_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2021.xlsx", 
                                   sheet="Cor")
boa_vista_totais_2021_cor  <- data.frame(boa_vista_totais_2021_cor)
boa_vista_totais_2021_cor$...1 <- NULL
boa_vista_totais_2021_cor$Ano <- "2021"

boa_vista_totais_2020_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2020.xlsx", 
                                   sheet="Cor")
boa_vista_totais_2020_cor  <- data.frame(boa_vista_totais_2020_cor)
boa_vista_totais_2020_cor$...1 <- NULL
boa_vista_totais_2020_cor$Ano <- "2020"

boa_vista_totais_2019_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2019.xlsx", 
                                   sheet="Cor")
boa_vista_totais_2019_cor  <- data.frame(boa_vista_totais_2019_cor)
boa_vista_totais_2019_cor$...1 <- NULL
boa_vista_totais_2019_cor$Ano <- "2019"

boa_vista_totais_2018_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2018.xlsx", 
                                   sheet="Cor")
boa_vista_totais_2018_cor  <- data.frame(boa_vista_totais_2018_cor)
boa_vista_totais_2018_cor$...1 <- NULL
boa_vista_totais_2018_cor$Ano <- "2018"


boa_vista_totais_2017_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2017.xlsx", 
                                   sheet="Cor")
boa_vista_totais_2017_cor  <- data.frame(boa_vista_totais_2017_cor)
boa_vista_totais_2017_cor$...1 <- NULL
boa_vista_totais_2017_cor$Ano <- "2017"

boa_vista_totais_2016_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2016.xlsx", 
                                   sheet="Cor")
boa_vista_totais_2016_cor  <- data.frame(boa_vista_totais_2016_cor)
boa_vista_totais_2016_cor$...1 <- NULL
boa_vista_totais_2016_cor$Ano <- "2016"

boa_vista_totais_2015_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2015.xlsx", 
                                   sheet="Cor")
boa_vista_totais_2015_cor  <- data.frame(boa_vista_totais_2015_cor)
boa_vista_totais_2015_cor$...1 <- NULL
boa_vista_totais_2015_cor$Ano <- "2015"

boa_vista_totais_2014_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2014.xlsx", 
                                   sheet="Cor")
boa_vista_totais_2014_cor  <- data.frame(boa_vista_totais_2014_cor)
boa_vista_totais_2014_cor$...1 <- NULL
boa_vista_totais_2014_cor$Ano <- "2014"

boa_vista_totais_2013_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2013.xlsx", 
                                   sheet="Cor")
boa_vista_totais_2013_cor  <- data.frame(boa_vista_totais_2013_cor)
boa_vista_totais_2013_cor$...1 <- NULL
boa_vista_totais_2013_cor$Ano <- "2013"

boa_vista_totais_2012_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2012.xlsx", 
                                   sheet="Cor")
boa_vista_totais_2012_cor <- data.frame(boa_vista_totais_2012_cor)
boa_vista_totais_2012_cor$...1 <- NULL
boa_vista_totais_2012_cor$Ano <- "2012"


serie_historica_cor <- rbind(boa_vista_totais_2021_cor, 
                               boa_vista_totais_2020_cor, 
                               boa_vista_totais_2019_cor,
                               boa_vista_totais_2018_cor,
                               boa_vista_totais_2017_cor,
                               boa_vista_totais_2016_cor,
                               boa_vista_totais_2015_cor,
                               boa_vista_totais_2014_cor,
                               boa_vista_totais_2013_cor,
                               boa_vista_totais_2012_cor)

write_xlsx(serie_historica_cor, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/serie_historica_cor.xlsx")


ggplot(serie_historica_cor, aes(x = Ano, y = freq, fill = CO_RACA_COR_PESSOA)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista por Cor",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 12),
        axis.title.y = element_text(face="bold", colour="gray", size = 12),
        legend.title = element_text(face="bold", size = 10)) +
  scale_fill_manual(values = c("#808080", "#778899", "#C0C0C0","#DCDCDC", "#f6f6f6", "#2F4F4F")) +
  theme(legend.title=element_blank())


###### Sexo

boa_vista_totais_2021_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2021.xlsx", 
                                sheet="Sexo")
boa_vista_totais_2021_sexo  <- data.frame(boa_vista_totais_2021_sexo)
boa_vista_totais_2021_sexo$...1 <- NULL
boa_vista_totais_2021_sexo$Ano <- "2021"

boa_vista_totais_2020_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2020.xlsx", 
                                  sheet="Sexo")
boa_vista_totais_2020_sexo  <- data.frame(boa_vista_totais_2020_sexo)
boa_vista_totais_2020_sexo$...1 <- NULL
boa_vista_totais_2020_sexo$Ano <- "2020"

boa_vista_totais_2019_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2019.xlsx", 
                                  sheet="Sexo")
boa_vista_totais_2019_sexo  <- data.frame(boa_vista_totais_2019_sexo)
boa_vista_totais_2019_sexo$...1 <- NULL
boa_vista_totais_2019_sexo$Ano <- "2019"

boa_vista_totais_2018_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2018.xlsx", 
                                  sheet="Sexo")
boa_vista_totais_2018_sexo  <- data.frame(boa_vista_totais_2018_sexo)
boa_vista_totais_2018_sexo$...1 <- NULL
boa_vista_totais_2018_sexo$Ano <- "2018"


boa_vista_totais_2017_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2017.xlsx", 
                                  sheet="Sexo")
boa_vista_totais_2017_sexo  <- data.frame(boa_vista_totais_2017_sexo)
boa_vista_totais_2017_sexo$...1 <- NULL
boa_vista_totais_2017_sexo$Ano <- "2017"

boa_vista_totais_2016_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2016.xlsx", 
                                  sheet="Sexo")
boa_vista_totais_2016_sexo  <- data.frame(boa_vista_totais_2016_sexo)
boa_vista_totais_2016_sexo$...1 <- NULL
boa_vista_totais_2016_sexo$Ano <- "2016"

boa_vista_totais_2015_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2015.xlsx", 
                                  sheet="Sexo")
boa_vista_totais_2015_sexo  <- data.frame(boa_vista_totais_2015_sexo)
boa_vista_totais_2015_sexo$...1 <- NULL
boa_vista_totais_2015_sexo$Ano <- "2015"

boa_vista_totais_2014_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2014.xlsx", 
                                  sheet="Sexo")
boa_vista_totais_2014_sexo  <- data.frame(boa_vista_totais_2014_sexo)
boa_vista_totais_2014_sexo$...1 <- NULL
boa_vista_totais_2014_sexo$Ano <- "2014"

boa_vista_totais_2013_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2013.xlsx", 
                                  sheet="Sexo")
boa_vista_totais_2013_sexo  <- data.frame(boa_vista_totais_2013_sexo)
boa_vista_totais_2013_sexo$...1 <- NULL
boa_vista_totais_2013_sexo$Ano <- "2013"

boa_vista_totais_2012_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2012.xlsx", 
                                  sheet="Sexo")
boa_vista_totais_2012_sexo  <- data.frame(boa_vista_totais_2012_sexo)
boa_vista_totais_2012_sexo$...1 <- NULL
boa_vista_totais_2012_sexo$Ano <- "2012"


serie_historica_sexo <- rbind(boa_vista_totais_2021_sexo, 
                              boa_vista_totais_2020_sexo, 
                              boa_vista_totais_2019_sexo,
                              boa_vista_totais_2018_sexo,
                              boa_vista_totais_2017_sexo,
                              boa_vista_totais_2016_sexo,
                              boa_vista_totais_2015_sexo,
                              boa_vista_totais_2014_sexo,
                              boa_vista_totais_2013_sexo,
                              boa_vista_totais_2012_sexo)

write.xlsx(serie_historica_sexo, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/serie_historica_sexo.xlsx")

# Plot

ggplot(data = serie_historica_sexo, aes(x = Ano, y = freq, fill = CO_SEXO_PESSOA)) +
  geom_bar(stat = "identity", position = position_dodge(), alpha = 0.85)  +
  geom_text(
    aes(label = freq),
    colour = c("#808080"), size = 2.3,
    vjust = 1.7, position = position_dodge(.9)
  ) +
  labs(x ="", y = "Pessoas em Situação de Rua",
       subtitle = "Sexo Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista por Sexo",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 15),
        axis.title.y = element_text(face="bold", colour="gray", size = 15),
        legend.title = element_text(face="bold", size = 10)) +
  scale_fill_manual("", values = c("Feminino" = "#DCDCDC", "Masculino" = "#2F4F4F"))

###### Renda

boa_vista_totais_2021_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2021.xlsx", 
                                   sheet="Renda")
boa_vista_totais_2021_renda  <- data.frame(boa_vista_totais_2021_renda)
boa_vista_totais_2021_renda$...1 <- NULL
boa_vista_totais_2021_renda$Ano <- "2021"

boa_vista_totais_2020_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2020.xlsx", 
                                   sheet="Renda")
boa_vista_totais_2020_renda  <- data.frame(boa_vista_totais_2020_renda)
boa_vista_totais_2020_renda$...1 <- NULL
boa_vista_totais_2020_renda$Ano <- "2020"

boa_vista_totais_2019_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2019.xlsx", 
                                   sheet="Renda")
boa_vista_totais_2019_renda  <- data.frame(boa_vista_totais_2019_renda)
boa_vista_totais_2019_renda$...1 <- NULL
boa_vista_totais_2019_renda$Ano <- "2019"

boa_vista_totais_2018_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2018.xlsx", 
                                   sheet="Renda")
boa_vista_totais_2018_renda  <- data.frame(boa_vista_totais_2018_renda)
boa_vista_totais_2018_renda$...1 <- NULL
boa_vista_totais_2018_renda$Ano <- "2018"

boa_vista_totais_2017_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2017.xlsx", 
                                   sheet="Renda")
boa_vista_totais_2017_renda  <- data.frame(boa_vista_totais_2017_renda)
boa_vista_totais_2017_renda$...1 <- NULL
boa_vista_totais_2017_renda$Ano <- "2017"

boa_vista_totais_2016_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2016.xlsx", 
                                   sheet="Renda")
boa_vista_totais_2016_renda  <- data.frame(boa_vista_totais_2016_renda)
boa_vista_totais_2016_renda$...1 <- NULL
boa_vista_totais_2016_renda$Ano <- "2016"

boa_vista_totais_2015_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2015.xlsx", 
                                   sheet="Renda")
boa_vista_totais_2015_renda  <- data.frame(boa_vista_totais_2015_renda)
boa_vista_totais_2015_renda$...1 <- NULL
boa_vista_totais_2015_renda$Ano <- "2015"

boa_vista_totais_2014_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2014.xlsx", 
                                   sheet="Renda")
boa_vista_totais_2014_renda  <- data.frame(boa_vista_totais_2014_renda)
boa_vista_totais_2014_renda$...1 <- NULL
boa_vista_totais_2014_renda$Ano <- "2014"

boa_vista_totais_2013_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2013.xlsx", 
                                   sheet="Renda")
boa_vista_totais_2013_renda  <- data.frame(boa_vista_totais_2013_renda)
boa_vista_totais_2013_renda$...1 <- NULL
boa_vista_totais_2013_renda$Ano <- "2013"

boa_vista_totais_2012_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2012.xlsx", 
                                   sheet="Renda")
boa_vista_totais_2012_renda  <- data.frame(boa_vista_totais_2012_renda)
boa_vista_totais_2012_renda$...1 <- NULL
boa_vista_totais_2012_renda$Ano <- "2012"

serie_historica_renda <- rbind(boa_vista_totais_2021_renda, 
                               boa_vista_totais_2020_renda, 
                               boa_vista_totais_2019_renda,
                               boa_vista_totais_2018_renda,
                               boa_vista_totais_2017_renda,
                               boa_vista_totais_2016_renda,
                               boa_vista_totais_2015_renda,
                               boa_vista_totais_2014_renda,
                               boa_vista_totais_2013_renda,
                               boa_vista_totais_2012_renda)

write.xlsx(serie_historica_renda, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/serie_historica_renda.xlsx")


#Plot


ggplot(serie_historica_renda, aes(x = Ano, y = freq, fill = FX_RENDA)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista por Renda",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 12),
        axis.title.y = element_text(face="bold", colour="gray", size = 12),
        legend.title = element_text(face="bold", size = 10)) +
  scale_fill_manual(values = c("#808080", "#C0C0C0","#DCDCDC", "#2F4F4F")) +
  theme(legend.title=element_blank())


###### Idade

boa_vista_totais_2021_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2021.xlsx", 
                                   sheet="Idade")
boa_vista_totais_2021_idade  <- data.frame(boa_vista_totais_2021_idade)
boa_vista_totais_2021_idade$...1 <- NULL
boa_vista_totais_2021_idade$Ano <- "2021"

boa_vista_totais_2020_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2020.xlsx", 
                                   sheet="Idade")
boa_vista_totais_2020_idade  <- data.frame(boa_vista_totais_2020_idade)
boa_vista_totais_2020_idade$...1 <- NULL
boa_vista_totais_2020_idade$Ano <- "2020"

boa_vista_totais_2019_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2019.xlsx", 
                                   sheet="Idade")
boa_vista_totais_2019_idade  <- data.frame(boa_vista_totais_2019_idade)
boa_vista_totais_2019_idade$...1 <- NULL
boa_vista_totais_2019_idade$Ano <- "2019"

boa_vista_totais_2018_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2018.xlsx", 
                                   sheet="Idade")
boa_vista_totais_2018_idade  <- data.frame(boa_vista_totais_2018_idade)
boa_vista_totais_2018_idade$...1 <- NULL
boa_vista_totais_2018_idade$Ano <- "2018"

boa_vista_totais_2017_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2017.xlsx", 
                                   sheet="Idade")
boa_vista_totais_2017_idade  <- data.frame(boa_vista_totais_2017_idade)
boa_vista_totais_2017_idade$...1 <- NULL
boa_vista_totais_2017_idade$Ano <- "2017"

boa_vista_totais_2016_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2016.xlsx", 
                                   sheet="Idade")
boa_vista_totais_2016_idade  <- data.frame(boa_vista_totais_2016_idade)
boa_vista_totais_2016_idade$...1 <- NULL
boa_vista_totais_2016_idade$Ano <- "2016"

boa_vista_totais_2015_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2015.xlsx", 
                                   sheet="Idade")
boa_vista_totais_2015_idade  <- data.frame(boa_vista_totais_2015_idade)
boa_vista_totais_2015_idade$...1 <- NULL
boa_vista_totais_2015_idade$Ano <- "2015"

boa_vista_totais_2014_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2014.xlsx", 
                                   sheet="Idade")
boa_vista_totais_2014_idade  <- data.frame(boa_vista_totais_2014_idade)
boa_vista_totais_2014_idade$...1 <- NULL
boa_vista_totais_2014_idade$Ano <- "2014"

boa_vista_totais_2013_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2013.xlsx", 
                                   sheet="Idade")
boa_vista_totais_2013_idade  <- data.frame(boa_vista_totais_2013_idade)
boa_vista_totais_2013_idade$...1 <- NULL
boa_vista_totais_2013_idade$Ano <- "2013"

boa_vista_totais_2012_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2012.xlsx", 
                                   sheet="Idade")
boa_vista_totais_2012_idade  <- data.frame(boa_vista_totais_2012_idade)
boa_vista_totais_2012_idade$...1 <- NULL
boa_vista_totais_2012_idade$Ano <- "2012"

serie_historica_idade <- rbind(boa_vista_totais_2021_idade, 
                               boa_vista_totais_2020_idade, 
                               boa_vista_totais_2019_idade,
                               boa_vista_totais_2018_idade,
                               boa_vista_totais_2017_idade,
                               boa_vista_totais_2016_idade,
                               boa_vista_totais_2015_idade,
                               boa_vista_totais_2014_idade,
                               boa_vista_totais_2013_idade,
                               boa_vista_totais_2012_idade)

write_xlsx(serie_historica_idade, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/serie_historica_idade.xlsx")

#Idade

ggplot(serie_historica_idade, aes(x = Ano, y = freq, fill = FX_ETARIA)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista por Idade",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 12),
        axis.title.y = element_text(face="bold", colour="gray", size = 12),
        legend.title = element_text(face="bold", size = 10)) +
  scale_fill_manual(values = c("#808080", "#C0C0C0","#DCDCDC", "#f6f6f6", "#778899", "#2F4F4F")) +
  theme(legend.title=element_blank())



###### Escolaridade

boa_vista_totais_2021_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2021.xlsx", 
                                sheet="Instrução")
boa_vista_totais_2021_escolaridade <- data.frame(boa_vista_totais_2021_escolaridade)
boa_vista_totais_2021_escolaridade$...1 <- NULL
boa_vista_totais_2021_escolaridade$Ano <- "2021"

boa_vista_totais_2020_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2020.xlsx", 
                                          sheet="Instrução")
boa_vista_totais_2020_escolaridade <- data.frame(boa_vista_totais_2020_escolaridade)
boa_vista_totais_2020_escolaridade$...1 <- NULL
boa_vista_totais_2020_escolaridade$Ano <- "2020"


boa_vista_totais_2019_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2019.xlsx", 
                                          sheet="Instrução")
boa_vista_totais_2019_escolaridade <- data.frame(boa_vista_totais_2019_escolaridade)
boa_vista_totais_2019_escolaridade$...1 <- NULL
boa_vista_totais_2019_escolaridade$Ano <- "2019"

boa_vista_totais_2018_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2018.xlsx", 
                                          sheet="Instrução")
boa_vista_totais_2018_escolaridade <- data.frame(boa_vista_totais_2018_escolaridade)
boa_vista_totais_2018_escolaridade$...1 <- NULL
boa_vista_totais_2018_escolaridade$Ano <- "2018"

boa_vista_totais_2017_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2017.xlsx", 
                                          sheet="Instrução")
boa_vista_totais_2017_escolaridade <- data.frame(boa_vista_totais_2017_escolaridade)
boa_vista_totais_2017_escolaridade$...1 <- NULL
boa_vista_totais_2017_escolaridade$Ano <- "2017"

boa_vista_totais_2016_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2016.xlsx", 
                                          sheet="Instrução")
boa_vista_totais_2016_escolaridade <- data.frame(boa_vista_totais_2016_escolaridade)
boa_vista_totais_2016_escolaridade$...1 <- NULL
boa_vista_totais_2016_escolaridade$Ano <- "2016"

boa_vista_totais_2015_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2015.xlsx", 
                                          sheet="Instrução")
boa_vista_totais_2015_escolaridade <- data.frame(boa_vista_totais_2015_escolaridade)
boa_vista_totais_2015_escolaridade$...1 <- NULL
boa_vista_totais_2015_escolaridade$Ano <- "2015"

boa_vista_totais_2014_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2014.xlsx", 
                                          sheet="Instrução")
boa_vista_totais_2014_escolaridade <- data.frame(boa_vista_totais_2014_escolaridade)
boa_vista_totais_2014_escolaridade$...1 <- NULL
boa_vista_totais_2014_escolaridade$Ano <- "2014"

boa_vista_totais_2013_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2013.xlsx", 
                                          sheet="Instrução")
boa_vista_totais_2013_escolaridade <- data.frame(boa_vista_totais_2013_escolaridade)
boa_vista_totais_2013_escolaridade$...1 <- NULL
boa_vista_totais_2013_escolaridade$Ano <- "2013"

boa_vista_totais_2012_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2012.xlsx", 
                                          sheet="Instrução")
boa_vista_totais_2012_escolaridade <- data.frame(boa_vista_totais_2012_escolaridade)
boa_vista_totais_2012_escolaridade$...1 <- NULL
boa_vista_totais_2012_escolaridade$Ano <- "2012"

serie_historica_escolaridade <- rbind(boa_vista_totais_2021_escolaridade, 
                               boa_vista_totais_2020_escolaridade, 
                               boa_vista_totais_2019_escolaridade,
                               boa_vista_totais_2018_escolaridade,
                               boa_vista_totais_2017_escolaridade,
                               boa_vista_totais_2016_escolaridade,
                               boa_vista_totais_2015_escolaridade,
                               boa_vista_totais_2014_escolaridade,
                               boa_vista_totais_2013_escolaridade,
                               boa_vista_totais_2012_escolaridade)

write.xlsx(serie_historica_escolaridade, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/serie_historica_escolaridade.xlsx")


ggplot(serie_historica_escolaridade, aes(x = Ano, y = freq, fill = GRAU_INSTRUCAO)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista por Escolaridade",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 12),
        axis.title.y = element_text(face="bold", colour="gray", size = 12),
        legend.title = element_text(face="bold", size = 10)) +
  scale_fill_manual(values = c("#808080", "#C0C0C0","#DCDCDC", "#f6f6f6", "black", "#778899", "#2F4F4F", "steelblue", "slategray", "gold")) +
  theme(legend.title=element_blank())



###### Saber Ler & Escrever

boa_vista_totais_2021_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2021.xlsx", 
                                          sheet="Ler & Escrever")
boa_vista_totais_2021_ler_escrever <- data.frame(boa_vista_totais_2021_ler_escrever )
boa_vista_totais_2021_ler_escrever$...1 <- NULL
boa_vista_totais_2021_ler_escrever$Ano <- "2021"


boa_vista_totais_2020_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2020.xlsx", 
                                          sheet="Ler & Escrever")
boa_vista_totais_2020_ler_escrever <- data.frame(boa_vista_totais_2020_ler_escrever )
boa_vista_totais_2020_ler_escrever$...1 <- NULL
boa_vista_totais_2020_ler_escrever$Ano <- "2020"


boa_vista_totais_2019_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2019.xlsx", 
                                          sheet="Ler & Escrever")
boa_vista_totais_2019_ler_escrever <- data.frame(boa_vista_totais_2019_ler_escrever )
boa_vista_totais_2019_ler_escrever$...1 <- NULL
boa_vista_totais_2019_ler_escrever$Ano <- "2019"


boa_vista_totais_2018_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2018.xlsx", 
                                          sheet="Ler & Escrever")
boa_vista_totais_2018_ler_escrever <- data.frame(boa_vista_totais_2018_ler_escrever )
boa_vista_totais_2018_ler_escrever$...1 <- NULL
boa_vista_totais_2018_ler_escrever$Ano <- "2018"


boa_vista_totais_2017_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2017.xlsx", 
                                          sheet="Ler & Escrever")
boa_vista_totais_2017_ler_escrever <- data.frame(boa_vista_totais_2017_ler_escrever )
boa_vista_totais_2017_ler_escrever$...1 <- NULL
boa_vista_totais_2017_ler_escrever$Ano <- "2017"


boa_vista_totais_2016_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2016.xlsx", 
                                          sheet="Ler & Escrever")
boa_vista_totais_2016_ler_escrever <- data.frame(boa_vista_totais_2016_ler_escrever )
boa_vista_totais_2016_ler_escrever$...1 <- NULL
boa_vista_totais_2016_ler_escrever$Ano <- "2016"


boa_vista_totais_2015_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2015.xlsx", 
                                          sheet="Ler & Escrever")
boa_vista_totais_2015_ler_escrever <- data.frame(boa_vista_totais_2015_ler_escrever )
boa_vista_totais_2015_ler_escrever$...1 <- NULL
boa_vista_totais_2015_ler_escrever$Ano <- "2015"


boa_vista_totais_2014_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2014.xlsx", 
                                          sheet="Ler & Escrever")
boa_vista_totais_2014_ler_escrever <- data.frame(boa_vista_totais_2014_ler_escrever )
boa_vista_totais_2014_ler_escrever$...1 <- NULL
boa_vista_totais_2014_ler_escrever$Ano <- "2014"

boa_vista_totais_2013_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2013.xlsx", 
                                          sheet="Ler & Escrever")
boa_vista_totais_2013_ler_escrever <- data.frame(boa_vista_totais_2013_ler_escrever )
boa_vista_totais_2013_ler_escrever$...1 <- NULL
boa_vista_totais_2013_ler_escrever$Ano <- "2013"


boa_vista_totais_2012_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2012.xlsx", 
                                          sheet="Ler & Escrever")
boa_vista_totais_2012_ler_escrever <- data.frame(boa_vista_totais_2012_ler_escrever )
boa_vista_totais_2012_ler_escrever$...1 <- NULL
boa_vista_totais_2012_ler_escrever$Ano <- "2012"



serie_historica_ler_escrever <- rbind(boa_vista_totais_2021_ler_escrever, 
                                      boa_vista_totais_2020_ler_escrever, 
                                      boa_vista_totais_2019_ler_escrever,
                                      boa_vista_totais_2018_ler_escrever,
                                      boa_vista_totais_2017_ler_escrever,
                                      boa_vista_totais_2016_ler_escrever,
                                      boa_vista_totais_2015_ler_escrever,
                                      boa_vista_totais_2014_ler_escrever,
                                      boa_vista_totais_2013_ler_escrever,
                                      boa_vista_totais_2012_ler_escrever)

write.xlsx(serie_historica_ler_escrever, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/serie_historica_ler_escrever.xlsx")


ggplot(serie_historica_ler_escrever, aes(x = Ano, y = freq, fill = CO_SABE_LER_ESCREVER_MEMB)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista, Saber Ler & Escrever",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 12),
        axis.title.y = element_text(face="bold", colour="gray", size = 12),
        legend.title = element_text(face="bold", size = 10)) +
  scale_fill_manual(values = c("#778899", "#DCDCDC", "#C0C0C0")) +
  theme(legend.title=element_blank())



###### Atualização Cadastral

boa_vista_totais_2021_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2021.xlsx", 
                                sheet="Atualização")
boa_vista_totais_2021_atua_cadas   <- data.frame(boa_vista_totais_2021_atua_cadas)
boa_vista_totais_2021_atua_cadas$...1 <- NULL
boa_vista_totais_2021_atua_cadas$Ano <- "2021"
boa_vista_totais_2021_atua_cadas$Min <- min(boa_vista_totais_2021_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
boa_vista_totais_2021_atua_cadas$Max <- max(boa_vista_totais_2021_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)

boa_vista_totais_2020_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2020.xlsx", 
                                        sheet="Atualização")
boa_vista_totais_2020_atua_cadas   <- data.frame(boa_vista_totais_2020_atua_cadas)
boa_vista_totais_2020_atua_cadas$...1 <- NULL
boa_vista_totais_2020_atua_cadas$Ano <- "2020"
boa_vista_totais_2020_atua_cadas$Min <- min(boa_vista_totais_2020_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
boa_vista_totais_2020_atua_cadas$Max <- max(boa_vista_totais_2020_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)


boa_vista_totais_2019_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2019.xlsx", 
                                        sheet="Atualização")
boa_vista_totais_2019_atua_cadas   <- data.frame(boa_vista_totais_2019_atua_cadas)
boa_vista_totais_2019_atua_cadas$...1 <- NULL
boa_vista_totais_2019_atua_cadas$Ano <- "2019"
boa_vista_totais_2019_atua_cadas$Min <- min(boa_vista_totais_2019_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
boa_vista_totais_2019_atua_cadas$Max <- max(boa_vista_totais_2019_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)



boa_vista_totais_2018_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2018.xlsx", 
                                        sheet="Atualização")
boa_vista_totais_2018_atua_cadas   <- data.frame(boa_vista_totais_2018_atua_cadas)
boa_vista_totais_2018_atua_cadas$...1 <- NULL
boa_vista_totais_2018_atua_cadas$Ano <- "2018"
boa_vista_totais_2018_atua_cadas$Min <- min(boa_vista_totais_2018_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
boa_vista_totais_2018_atua_cadas$Max <- max(boa_vista_totais_2018_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)


boa_vista_totais_2017_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2017.xlsx", 
                                        sheet="Atualização")
boa_vista_totais_2017_atua_cadas   <- data.frame(boa_vista_totais_2017_atua_cadas)
boa_vista_totais_2017_atua_cadas$...1 <- NULL
boa_vista_totais_2017_atua_cadas$Ano <- "2017"
boa_vista_totais_2017_atua_cadas$Min <- min(boa_vista_totais_2017_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
boa_vista_totais_2017_atua_cadas$Max <- max(boa_vista_totais_2017_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)


boa_vista_totais_2016_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2016.xlsx", 
                                        sheet="Atualização")
boa_vista_totais_2016_atua_cadas   <- data.frame(boa_vista_totais_2016_atua_cadas)
boa_vista_totais_2016_atua_cadas$...1 <- NULL
boa_vista_totais_2016_atua_cadas$Ano <- "2016"
boa_vista_totais_2016_atua_cadas$Min <- min(boa_vista_totais_2016_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
boa_vista_totais_2016_atua_cadas$Max <- max(boa_vista_totais_2016_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)


boa_vista_totais_2015_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2015.xlsx", 
                                        sheet="Atualização")
boa_vista_totais_2015_atua_cadas   <- data.frame(boa_vista_totais_2015_atua_cadas)
boa_vista_totais_2015_atua_cadas$...1 <- NULL
boa_vista_totais_2015_atua_cadas$Ano <- "2015"
boa_vista_totais_2015_atua_cadas$Min <- min(boa_vista_totais_2015_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
boa_vista_totais_2015_atua_cadas$Max <- max(boa_vista_totais_2015_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)


boa_vista_totais_2014_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2014.xlsx", 
                                        sheet="Atualização")
boa_vista_totais_2014_atua_cadas   <- data.frame(boa_vista_totais_2014_atua_cadas)
boa_vista_totais_2014_atua_cadas$...1 <- NULL
boa_vista_totais_2014_atua_cadas$Ano <- "2014"
boa_vista_totais_2014_atua_cadas$Min <- min(boa_vista_totais_2014_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
boa_vista_totais_2014_atua_cadas$Max <- max(boa_vista_totais_2014_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)


boa_vista_totais_2013_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2013.xlsx", 
                                        sheet="Atualização")
boa_vista_totais_2013_atua_cadas   <- data.frame(boa_vista_totais_2013_atua_cadas)
boa_vista_totais_2013_atua_cadas$...1 <- NULL
boa_vista_totais_2013_atua_cadas$Ano <- "2013"
boa_vista_totais_2013_atua_cadas$Min <- min(boa_vista_totais_2013_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
boa_vista_totais_2013_atua_cadas$Max <- max(boa_vista_totais_2013_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)



boa_vista_totais_2012_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2012.xlsx", 
                                        sheet="Atualização")
boa_vista_totais_2012_atua_cadas   <- data.frame(boa_vista_totais_2012_atua_cadas)
boa_vista_totais_2012_atua_cadas$...1 <- NULL
boa_vista_totais_2012_atua_cadas$Ano <- "2012"
boa_vista_totais_2012_atua_cadas$Min <- min(boa_vista_totais_2012_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
boa_vista_totais_2012_atua_cadas$Max <- max(boa_vista_totais_2012_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)



serie_historica_cadastro <- rbind(boa_vista_totais_2021_atua_cadas, 
                                      boa_vista_totais_2020_atua_cadas, 
                                      boa_vista_totais_2019_atua_cadas,
                                      boa_vista_totais_2018_atua_cadas,
                                      boa_vista_totais_2017_atua_cadas,
                                      boa_vista_totais_2016_atua_cadas,
                                      boa_vista_totais_2015_atua_cadas,
                                      boa_vista_totais_2014_atua_cadas,
                                      boa_vista_totais_2013_atua_cadas,
                                      boa_vista_totais_2012_atua_cadas)

write.xlsx(serie_historica_cadastro, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/serie_historica_cadastro.xlsx")


serie_historica_cadastro$Ano <- as.numeric(serie_historica_cadastro$Ano)

################

library(ggthemes)

ggplot(serie_historica_cadastro, aes(Ano, MESES_APOS_ULT_ATUALIZACAO)) +
  geom_line(aes(group = Max)) +
  geom_point(aes(color = Max), size = 1.5) +
  coord_flip() +
  labs(x ="", y = "Meses Após a Útlima Atualização",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista, Atualização Cadastral",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(legend.position = "none") +
  scale_y_continuous(limits=c(0, 120), breaks=c(0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120))

##

ggplot(serie_historica_cadastro, aes(MESES_APOS_ULT_ATUALIZACAO, freq)) +
  geom_line(aes(group = Ano)) +
  geom_point(aes(color = Ano), size = 2.5, alpha=0.3) +
  labs(x ="", y = "Pessoas em Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista, Atualização Cadastral",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 12),
        axis.title.y = element_text(face="bold", colour="gray", size = 12),
        legend.title = element_text(face="bold", size = 10)) +
  theme(legend.position = "none") +
  scale_x_continuous(limits=c(0, 120), breaks=c(0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120)) 

## Zoom no gráfico anterior retirando os três outliers

serie_historica_cadastro[order(-serie_historica_cadastro$freq),]

ggplot(serie_historica_cadastro, aes(MESES_APOS_ULT_ATUALIZACAO, freq)) +
  geom_line(aes(group = Ano)) +
  geom_point(aes(color = Ano), size = 2.5, alpha=0.3) +
  labs(x ="", y = "Pessoas em Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista, Atualização Cadastral",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(legend.position = "none") +
  scale_x_continuous(limits=c(0, 120), breaks=c(0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120)) +
  scale_y_continuous(limits = c(0, 3500)) +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 12),
        axis.title.y = element_text(face="bold", colour="gray", size = 12),
        legend.title = element_text(face="bold", size = 10)) +
  annotate("rect", xmin = 0, xmax = 24, ymin = 0, ymax = 3500,
           alpha = .1) +
  annotate("rect", xmin = 24, xmax = 36, ymin = 0, ymax = 3500,
           alpha = .2) +
  annotate("rect", xmin = 36, xmax = 120, ymin = 0, ymax = 3500,
           alpha = .3) +
  annotate(geom="text", x=12, y=3000, label="+++",
           color="black") +
  annotate(geom="text", x=30, y=3000, label="++",
           color="black") +
  annotate(geom="text", x=48, y=3000, label="+",
           color="black") 

##################

###### Indígenas

boa_vista_totais_2021_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2021.xlsx", 
                                        sheet="Indígenas")
boa_vista_totais_2021_indigenas   <- data.frame(boa_vista_totais_2021_indigenas)
boa_vista_totais_2021_indigenas$...1 <- NULL
boa_vista_totais_2021_indigenas$Ano <- "2021"

boa_vista_totais_2020_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2020.xlsx", 
                                       sheet="Indígenas")
boa_vista_totais_2020_indigenas   <- data.frame(boa_vista_totais_2020_indigenas)
boa_vista_totais_2020_indigenas$...1 <- NULL
boa_vista_totais_2020_indigenas$Ano <- "2020"


boa_vista_totais_2019_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2019.xlsx", 
                                       sheet="Indígenas")
boa_vista_totais_2019_indigenas   <- data.frame(boa_vista_totais_2019_indigenas)
boa_vista_totais_2019_indigenas$...1 <- NULL
boa_vista_totais_2019_indigenas$Ano <- "2019"


boa_vista_totais_2018_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2018.xlsx", 
                                       sheet="Indígenas")
boa_vista_totais_2018_indigenas   <- data.frame(boa_vista_totais_2018_indigenas)
boa_vista_totais_2018_indigenas$...1 <- NULL
boa_vista_totais_2018_indigenas$Ano <- "2018"


boa_vista_totais_2017_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2017.xlsx", 
                                       sheet="Indígenas")
boa_vista_totais_2017_indigenas   <- data.frame(boa_vista_totais_2017_indigenas)
boa_vista_totais_2017_indigenas$...1 <- NULL
boa_vista_totais_2017_indigenas$Ano <- "2017"


boa_vista_totais_2016_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2016.xlsx", 
                                       sheet="Indígenas")
boa_vista_totais_2016_indigenas   <- data.frame(boa_vista_totais_2016_indigenas)
boa_vista_totais_2016_indigenas$...1 <- NULL
boa_vista_totais_2016_indigenas$Ano <- "2016"


boa_vista_totais_2015_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2015.xlsx", 
                                       sheet="Indígenas")
boa_vista_totais_2015_indigenas   <- data.frame(boa_vista_totais_2015_indigenas)
boa_vista_totais_2015_indigenas$...1 <- NULL
boa_vista_totais_2015_indigenas$Ano <- "2015"


boa_vista_totais_2014_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2014.xlsx", 
                                       sheet="Indígenas")
boa_vista_totais_2014_indigenas   <- data.frame(boa_vista_totais_2014_indigenas)
boa_vista_totais_2014_indigenas$...1 <- NULL
boa_vista_totais_2014_indigenas$Ano <- "2014"


boa_vista_totais_2013_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2013.xlsx", 
                                       sheet="Indígenas")
boa_vista_totais_2013_indigenas   <- data.frame(boa_vista_totais_2013_indigenas)
boa_vista_totais_2013_indigenas$...1 <- NULL
boa_vista_totais_2013_indigenas$Ano <- "2013"


boa_vista_totais_2012_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2012.xlsx", 
                                       sheet="Indígenas")
boa_vista_totais_2012_indigenas   <- data.frame(boa_vista_totais_2012_indigenas)
boa_vista_totais_2012_indigenas$...1 <- NULL
boa_vista_totais_2012_indigenas$Ano <- "2012"

serie_historica_indigenas <- rbind(boa_vista_totais_2021_indigenas, 
                                      boa_vista_totais_2020_indigenas, 
                                      boa_vista_totais_2019_indigenas,
                                      boa_vista_totais_2018_indigenas,
                                      boa_vista_totais_2017_indigenas,
                                      boa_vista_totais_2016_indigenas,
                                      boa_vista_totais_2015_indigenas,
                                      boa_vista_totais_2014_indigenas,
                                      boa_vista_totais_2013_indigenas,
                                      boa_vista_totais_2012_indigenas)


write.xlsx(serie_historica_indigenas, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/serie_historica_indigenas.xlsx")


ggplot(serie_historica_indigenas, aes(x = Ano, y = freq, fill = IN_FAMILIA_INDIGENA_FAM)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista, Indígenas",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 12),
        axis.title.y = element_text(face="bold", colour="gray", size = 12),
        legend.title = element_text(face="bold", size = 10)) +
  scale_fill_manual(values = c("#778899", "#DCDCDC", "#C0C0C0")) +
  theme(legend.title=element_blank()) +
  geom_line(aes(x = Ano, y = freq), size = 1, color="gray", group = 1) +
  annotate(geom="text", x="2015", y=40000, label="Nenhum respondente 'Sim'",
           color="gray")


###### Quilombolas

boa_vista_totais_2021_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2021.xlsx", 
                                       sheet="Quilombolas")
boa_vista_totais_2021_quilombolas   <- data.frame(boa_vista_totais_2021_quilombolas)
boa_vista_totais_2021_quilombolas$...1 <- NULL
boa_vista_totais_2021_quilombolas$Ano <- "2021"


boa_vista_totais_2020_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2020.xlsx", 
                                         sheet="Quilombolas")
boa_vista_totais_2020_quilombolas   <- data.frame(boa_vista_totais_2020_quilombolas)
boa_vista_totais_2020_quilombolas$...1 <- NULL
boa_vista_totais_2020_quilombolas$Ano <- "2020"


boa_vista_totais_2019_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2019.xlsx", 
                                         sheet="Quilombolas")
boa_vista_totais_2019_quilombolas   <- data.frame(boa_vista_totais_2019_quilombolas)
boa_vista_totais_2019_quilombolas$...1 <- NULL
boa_vista_totais_2019_quilombolas$Ano <- "2019"



boa_vista_totais_2018_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2018.xlsx", 
                                         sheet="Quilombolas")
boa_vista_totais_2018_quilombolas   <- data.frame(boa_vista_totais_2018_quilombolas)
boa_vista_totais_2018_quilombolas$...1 <- NULL
boa_vista_totais_2018_quilombolas$Ano <- "2018"



boa_vista_totais_2017_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2017.xlsx", 
                                         sheet="Quilombolas")
boa_vista_totais_2017_quilombolas   <- data.frame(boa_vista_totais_2017_quilombolas)
boa_vista_totais_2017_quilombolas$...1 <- NULL
boa_vista_totais_2017_quilombolas$Ano <- "2017"


boa_vista_totais_2016_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2016.xlsx", 
                                         sheet="Quilombolas")
boa_vista_totais_2016_quilombolas   <- data.frame(boa_vista_totais_2016_quilombolas)
boa_vista_totais_2016_quilombolas$...1 <- NULL
boa_vista_totais_2016_quilombolas$Ano <- "2016"



boa_vista_totais_2015_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2015.xlsx", 
                                         sheet="Quilombolas")
boa_vista_totais_2015_quilombolas   <- data.frame(boa_vista_totais_2015_quilombolas)
boa_vista_totais_2015_quilombolas$...1 <- NULL
boa_vista_totais_2015_quilombolas$Ano <- "2015"


boa_vista_totais_2014_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2014.xlsx", 
                                         sheet="Quilombolas")
boa_vista_totais_2014_quilombolas   <- data.frame(boa_vista_totais_2014_quilombolas)
boa_vista_totais_2014_quilombolas$...1 <- NULL
boa_vista_totais_2014_quilombolas$Ano <- "2014"


boa_vista_totais_2013_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2013.xlsx", 
                                         sheet="Quilombolas")
boa_vista_totais_2013_quilombolas   <- data.frame(boa_vista_totais_2013_quilombolas)
boa_vista_totais_2013_quilombolas$...1 <- NULL
boa_vista_totais_2013_quilombolas$Ano <- "2013"


boa_vista_totais_2012_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2012.xlsx", 
                                         sheet="Quilombolas")
boa_vista_totais_2012_quilombolas   <- data.frame(boa_vista_totais_2012_quilombolas)
boa_vista_totais_2012_quilombolas$...1 <- NULL
boa_vista_totais_2012_quilombolas$Ano <- "2012"


serie_historica_quilombolas <- rbind(boa_vista_totais_2021_quilombolas, 
                                   boa_vista_totais_2020_quilombolas, 
                                   boa_vista_totais_2019_quilombolas,
                                   boa_vista_totais_2018_quilombolas,
                                   boa_vista_totais_2017_quilombolas,
                                   boa_vista_totais_2016_quilombolas,
                                   boa_vista_totais_2015_quilombolas,
                                   boa_vista_totais_2014_quilombolas,
                                   boa_vista_totais_2013_quilombolas,
                                   boa_vista_totais_2012_quilombolas)

write.xlsx(serie_historica_quilombolas, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/serie_historica_quilombolas.xlsx")


ggplot(serie_historica_quilombolas, aes(x = Ano, y = freq, fill = IN_FAMILIA_QUILOMBOLA_FAM)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista Pertencentes a Famílias Quilombolas",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 12),
        axis.title.y = element_text(face="bold", colour="gray", size = 12),
        legend.title = element_text(face="bold", size = 10)) +
  scale_fill_manual(values = c("#778899", "#DCDCDC", "slategray", "gold")) +
  theme(legend.title=element_blank()) +
  geom_label( 
    data=serie_historica_quilombolas %>% filter(IN_FAMILIA_QUILOMBOLA_FAM == "Sim"), # Filter data first
    aes(label=freq)
  ) +
  guides(
    fill = guide_legend(
      title = "",
      override.aes = aes(label = "")
    )
  )


###### Grupos Tradicionais Específicos

boa_vista_totais_2021_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2021.xlsx", 
                                         sheet="Grupos Tradicionais Específicos")
boa_vista_totais_2021_gte <- data.frame(boa_vista_totais_2021_gte )
boa_vista_totais_2021_gte$...1 <- NULL
boa_vista_totais_2021_gte$Ano <- "2021"


boa_vista_totais_2020_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2020.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
boa_vista_totais_2020_gte <- data.frame(boa_vista_totais_2020_gte )
boa_vista_totais_2020_gte$...1 <- NULL
boa_vista_totais_2020_gte$Ano <- "2020"


boa_vista_totais_2019_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2019.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
boa_vista_totais_2019_gte <- data.frame(boa_vista_totais_2019_gte )
boa_vista_totais_2019_gte$...1 <- NULL
boa_vista_totais_2019_gte$Ano <- "2019"


boa_vista_totais_2018_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2018.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
boa_vista_totais_2018_gte <- data.frame(boa_vista_totais_2018_gte )
boa_vista_totais_2018_gte$...1 <- NULL
boa_vista_totais_2018_gte$Ano <- "2018"


boa_vista_totais_2017_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2017.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
boa_vista_totais_2017_gte <- data.frame(boa_vista_totais_2017_gte )
boa_vista_totais_2017_gte$...1 <- NULL
boa_vista_totais_2017_gte$Ano <- "2017"

boa_vista_totais_2016_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2016.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
boa_vista_totais_2016_gte <- data.frame(boa_vista_totais_2016_gte )
boa_vista_totais_2016_gte$...1 <- NULL
boa_vista_totais_2016_gte$Ano <- "2016"


boa_vista_totais_2015_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2015.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
boa_vista_totais_2015_gte <- data.frame(boa_vista_totais_2015_gte )
boa_vista_totais_2015_gte$...1 <- NULL
boa_vista_totais_2015_gte$Ano <- "2015"


boa_vista_totais_2014_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2014.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
boa_vista_totais_2014_gte <- data.frame(boa_vista_totais_2014_gte )
boa_vista_totais_2014_gte$...1 <- NULL
boa_vista_totais_2014_gte$Ano <- "2014"


boa_vista_totais_2013_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2013.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
boa_vista_totais_2013_gte <- data.frame(boa_vista_totais_2013_gte )
boa_vista_totais_2013_gte$...1 <- NULL
boa_vista_totais_2013_gte$Ano <- "2013"

boa_vista_totais_2012_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/2012.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
boa_vista_totais_2012_gte <- data.frame(boa_vista_totais_2012_gte )
boa_vista_totais_2012_gte$...1 <- NULL
boa_vista_totais_2012_gte$Ano <- "2012"



serie_historica_gte <- rbind(boa_vista_totais_2021_gte, 
                                     boa_vista_totais_2020_gte, 
                                     boa_vista_totais_2019_gte,
                                     boa_vista_totais_2018_gte,
                                     boa_vista_totais_2017_gte,
                                     boa_vista_totais_2016_gte,
                                     boa_vista_totais_2015_gte,
                                     boa_vista_totais_2014_gte,
                                     boa_vista_totais_2013_gte,
                                     boa_vista_totais_2012_gte)

write.xlsx(serie_historica_gte, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/boa_vista/serie_historica_gte.xlsx")

ggplot(serie_historica_gte, aes(x = Ano, y = freq, fill = IN_PARC_MDS_FAM)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Boa Vista, Grupos Tradicionais e Específicos",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 12),
        axis.title.y = element_text(face="bold", colour="gray", size = 12),
        legend.title = element_text(face="bold", size = 10)) +
  scale_fill_manual(values = c("#dfedf3",
                               "#bfdce8",
                               "#9fcbdc", 
                               "#7cbad1", 
                               "#54a9c5", 
                               "#1c4a59",
                               "black",
                               "#808080",
                               "#A9A9A9",
                               "#D3D3D3",
                               "#ececec",
                               "#708090")) +
  theme(legend.title=element_blank()) +
  annotate(geom="text", x="2015", y=42000, label="Cores omitidas resultam de poucas ocorrências.",
           color="gray")

