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
  ggplot(aes(x=Ano, y=Macapá)) +
  geom_line( color="grey") +
  geom_point(shape=21, color="black", fill="#69b3a2", size=3) +
  theme_ipsum() +
  ggtitle("População em Situação de Rua no Município de Macapá, 2012-2021") +
  labs(x ="", y = "Pessoas em Situação de Rua em Macapá",
       subtitle = "Série Histórica, Ministério da Cidadania",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0))) +
  geom_label_repel(aes(label = Belo.Horizonte),
                   box.padding   = 0.45, 
                   point.padding = 0.9,
                   size= 3,
                   segment.color = 'grey50') 

###### Auxílio Brasil

macapa_totais_2021_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2021.xlsx", 
                                   sheet="Bolsa Família")
macapa_totais_2021_bf  <- data.frame(macapa_totais_2021_bf)
macapa_totais_2021_bf$...1 <- NULL
macapa_totais_2021_bf$Ano <- "2021"
names(macapa_totais_2021_bf)[1] <- "MARC_PBF"

macapa_totais_2020_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2020.xlsx", 
                                   sheet="Bolsa Família")
macapa_totais_2020_bf  <- data.frame(macapa_totais_2020_bf)
macapa_totais_2020_bf$...1 <- NULL
macapa_totais_2020_bf$Ano <- "2020"

macapa_totais_2019_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2019.xlsx", 
                                   sheet="Bolsa Família")
macapa_totais_2019_bf  <- data.frame(macapa_totais_2019_bf)
macapa_totais_2019_bf$...1 <- NULL
macapa_totais_2019_bf$Ano <- "2019"

macapa_totais_2018_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2018.xlsx", 
                                   sheet="Bolsa Família")
macapa_totais_2018_bf  <- data.frame(macapa_totais_2018_bf)
macapa_totais_2018_bf$...1 <- NULL
macapa_totais_2018_bf$Ano <- "2018"


macapa_totais_2017_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2017.xlsx", 
                                   sheet="Bolsa Família")
macapa_totais_2017_bf  <- data.frame(macapa_totais_2017_bf)
macapa_totais_2017_bf$...1 <- NULL
macapa_totais_2017_bf$Ano <- "2017"

macapa_totais_2016_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2016.xlsx", 
                                   sheet="Bolsa Família")
macapa_totais_2016_bf  <- data.frame(macapa_totais_2016_bf)
macapa_totais_2016_bf$...1 <- NULL
macapa_totais_2016_bf$Ano <- "2016"

macapa_totais_2015_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2015.xlsx", 
                                   sheet="Bolsa Família")
macapa_totais_2015_bf  <- data.frame(macapa_totais_2015_bf)
macapa_totais_2015_bf$...1 <- NULL
macapa_totais_2015_bf$Ano <- "2015"

macapa_totais_2014_bf <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2014.xlsx", 
                                   sheet="Bolsa Família")
macapa_totais_2014_bf  <- data.frame(macapa_totais_2014_bf)
macapa_totais_2014_bf$...1 <- NULL
macapa_totais_2014_bf$Ano <- "2014"


serie_historica_bf <- rbind(macapa_totais_2021_bf, 
                               macapa_totais_2020_bf, 
                               macapa_totais_2019_bf,
                               macapa_totais_2018_bf,
                               macapa_totais_2017_bf,
                               macapa_totais_2016_bf,
                               macapa_totais_2015_bf,
                               macapa_totais_2014_bf
                               )

write_xlsx(serie_historica_bf, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/serie_historica_bf.xlsx")

ggplot(serie_historica_bf, aes(x = Ano, y = freq, fill = MARC_PBF)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá, Bolsa Família/Auxílio Brasil",
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

macapa_totais_2021_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2021.xlsx", 
                                   sheet="Cor")
macapa_totais_2021_cor  <- data.frame(macapa_totais_2021_cor)
macapa_totais_2021_cor$...1 <- NULL
macapa_totais_2021_cor$Ano <- "2021"

macapa_totais_2020_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2020.xlsx", 
                                   sheet="Cor")
macapa_totais_2020_cor  <- data.frame(macapa_totais_2020_cor)
macapa_totais_2020_cor$...1 <- NULL
macapa_totais_2020_cor$Ano <- "2020"

macapa_totais_2019_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2019.xlsx", 
                                   sheet="Cor")
macapa_totais_2019_cor  <- data.frame(macapa_totais_2019_cor)
macapa_totais_2019_cor$...1 <- NULL
macapa_totais_2019_cor$Ano <- "2019"

macapa_totais_2018_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2018.xlsx", 
                                   sheet="Cor")
macapa_totais_2018_cor  <- data.frame(macapa_totais_2018_cor)
macapa_totais_2018_cor$...1 <- NULL
macapa_totais_2018_cor$Ano <- "2018"


