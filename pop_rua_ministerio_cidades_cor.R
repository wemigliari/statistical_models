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

test_2012 <- data.frame(table(table_2012$CO_RACA_COR_PESSOA))
names(test_2012)[1:2] <- c("cor_12", "2012")
test_2012a <- dcast(melt(test_2012, id.vars = "cor_12"), variable ~ cor_12)

test_2013 <- data.frame(table(table_2013$CO_RACA_COR_PESSOA))
names(test_2013)[1:2] <- c("cor_13", "2013")
test_2013a <- dcast(melt(test_2013, id.vars = "cor_13"), variable ~ cor_13)

test_2014 <- data.frame(table(table_2014$CO_RACA_COR_PESSOA))
names(test_2014)[1:2] <- c("cor_14", "2014")
test_2014a <- dcast(melt(test_2014, id.vars = "cor_14"), variable ~ cor_14)

test_2015 <- data.frame(table(table_2015$CO_RACA_COR_PESSOA))
names(test_2015)[1:2] <- c("cor_15", "2015")
test_2015a <- dcast(melt(test_2015, id.vars = "cor_15"), variable ~ cor_15)

test_2016 <- data.frame(table(table_2016$CO_RACA_COR_PESSOA))
names(test_2016)[1:2] <- c("cor_16", "2016")
test_2016a <- dcast(melt(test_2016, id.vars = "cor_16"), variable ~ cor_16)

test_2017 <- data.frame(table(table_2017$CO_RACA_COR_PESSOA))
names(test_2017)[1:2] <- c("cor_17", "2017")
test_2017a <- dcast(melt(test_2017, id.vars = "cor_17"), variable ~ cor_17)

test_2018 <- data.frame(table(table_2018$CO_RACA_COR_PESSOA))
names(test_2018)[1:2] <- c("cor_18", "2018")
test_2018a <- dcast(melt(test_2018, id.vars = "cor_18"), variable ~ cor_18)

test_2019 <- data.frame(table(table_2014$CO_RACA_COR_PESSOA))
names(test_2019)[1:2] <- c("cor_19", "2019")
test_2019a <- dcast(melt(test_2019, id.vars = "cor_19"), variable ~ cor_19)

test_2020 <- data.frame(table(table_2020$CO_RACA_COR_PESSOA))
names(test_2020)[1:2] <- c("cor_20", "2020")
test_2020a <- dcast(melt(test_2020, id.vars = "cor_20"), variable ~ cor_20)

test_sum <- rbind(test_2012a, test_2013a, test_2014a, test_2015a,
                  test_2016a, test_2017a, test_2018a, test_2020a)


names(test_sum)[1:6] <- c("Ano", "Branca", "Preta", "Amarela", "Parda", "Indígena")


library(ggplot2)
library(reshape2)
d <- melt(test_sum, id.vars="Ano")
names(d)[2] <- "Cor"

# Everything on the same plot
ggplot(d, aes(Ano,value, col=Cor)) + 
  geom_point() + 
  theme(panel.background=element_rect(fill="transparent",colour=NA),
        plot.background=element_rect(fill="transparent",colour=NA),
        legend.key = element_rect(fill = "transparent", colour = "transparent")) +
  labs(title = "População de Rua no Brasil",
       subtitle = "por cor",
       y = "",
       x = "") + theme_bw(base_size = 12) +
  labs(caption = "Fonte: Ministério das Cidades/CECAD") 


####

ggplot(d, aes(Ano, value)) + stat_smooth(aes(group = Cor,
                                            colour = Cor),
                                            method = "lm", 
                                            formula = y ~ x,
                                            se = FALSE) +
  theme(panel.background=element_rect(fill="transparent",colour=NA),
        plot.background=element_rect(fill="transparent",colour=NA),
        legend.key = element_rect(fill = "transparent", colour = "transparent")) +
  labs(title = "População de Rua no Brasil",
       subtitle = "por cor",
       y = "",
       x = "") + theme_bw(base_size = 12) +
  labs(caption = "Fonte: Ministério das Cidades/CECAD") 

# Separate plots
ggplot(d, aes(Ano,value)) + 
  geom_point() + 
  stat_smooth() +
  facet_wrap(~Cor)+
  labs(title = "População de Rua no Brasil",
       subtitle = "por cor",
       y = "",
       x = "") + theme_bw(base_size = 12) +
  labs(caption = "Fonte: Ministério das Cidades/CECAD")


