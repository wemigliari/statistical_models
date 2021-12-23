library(readxl)
library(dplyr)

table_2012 <- read.table("/Users/wemigliari/Documents/R/tabelas/pop_rua_min_cidades/TB_POP_RUA_201212.csv",
                         header = TRUE,
                         sep = ",")

table_2013 <- read.table("/Users/wemigliari/Documents/R/tabelas/pop_rua_min_cidades/TB_POP_RUA_201312.csv",
                         header = TRUE,
                         sep = ",")

table_2014 <- read.table("/Users/wemigliari/Documents/R/tabelas/pop_rua_min_cidades/TB_POP_RUA_201412.csv",
                         header = TRUE,
                         sep = ",")

table_2015 <- read.table("/Users/wemigliari/Documents/R/tabelas/pop_rua_min_cidades/TB_POP_RUA_201512.csv",
                         header = TRUE,
                         sep = ",")

table_2016 <- read.table("/Users/wemigliari/Documents/R/tabelas/pop_rua_min_cidades/TB_POP_RUA_201612.csv",
                         header = TRUE,
                         sep = ",")

table_2017 <- read.table("/Users/wemigliari/Documents/R/tabelas/pop_rua_min_cidades/TB_POP_RUA_201712.csv",
                         header = TRUE,
                         sep = ",")
table_2018 <- read.table("/Users/wemigliari/Documents/R/tabelas/pop_rua_min_cidades/TB_POP_RUA_201812.csv",
                         header = TRUE,
                         sep = ",")

table_2019 <- read.table("/Users/wemigliari/Documents/R/tabelas/pop_rua_min_cidades/TB_POP_RUA_201912.csv",
                         header = TRUE,
                         sep = ",")
table_2020 <- read.table("/Users/wemigliari/Documents/R/tabelas/pop_rua_min_cidades/TB_POP_RUA_202012.csv",
                         header = TRUE,
                         sep = ",")

library(lubridate)
library(dplyr)
require(data.table)
library(reshape2)

test_2012cad <- data.frame(table(table_2012$CO_EST_CADASTRAL_FAM))
names(test_2012cad)[1:2] <- c("cad_12", "2012")
test_2012acad <- dcast(melt(test_2012cad, id.vars = "cad_12"), variable ~ cad_12)

test_2013cad <- data.frame(table(table_2013$CO_EST_CADASTRAL_FAM))
names(test_2013cad)[1:2] <- c("cad_13", "2013")
test_2013acad <- dcast(melt(test_2013cad, id.vars = "cad_13"), variable ~ cad_13)

test_2014cad <- data.frame(table(table_2014$CO_EST_CADASTRAL_FAM))
names(test_2014cad)[1:2] <- c("cad_14", "2014")
test_2014acad <- dcast(melt(test_2014cad, id.vars = "cad_14"), variable ~ cad_14)

test_2015cad <- data.frame(table(table_2015$CO_EST_CADASTRAL_FAM))
names(test_2015cad)[1:2] <- c("cad_15", "2015")
test_2015acad <- dcast(melt(test_2015cad, id.vars = "cad_15"), variable ~ cad_15)

test_2016cad <- data.frame(table(table_2016$CO_EST_CADASTRAL_FAM))
names(test_2016cad)[1:2] <- c("cad_16", "2016")
test_2016acad <- dcast(melt(test_2016cad, id.vars = "cad_16"), variable ~ cad_16)

test_2017cad <- data.frame(table(table_2017$CO_EST_CADASTRAL_FAM))
names(test_2017cad)[1:2] <- c("cad_17", "2017")
test_2017acad <- dcast(melt(test_2017cad, id.vars = "cad_17"), variable ~ cad_17)

test_2018cad <- data.frame(table(table_2018$CO_EST_CADASTRAL_FAM))
names(test_2018cad)[1:2] <- c("cad_18", "2018")
test_2018acad <- dcast(melt(test_2018cad, id.vars = "cad_18"), variable ~ cad_18)

test_2019cad <- data.frame(table(table_2014$CO_EST_CADASTRAL_FAM))
names(test_2019cad)[1:2] <- c("cad_19", "2019")
test_2019acad <- dcast(melt(test_2019cad, id.vars = "cad_19"), variable ~ cad_19)

test_2020cad <- data.frame(table(table_2020$CO_EST_CADASTRAL_FAM))
names(test_2020cad)[1:2] <- c("cad_20", "2020")
test_2020acad <- dcast(melt(test_2020cad, id.vars = "cad_20"), variable ~ cad_20)

test_sum_cad <- rbind(test_2012acad, test_2013acad, test_2014acad, test_2015acad,
                  test_2016acad, test_2017acad, test_2018acad, test_2020acad)


names(test_sum_cad)[1:5] <- c("Ano","Sem Registro", "Sem Resposta", "Sim", "Não")

library(ggplot2)
library(reshape2)
dd <- melt(test_sum_cad, id.vars="Ano")
names(dd)[2] <- "Cadastro"

# Everything on the same plot
ggplot(dd, aes(Ano,value, col=Cadastro)) + 
  geom_point() + 
  theme(panel.background=element_rect(fill="transparent",colour=NA),
        plot.background=element_rect(fill="transparent",colour=NA),
        legend.key = element_rect(fill = "transparent", colour = "transparent")) +
  labs(title = "População de Rua no Brasil",
       subtitle = "por cadastro",
       y = "",
       x = "") + theme_bw(base_size = 12) +
  labs(caption = "Fonte: Ministério das Cidades/CECAD") 


####

ggplot(dd, aes(Ano, value)) + stat_smooth(aes(group = Cadastro,
                                             colour = Cadastro),
                                         method = "lm", 
                                         formula = y ~ x,
                                         se = FALSE) +
  theme(panel.background=element_rect(fill="transparent",colour=NA),
        plot.background=element_rect(fill="transparent",colour=NA),
        legend.key = element_rect(fill = "transparent", colour = "transparent")) +
  labs(title = "População de Rua no Brasil",
       subtitle = "por cadastro",
       y = "",
       x = "") + theme_bw(base_size = 12) +
  labs(caption = "Fonte: Ministério das Cidades/CECAD") 

# Separate plots
ggplot(dd, aes(Ano,value)) + 
  geom_point() + 
  stat_smooth() +
  facet_wrap(~Cadastro)+
  labs(title = "População de Rua no Brasil",
       subtitle = "por cadastro",
       y = "",
       x = "") + theme_bw(base_size = 12) +
  labs(caption = "Fonte: Ministério das Cidades/CECAD")