macapa_totais_2017_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2017.xlsx", 
                                   sheet="Cor")
macapa_totais_2017_cor  <- data.frame(macapa_totais_2017_cor)
macapa_totais_2017_cor$...1 <- NULL
macapa_totais_2017_cor$Ano <- "2017"

macapa_totais_2016_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2016.xlsx", 
                                   sheet="Cor")
macapa_totais_2016_cor  <- data.frame(macapa_totais_2016_cor)
macapa_totais_2016_cor$...1 <- NULL
macapa_totais_2016_cor$Ano <- "2016"

macapa_totais_2015_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2015.xlsx", 
                                   sheet="Cor")
macapa_totais_2015_cor  <- data.frame(macapa_totais_2015_cor)
macapa_totais_2015_cor$...1 <- NULL
macapa_totais_2015_cor$Ano <- "2015"

macapa_totais_2014_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2014.xlsx", 
                                   sheet="Cor")
macapa_totais_2014_cor  <- data.frame(macapa_totais_2014_cor)
macapa_totais_2014_cor$...1 <- NULL
macapa_totais_2014_cor$Ano <- "2014"

macapa_totais_2013_cor <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2013.xlsx", 
                                   sheet="Cor")

serie_historica_cor <- rbind(macapa_totais_2021_cor, 
                               macapa_totais_2020_cor, 
                               macapa_totais_2019_cor,
                               macapa_totais_2018_cor,
                               macapa_totais_2017_cor,
                               macapa_totais_2016_cor,
                               macapa_totais_2015_cor,
                               macapa_totais_2014_cor)

write_xlsx(serie_historica_cor, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/serie_historica_cor.xlsx")


ggplot(serie_historica_cor, aes(x = Ano, y = freq, fill = CO_RACA_COR_PESSOA)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá por Cor",
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

macapa_totais_2021_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2021.xlsx", 
                                sheet="Sexo")
macapa_totais_2021_sexo  <- data.frame(macapa_totais_2021_sexo)
macapa_totais_2021_sexo$...1 <- NULL
macapa_totais_2021_sexo$Ano <- "2021"

macapa_totais_2020_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2020.xlsx", 
                                  sheet="Sexo")
macapa_totais_2020_sexo  <- data.frame(macapa_totais_2020_sexo)
macapa_totais_2020_sexo$...1 <- NULL
macapa_totais_2020_sexo$Ano <- "2020"

macapa_totais_2019_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2019.xlsx", 
                                  sheet="Sexo")
macapa_totais_2019_sexo  <- data.frame(macapa_totais_2019_sexo)
macapa_totais_2019_sexo$...1 <- NULL
macapa_totais_2019_sexo$Ano <- "2019"

macapa_totais_2018_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2018.xlsx", 
                                  sheet="Sexo")
macapa_totais_2018_sexo  <- data.frame(macapa_totais_2018_sexo)
macapa_totais_2018_sexo$...1 <- NULL
macapa_totais_2018_sexo$Ano <- "2018"


macapa_totais_2017_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2017.xlsx", 
                                  sheet="Sexo")
macapa_totais_2017_sexo  <- data.frame(macapa_totais_2017_sexo)
macapa_totais_2017_sexo$...1 <- NULL
macapa_totais_2017_sexo$Ano <- "2017"

macapa_totais_2016_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2016.xlsx", 
                                  sheet="Sexo")
macapa_totais_2016_sexo  <- data.frame(macapa_totais_2016_sexo)
macapa_totais_2016_sexo$...1 <- NULL
macapa_totais_2016_sexo$Ano <- "2016"

macapa_totais_2015_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2015.xlsx", 
                                  sheet="Sexo")
macapa_totais_2015_sexo  <- data.frame(macapa_totais_2015_sexo)
macapa_totais_2015_sexo$...1 <- NULL
macapa_totais_2015_sexo$Ano <- "2015"

macapa_totais_2014_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2014.xlsx", 
                                  sheet="Sexo")
macapa_totais_2014_sexo  <- data.frame(macapa_totais_2014_sexo)
macapa_totais_2014_sexo$...1 <- NULL
macapa_totais_2014_sexo$Ano <- "2014"

macapa_totais_2013_sexo <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2013.xlsx", 
                                  sheet="Sexo")
macapa_totais_2013_sexo  <- data.frame(macapa_totais_2013_sexo)
macapa_totais_2013_sexo$...1 <- NULL
macapa_totais_2013_sexo$Ano <- "2013"

serie_historica_sexo <- rbind(macapa_totais_2021_sexo, 
                              macapa_totais_2020_sexo, 
                              macapa_totais_2019_sexo,
                              macapa_totais_2018_sexo,
                              macapa_totais_2017_sexo,
                              macapa_totais_2016_sexo,
                              macapa_totais_2015_sexo,
                              macapa_totais_2014_sexo)

write.xlsx(serie_historica_sexo, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/serie_historica_sexo.xlsx")

# Plot

ggplot(data = serie_historica_sexo, aes(x = Ano, y = freq, fill = CO_SEXO_PESSOA)) +
  geom_bar(stat = "identity", position = position_dodge(), alpha = 0.85)  +
  geom_text(
    aes(label = freq),
    colour = c("#808080"), size = 2.3,
    vjust = 1.7, position = position_dodge(.9)
  ) +
  labs(x ="", y = "Pessoas em Situação de Rua",
       subtitle = "Sexo Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá por Sexo",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(axis.title.y = element_text(margin = margin(t = 5, r = 20, b = 5, l = 5))) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="gray", size = 15),
        axis.title.y = element_text(face="bold", colour="gray", size = 15),
        legend.title = element_text(face="bold", size = 10)) +
  scale_fill_manual("", values = c("Feminino" = "#DCDCDC", "Masculino" = "#2F4F4F"))

###### Renda

macapa_totais_2021_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2021.xlsx", 
                                   sheet="Renda")
macapa_totais_2021_renda  <- data.frame(macapa_totais_2021_renda)
macapa_totais_2021_renda$...1 <- NULL
macapa_totais_2021_renda$Ano <- "2021"

macapa_totais_2020_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2020.xlsx", 
                                   sheet="Renda")
macapa_totais_2020_renda  <- data.frame(macapa_totais_2020_renda)
macapa_totais_2020_renda$...1 <- NULL
macapa_totais_2020_renda$Ano <- "2020"

macapa_totais_2019_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2019.xlsx", 
                                   sheet="Renda")
macapa_totais_2019_renda  <- data.frame(macapa_totais_2019_renda)
macapa_totais_2019_renda$...1 <- NULL
macapa_totais_2019_renda$Ano <- "2019"

macapa_totais_2018_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2018.xlsx", 
                                   sheet="Renda")
macapa_totais_2018_renda  <- data.frame(macapa_totais_2018_renda)
macapa_totais_2018_renda$...1 <- NULL
macapa_totais_2018_renda$Ano <- "2018"

macapa_totais_2017_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2017.xlsx", 
                                   sheet="Renda")
macapa_totais_2017_renda  <- data.frame(macapa_totais_2017_renda)
macapa_totais_2017_renda$...1 <- NULL
macapa_totais_2017_renda$Ano <- "2017"

macapa_totais_2016_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2016.xlsx", 
                                   sheet="Renda")
macapa_totais_2016_renda  <- data.frame(macapa_totais_2016_renda)
macapa_totais_2016_renda$...1 <- NULL
macapa_totais_2016_renda$Ano <- "2016"

macapa_totais_2015_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2015.xlsx", 
                                   sheet="Renda")
macapa_totais_2015_renda  <- data.frame(macapa_totais_2015_renda)
macapa_totais_2015_renda$...1 <- NULL
macapa_totais_2015_renda$Ano <- "2015"

macapa_totais_2014_renda <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2014.xlsx", 
                                   sheet="Renda")
macapa_totais_2014_renda  <- data.frame(macapa_totais_2014_renda)
macapa_totais_2014_renda$...1 <- NULL
macapa_totais_2014_renda$Ano <- "2014"

serie_historica_renda <- rbind(macapa_totais_2021_renda, 
                               macapa_totais_2020_renda, 
                               macapa_totais_2019_renda,
                               macapa_totais_2018_renda,
                               macapa_totais_2017_renda,
                               macapa_totais_2016_renda,
                               macapa_totais_2015_renda,
                               macapa_totais_2014_renda)

write.xlsx(serie_historica_renda, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/serie_historica_renda.xlsx")


#Plot


ggplot(serie_historica_renda, aes(x = Ano, y = freq, fill = FX_RENDA)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá por Renda",
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

macapa_totais_2021_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2021.xlsx", 
                                   sheet="Idade")
macapa_totais_2021_idade  <- data.frame(macapa_totais_2021_idade)
macapa_totais_2021_idade$...1 <- NULL
macapa_totais_2021_idade$Ano <- "2021"

macapa_totais_2020_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2020.xlsx", 
                                   sheet="Idade")
macapa_totais_2020_idade  <- data.frame(macapa_totais_2020_idade)
macapa_totais_2020_idade$...1 <- NULL
macapa_totais_2020_idade$Ano <- "2020"

macapa_totais_2019_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2019.xlsx", 
                                   sheet="Idade")
macapa_totais_2019_idade  <- data.frame(macapa_totais_2019_idade)
macapa_totais_2019_idade$...1 <- NULL
macapa_totais_2019_idade$Ano <- "2019"

macapa_totais_2018_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2018.xlsx", 
                                   sheet="Idade")
macapa_totais_2018_idade  <- data.frame(macapa_totais_2018_idade)
macapa_totais_2018_idade$...1 <- NULL
macapa_totais_2018_idade$Ano <- "2018"

macapa_totais_2017_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2017.xlsx", 
                                   sheet="Idade")
macapa_totais_2017_idade  <- data.frame(macapa_totais_2017_idade)
macapa_totais_2017_idade$...1 <- NULL
macapa_totais_2017_idade$Ano <- "2017"

macapa_totais_2016_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2016.xlsx", 
                                   sheet="Idade")
macapa_totais_2016_idade  <- data.frame(macapa_totais_2016_idade)
macapa_totais_2016_idade$...1 <- NULL
macapa_totais_2016_idade$Ano <- "2016"

macapa_totais_2015_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2015.xlsx", 
                                   sheet="Idade")
macapa_totais_2015_idade  <- data.frame(macapa_totais_2015_idade)
macapa_totais_2015_idade$...1 <- NULL
macapa_totais_2015_idade$Ano <- "2015"

macapa_totais_2014_idade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2014.xlsx", 
                                   sheet="Idade")
macapa_totais_2014_idade  <- data.frame(macapa_totais_2014_idade)
macapa_totais_2014_idade$...1 <- NULL
macapa_totais_2014_idade$Ano <- "2014"


serie_historica_idade <- rbind(macapa_totais_2021_idade, 
                               macapa_totais_2020_idade, 
                               macapa_totais_2019_idade,
                               macapa_totais_2018_idade,
                               macapa_totais_2017_idade,
                               macapa_totais_2016_idade,
                               macapa_totais_2015_idade,
                               macapa_totais_2014_idade)

write_xlsx(serie_historica_idade, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/serie_historica_idade.xlsx")

#Idade

ggplot(serie_historica_idade, aes(x = Ano, y = freq, fill = FX_ETARIA)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá por Idade",
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

macapa_totais_2021_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2021.xlsx", 
                                sheet="Instrução")
macapa_totais_2021_escolaridade <- data.frame(macapa_totais_2021_escolaridade)
macapa_totais_2021_escolaridade$...1 <- NULL
macapa_totais_2021_escolaridade$Ano <- "2021"

macapa_totais_2020_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2020.xlsx", 
                                          sheet="Instrução")
macapa_totais_2020_escolaridade <- data.frame(macapa_totais_2020_escolaridade)
macapa_totais_2020_escolaridade$...1 <- NULL
macapa_totais_2020_escolaridade$Ano <- "2020"


macapa_totais_2019_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2019.xlsx", 
                                          sheet="Instrução")
macapa_totais_2019_escolaridade <- data.frame(macapa_totais_2019_escolaridade)
macapa_totais_2019_escolaridade$...1 <- NULL
macapa_totais_2019_escolaridade$Ano <- "2019"

macapa_totais_2018_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2018.xlsx", 
                                          sheet="Instrução")
macapa_totais_2018_escolaridade <- data.frame(macapa_totais_2018_escolaridade)
macapa_totais_2018_escolaridade$...1 <- NULL
macapa_totais_2018_escolaridade$Ano <- "2018"

macapa_totais_2017_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2017.xlsx", 
                                          sheet="Instrução")
macapa_totais_2017_escolaridade <- data.frame(macapa_totais_2017_escolaridade)
macapa_totais_2017_escolaridade$...1 <- NULL
macapa_totais_2017_escolaridade$Ano <- "2017"

macapa_totais_2016_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2016.xlsx", 
                                          sheet="Instrução")
macapa_totais_2016_escolaridade <- data.frame(macapa_totais_2016_escolaridade)
macapa_totais_2016_escolaridade$...1 <- NULL
macapa_totais_2016_escolaridade$Ano <- "2016"

macapa_totais_2015_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2015.xlsx", 
                                          sheet="Instrução")
macapa_totais_2015_escolaridade <- data.frame(macapa_totais_2015_escolaridade)
macapa_totais_2015_escolaridade$...1 <- NULL
macapa_totais_2015_escolaridade$Ano <- "2015"

macapa_totais_2014_escolaridade <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2014.xlsx", 
                                          sheet="Instrução")
macapa_totais_2014_escolaridade <- data.frame(macapa_totais_2014_escolaridade)
macapa_totais_2014_escolaridade$...1 <- NULL
macapa_totais_2014_escolaridade$Ano <- "2014"


serie_historica_escolaridade <- rbind(macapa_totais_2021_escolaridade, 
                               macapa_totais_2020_escolaridade, 
                               macapa_totais_2019_escolaridade,
                               macapa_totais_2018_escolaridade,
                               macapa_totais_2017_escolaridade,
                               macapa_totais_2016_escolaridade,
                               macapa_totais_2015_escolaridade,
                               macapa_totais_2014_escolaridade)

write.xlsx(serie_historica_escolaridade, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/serie_historica_escolaridade.xlsx")


ggplot(serie_historica_escolaridade, aes(x = Ano, y = freq, fill = GRAU_INSTRUCAO)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá por Escolaridade",
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

macapa_totais_2021_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2021.xlsx", 
                                          sheet="Ler & Escrever")
macapa_totais_2021_ler_escrever <- data.frame(macapa_totais_2021_ler_escrever )
macapa_totais_2021_ler_escrever$...1 <- NULL
macapa_totais_2021_ler_escrever$Ano <- "2021"


macapa_totais_2020_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2020.xlsx", 
                                          sheet="Ler & Escrever")
macapa_totais_2020_ler_escrever <- data.frame(macapa_totais_2020_ler_escrever )
macapa_totais_2020_ler_escrever$...1 <- NULL
macapa_totais_2020_ler_escrever$Ano <- "2020"


macapa_totais_2019_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2019.xlsx", 
                                          sheet="Ler & Escrever")
macapa_totais_2019_ler_escrever <- data.frame(macapa_totais_2019_ler_escrever )
macapa_totais_2019_ler_escrever$...1 <- NULL
macapa_totais_2019_ler_escrever$Ano <- "2019"


macapa_totais_2018_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2018.xlsx", 
                                          sheet="Ler & Escrever")
macapa_totais_2018_ler_escrever <- data.frame(macapa_totais_2018_ler_escrever )
macapa_totais_2018_ler_escrever$...1 <- NULL
macapa_totais_2018_ler_escrever$Ano <- "2018"


macapa_totais_2017_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2017.xlsx", 
                                          sheet="Ler & Escrever")
macapa_totais_2017_ler_escrever <- data.frame(macapa_totais_2017_ler_escrever )
macapa_totais_2017_ler_escrever$...1 <- NULL
macapa_totais_2017_ler_escrever$Ano <- "2017"


macapa_totais_2016_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2016.xlsx", 
                                          sheet="Ler & Escrever")
macapa_totais_2016_ler_escrever <- data.frame(macapa_totais_2016_ler_escrever )
macapa_totais_2016_ler_escrever$...1 <- NULL
macapa_totais_2016_ler_escrever$Ano <- "2016"


macapa_totais_2015_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2015.xlsx", 
                                          sheet="Ler & Escrever")
macapa_totais_2015_ler_escrever <- data.frame(macapa_totais_2015_ler_escrever )
macapa_totais_2015_ler_escrever$...1 <- NULL
macapa_totais_2015_ler_escrever$Ano <- "2015"


macapa_totais_2014_ler_escrever <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2014.xlsx", 
                                          sheet="Ler & Escrever")
macapa_totais_2014_ler_escrever <- data.frame(macapa_totais_2014_ler_escrever )
macapa_totais_2014_ler_escrever$...1 <- NULL
macapa_totais_2014_ler_escrever$Ano <- "2014"


serie_historica_ler_escrever <- rbind(macapa_totais_2021_ler_escrever, 
                                      macapa_totais_2020_ler_escrever, 
                                      macapa_totais_2019_ler_escrever,
                                      macapa_totais_2018_ler_escrever,
                                      macapa_totais_2017_ler_escrever,
                                      macapa_totais_2016_ler_escrever,
                                      macapa_totais_2015_ler_escrever,
                                      macapa_totais_2014_ler_escrever)

write.xlsx(serie_historica_ler_escrever, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/serie_historica_ler_escrever.xlsx")


ggplot(serie_historica_ler_escrever, aes(x = Ano, y = freq, fill = CO_SABE_LER_ESCREVER_MEMB)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá, Saber Ler & Escrever",
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

macapa_totais_2021_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2021.xlsx", 
                                sheet="Atualização")
macapa_totais_2021_atua_cadas   <- data.frame(macapa_totais_2021_atua_cadas)
macapa_totais_2021_atua_cadas$...1 <- NULL
macapa_totais_2021_atua_cadas$Ano <- "2021"
macapa_totais_2021_atua_cadas$Min <- min(macapa_totais_2021_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
macapa_totais_2021_atua_cadas$Max <- max(macapa_totais_2021_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)

macapa_totais_2020_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2020.xlsx", 
                                        sheet="Atualização")
macapa_totais_2020_atua_cadas   <- data.frame(macapa_totais_2020_atua_cadas)
macapa_totais_2020_atua_cadas$...1 <- NULL
macapa_totais_2020_atua_cadas$Ano <- "2020"
macapa_totais_2020_atua_cadas$Min <- min(macapa_totais_2020_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
macapa_totais_2020_atua_cadas$Max <- max(macapa_totais_2020_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)


macapa_totais_2019_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2019.xlsx", 
                                        sheet="Atualização")
macapa_totais_2019_atua_cadas   <- data.frame(macapa_totais_2019_atua_cadas)
macapa_totais_2019_atua_cadas$...1 <- NULL
macapa_totais_2019_atua_cadas$Ano <- "2019"
macapa_totais_2019_atua_cadas$Min <- min(macapa_totais_2019_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
macapa_totais_2019_atua_cadas$Max <- max(macapa_totais_2019_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)



macapa_totais_2018_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2018.xlsx", 
                                        sheet="Atualização")
macapa_totais_2018_atua_cadas   <- data.frame(macapa_totais_2018_atua_cadas)
macapa_totais_2018_atua_cadas$...1 <- NULL
macapa_totais_2018_atua_cadas$Ano <- "2018"
macapa_totais_2018_atua_cadas$Min <- min(macapa_totais_2018_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
macapa_totais_2018_atua_cadas$Max <- max(macapa_totais_2018_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)


macapa_totais_2017_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2017.xlsx", 
                                        sheet="Atualização")
macapa_totais_2017_atua_cadas   <- data.frame(macapa_totais_2017_atua_cadas)
macapa_totais_2017_atua_cadas$...1 <- NULL
macapa_totais_2017_atua_cadas$Ano <- "2017"
macapa_totais_2017_atua_cadas$Min <- min(macapa_totais_2017_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
macapa_totais_2017_atua_cadas$Max <- max(macapa_totais_2017_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)


macapa_totais_2016_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2016.xlsx", 
                                        sheet="Atualização")
macapa_totais_2016_atua_cadas   <- data.frame(macapa_totais_2016_atua_cadas)
macapa_totais_2016_atua_cadas$...1 <- NULL
macapa_totais_2016_atua_cadas$Ano <- "2016"
macapa_totais_2016_atua_cadas$Min <- min(macapa_totais_2016_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
macapa_totais_2016_atua_cadas$Max <- max(macapa_totais_2016_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)


macapa_totais_2015_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2015.xlsx", 
                                        sheet="Atualização")
macapa_totais_2015_atua_cadas   <- data.frame(macapa_totais_2015_atua_cadas)
macapa_totais_2015_atua_cadas$...1 <- NULL
macapa_totais_2015_atua_cadas$Ano <- "2015"
macapa_totais_2015_atua_cadas$Min <- min(macapa_totais_2015_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
macapa_totais_2015_atua_cadas$Max <- max(macapa_totais_2015_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)


macapa_totais_2014_atua_cadas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2014.xlsx", 
                                        sheet="Atualização")
macapa_totais_2014_atua_cadas   <- data.frame(macapa_totais_2014_atua_cadas)
macapa_totais_2014_atua_cadas$...1 <- NULL
macapa_totais_2014_atua_cadas$Ano <- "2014"
macapa_totais_2014_atua_cadas$Min <- min(macapa_totais_2014_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)
macapa_totais_2014_atua_cadas$Max <- max(macapa_totais_2014_atua_cadas$MESES_APOS_ULT_ATUALIZACAO)


serie_historica_cadastro <- rbind(macapa_totais_2021_atua_cadas, 
                                      macapa_totais_2020_atua_cadas, 
                                      macapa_totais_2019_atua_cadas,
                                      macapa_totais_2018_atua_cadas,
                                      macapa_totais_2017_atua_cadas,
                                      macapa_totais_2016_atua_cadas,
                                      macapa_totais_2015_atua_cadas,
                                      macapa_totais_2014_atua_cadas)

write.xlsx(serie_historica_cadastro, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/serie_historica_cadastro.xlsx")


serie_historica_cadastro$Ano <- as.numeric(serie_historica_cadastro$Ano)

################

library(ggthemes)

ggplot(serie_historica_cadastro, aes(Ano, MESES_APOS_ULT_ATUALIZACAO)) +
  geom_line(aes(group = Max)) +
  geom_point(aes(color = Max), size = 1.5) +
  coord_flip() +
  labs(x ="", y = "Meses Após a Útlima Atualização",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá, Atualização Cadastral",
       caption = "Fonte: Ministério da Cidadania. Elaborado por W. Migliari, 2022.") +
  theme_minimal() +
  theme(legend.position = "none") +
  scale_y_continuous(limits=c(0, 120), breaks=c(0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120))

##

ggplot(serie_historica_cadastro, aes(MESES_APOS_ULT_ATUALIZACAO, freq)) +
  geom_line(aes(group = Ano)) +
  geom_point(aes(color = Ano), size = 2.5, alpha=0.3) +
  labs(x ="", y = "Pessoas em Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá, Atualização Cadastral",
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
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá, Atualização Cadastral",
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

macapa_totais_2021_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2021.xlsx", 
                                        sheet="Indígenas")
macapa_totais_2021_indigenas   <- data.frame(macapa_totais_2021_indigenas)
macapa_totais_2021_indigenas$...1 <- NULL
macapa_totais_2021_indigenas$Ano <- "2021"

macapa_totais_2020_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2020.xlsx", 
                                       sheet="Indígenas")
macapa_totais_2020_indigenas   <- data.frame(macapa_totais_2020_indigenas)
macapa_totais_2020_indigenas$...1 <- NULL
macapa_totais_2020_indigenas$Ano <- "2020"


macapa_totais_2019_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2019.xlsx", 
                                       sheet="Indígenas")
macapa_totais_2019_indigenas   <- data.frame(macapa_totais_2019_indigenas)
macapa_totais_2019_indigenas$...1 <- NULL
macapa_totais_2019_indigenas$Ano <- "2019"


macapa_totais_2018_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2018.xlsx", 
                                       sheet="Indígenas")
macapa_totais_2018_indigenas   <- data.frame(macapa_totais_2018_indigenas)
macapa_totais_2018_indigenas$...1 <- NULL
macapa_totais_2018_indigenas$Ano <- "2018"


macapa_totais_2017_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2017.xlsx", 
                                       sheet="Indígenas")
macapa_totais_2017_indigenas   <- data.frame(macapa_totais_2017_indigenas)
macapa_totais_2017_indigenas$...1 <- NULL
macapa_totais_2017_indigenas$Ano <- "2017"


macapa_totais_2016_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2016.xlsx", 
                                       sheet="Indígenas")
macapa_totais_2016_indigenas   <- data.frame(macapa_totais_2016_indigenas)
macapa_totais_2016_indigenas$...1 <- NULL
macapa_totais_2016_indigenas$Ano <- "2016"


macapa_totais_2015_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2015.xlsx", 
                                       sheet="Indígenas")
macapa_totais_2015_indigenas   <- data.frame(macapa_totais_2015_indigenas)
macapa_totais_2015_indigenas$...1 <- NULL
macapa_totais_2015_indigenas$Ano <- "2015"


macapa_totais_2014_indigenas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2014.xlsx", 
                                       sheet="Indígenas")
macapa_totais_2014_indigenas   <- data.frame(macapa_totais_2014_indigenas)
macapa_totais_2014_indigenas$...1 <- NULL
macapa_totais_2014_indigenas$Ano <- "2014"


serie_historica_indigenas <- rbind(macapa_totais_2021_indigenas, 
                                      macapa_totais_2020_indigenas, 
                                      macapa_totais_2019_indigenas,
                                      macapa_totais_2018_indigenas,
                                      macapa_totais_2017_indigenas,
                                      macapa_totais_2016_indigenas,
                                      macapa_totais_2015_indigenas,
                                      macapa_totais_2014_indigenas)


write.xlsx(serie_historica_indigenas, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/serie_historica_indigenas.xlsx")


ggplot(serie_historica_indigenas, aes(x = Ano, y = freq, fill = IN_FAMILIA_INDIGENA_FAM)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá, Indígenas",
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

macapa_totais_2021_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2021.xlsx", 
                                       sheet="Quilombolas")
macapa_totais_2021_quilombolas   <- data.frame(macapa_totais_2021_quilombolas)
macapa_totais_2021_quilombolas$...1 <- NULL
macapa_totais_2021_quilombolas$Ano <- "2021"


macapa_totais_2020_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2020.xlsx", 
                                         sheet="Quilombolas")
macapa_totais_2020_quilombolas   <- data.frame(macapa_totais_2020_quilombolas)
macapa_totais_2020_quilombolas$...1 <- NULL
macapa_totais_2020_quilombolas$Ano <- "2020"


macapa_totais_2019_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2019.xlsx", 
                                         sheet="Quilombolas")
macapa_totais_2019_quilombolas   <- data.frame(macapa_totais_2019_quilombolas)
macapa_totais_2019_quilombolas$...1 <- NULL
macapa_totais_2019_quilombolas$Ano <- "2019"



macapa_totais_2018_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2018.xlsx", 
                                         sheet="Quilombolas")
macapa_totais_2018_quilombolas   <- data.frame(macapa_totais_2018_quilombolas)
macapa_totais_2018_quilombolas$...1 <- NULL
macapa_totais_2018_quilombolas$Ano <- "2018"



macapa_totais_2017_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2017.xlsx", 
                                         sheet="Quilombolas")
macapa_totais_2017_quilombolas   <- data.frame(macapa_totais_2017_quilombolas)
macapa_totais_2017_quilombolas$...1 <- NULL
macapa_totais_2017_quilombolas$Ano <- "2017"


macapa_totais_2016_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2016.xlsx", 
                                         sheet="Quilombolas")
macapa_totais_2016_quilombolas   <- data.frame(macapa_totais_2016_quilombolas)
macapa_totais_2016_quilombolas$...1 <- NULL
macapa_totais_2016_quilombolas$Ano <- "2016"



macapa_totais_2015_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2015.xlsx", 
                                         sheet="Quilombolas")
macapa_totais_2015_quilombolas   <- data.frame(macapa_totais_2015_quilombolas)
macapa_totais_2015_quilombolas$...1 <- NULL
macapa_totais_2015_quilombolas$Ano <- "2015"


macapa_totais_2014_quilombolas <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2014.xlsx", 
                                         sheet="Quilombolas")
macapa_totais_2014_quilombolas   <- data.frame(macapa_totais_2014_quilombolas)
macapa_totais_2014_quilombolas$...1 <- NULL
macapa_totais_2014_quilombolas$Ano <- "2014"


serie_historica_quilombolas <- rbind(macapa_totais_2021_quilombolas, 
                                   macapa_totais_2020_quilombolas, 
                                   macapa_totais_2019_quilombolas,
                                   macapa_totais_2018_quilombolas,
                                   macapa_totais_2017_quilombolas,
                                   macapa_totais_2016_quilombolas,
                                   macapa_totais_2015_quilombolas,
                                   macapa_totais_2014_quilombolas)

write.xlsx(serie_historica_quilombolas, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/serie_historica_quilombolas.xlsx")


ggplot(serie_historica_quilombolas, aes(x = Ano, y = freq, fill = IN_FAMILIA_QUILOMBOLA_FAM)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá Pertencentes a Famílias Quilombolas",
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

macapa_totais_2021_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2021.xlsx", 
                                         sheet="Grupos Tradicionais Específicos")
macapa_totais_2021_gte <- data.frame(macapa_totais_2021_gte )
macapa_totais_2021_gte$...1 <- NULL
macapa_totais_2021_gte$Ano <- "2021"


macapa_totais_2020_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2020.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
macapa_totais_2020_gte <- data.frame(macapa_totais_2020_gte )
macapa_totais_2020_gte$...1 <- NULL
macapa_totais_2020_gte$Ano <- "2020"


macapa_totais_2019_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2019.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
macapa_totais_2019_gte <- data.frame(macapa_totais_2019_gte )
macapa_totais_2019_gte$...1 <- NULL
macapa_totais_2019_gte$Ano <- "2019"


macapa_totais_2018_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2018.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
macapa_totais_2018_gte <- data.frame(macapa_totais_2018_gte )
macapa_totais_2018_gte$...1 <- NULL
macapa_totais_2018_gte$Ano <- "2018"


macapa_totais_2017_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2017.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
macapa_totais_2017_gte <- data.frame(macapa_totais_2017_gte )
macapa_totais_2017_gte$...1 <- NULL
macapa_totais_2017_gte$Ano <- "2017"

macapa_totais_2016_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2016.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
macapa_totais_2016_gte <- data.frame(macapa_totais_2016_gte )
macapa_totais_2016_gte$...1 <- NULL
macapa_totais_2016_gte$Ano <- "2016"


macapa_totais_2015_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2015.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
macapa_totais_2015_gte <- data.frame(macapa_totais_2015_gte )
macapa_totais_2015_gte$...1 <- NULL
macapa_totais_2015_gte$Ano <- "2015"


macapa_totais_2014_gte <- read_excel("/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/2014.xlsx", 
                                 sheet="Grupos Tradicionais Específicos")
macapa_totais_2014_gte <- data.frame(macapa_totais_2014_gte )
macapa_totais_2014_gte$...1 <- NULL
macapa_totais_2014_gte$Ano <- "2014"


serie_historica_gte <- rbind(macapa_totais_2021_gte, 
                                     macapa_totais_2020_gte, 
                                     macapa_totais_2019_gte,
                                     macapa_totais_2018_gte,
                                     macapa_totais_2017_gte,
                                     macapa_totais_2016_gte,
                                     macapa_totais_2015_gte,
                                     macapa_totais_2014_gte)

write.xlsx(serie_historica_gte, "/Users/wemigliari/Documents/R/tabelas/min_cid_observatorio/macapa/serie_historica_gte.xlsx")

ggplot(serie_historica_gte, aes(x = Ano, y = freq, fill = IN_PARC_MDS_FAM)) + 
  geom_bar(stat = "identity") +
  labs(x ="", y = "Pessoas Situação de Rua",
       subtitle = "Série Histórica 2012-2021 de Pessoas em Situação de Rua em Macapá, Grupos Tradicionais e Específicos",
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

