library(readxl)
library(dplyr)
library(ggplot2)
library(reshape2)


perfil <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                    sheet = "Perfil")

min(perfil$Total)
max(perfil$Total)
mean(perfil$Total)

level_order <- factor(perfil$Data, level = c('Set 2020', 'Out 2020', 'Nov 2020', 'Dez 2020', 'Jan 2021', 'Fev 2021', 'Mar 2021', 'Abr 2021', 'Mai 2021', 'Jun 2021'))


ggplot(perfil, aes(x=level_order, y=perfil$Total)) +
  geom_bar(stat="identity", fill=c("darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "black", "black", "darkgray", "darkgray", "darkgray"))+
  labs(title=" ", x =" ", y = "") +
  geom_text(aes(label=perfil$Total), vjust=1.6, color="white", size=3.5)+
  theme_minimal() +
  theme_minimal(base_size = 20)

#### Recebimento do Bolsa Família

library(reshape2)
perfil1 <- data.frame(perfil$Data, perfil$PBF_NAO, perfil$PBF_SIM)

perfil2 <- melt(perfil1, id.vars='perfil.Data')
head(perfil2)

par(mfrow = c(1,1), family= "Arial", cex = 0.5, oma = c(4, 1, 1, 4))

level_order <- factor(perfil2$perfil.Data, level = c('Set 2020', 'Out 2020', 'Nov 2020', 'Dez 2020', 'Jan 2021', 'Fev 2021', 'Mar 2021', 'Abr 2021', 'Mai 2021', 'Jun 2021'))

ggplot(perfil2, aes(x=level_order, y=value, fill=variable)) +
  geom_bar(stat='identity', position='dodge') +
  theme_light(base_size = 13) +
  scale_fill_manual(values=c("black", "darkgray"), 
                    name="Recebimento do Bolsa Família",
                    labels=c("Não", "Sim")) +
  labs(title=" ", x =" ", y = " ") +
  geom_text(aes(label=perfil2$value), position = position_dodge(width= 1), vjust= 1.6, color="white", size = 4.5) +
  theme(axis.text.x = element_text(face="bold", color="black", 
                             size=12)) +
  theme(legend.title = element_text(size=13)) +
  theme(legend.text = element_text(size=13)) +
  theme(legend.position="bottom")

#### Sexo

perfil_sex <- data.frame(perfil$Data, perfil$Feminino, perfil$Masculino)

perfil_sexo <- melt(perfil_sex, id.vars='perfil.Data')
head(perfil_sexo)

level_order <- factor(perfil2$perfil.Data, level = c('Set 2020', 'Out 2020', 'Nov 2020', 'Dez 2020', 'Jan 2021', 'Fev 2021', 'Mar 2021', 'Abr 2021', 'Mai 2021', 'Jun 2021'))

ggplot(perfil2, aes(x=level_order, y=value, fill=variable)) +
  geom_bar(stat='identity', position='dodge') +
  theme_light(base_size = 11) +
  scale_fill_manual(values=c("#7f5200", "gold"), 
                    name="",
                    labels=c("Feminino", "Masculino")) +
  labs(title=" ", x =" ", y = " ") +
  theme(axis.text.x = element_text(face="bold", color="black", 
                                   size=6)) +
  theme(legend.title = element_text(size=8)) +
  theme(legend.text = element_text(size=8)) +
  theme(legend.position="bottom")


##### Contato

perfil_contato <- data.frame(perfil$Data, perfil$Contato_parente_nunca, 
                      perfil$Contato_parente_quase_nunca,
                      perfil$Contato_parente_todo_dia,
                      perfil$Contato_parente_toda_semana,
                      perfil$Contato_parente_todo_mes,
                      perfil$Contato_parente__todo_ano)

perfil_contato2 <- melt(perfil_contato, id.vars='perfil.Data')
head(perfil_contato2)

level_order <- factor(perfil_contato2$perfil.Data, level = c('Set 2020', 'Out 2020', 'Nov 2020', 'Dez 2020', 'Jan 2021', 'Fev 2021', 'Mar 2021', 'Abr 2021', 'Mai 2021', 'Jun 2021'))

ggplot(perfil_contato2, aes(x=level_order, y=value, fill=variable)) +
  geom_bar(position="stack", stat="identity") +
  theme_light(base_size = 11) +
  scale_fill_manual(values=c("#4c3100", "#7f5200", "#cc8400", "#ffa500", "#ffc04c", "#ffdb99"), 
                    name="",
                    labels=c("Nunca", "Quase Nunca", "Todo Dia", "Toda Semana", "Toda Semana", "Todo mês", "Todo Ano")) +
  labs(title=" ", x =" ", y = " ") +
  theme(axis.text.x = element_text(face="bold", color="black", 
                                   size=6)) +
  theme(legend.title = element_text(size=8)) +
  theme(legend.text = element_text(size=8)) +
  theme(legend.position="bottom")

##### Escolaridade

perfil_escola <- data.frame(perfil$Data, perfil$Fundam_incomp, 
                             perfil$Fundam_completo,
                             perfil$Medio_incomp,
                             perfil$Medio_comp,
                             perfil$Superior_incompl_ou_mais,
                             perfil$Sem_instrucao,
                             perfil$Nao_informado)

perfil_escola2 <- melt(perfil_escola, id.vars='perfil.Data')
head(perfil_escola2)

level_order <- factor(perfil_escola2$perfil.Data, level = c('Set 2020', 'Out 2020', 'Nov 2020', 'Dez 2020', 'Jan 2021', 'Fev 2021', 'Mar 2021', 'Abr 2021', 'Mai 2021', 'Jun 2021'))

ggplot(perfil_escola2, aes(x=level_order, y=value, fill=variable)) +
  geom_bar(position="stack", stat="identity") +
  theme_light(base_size = 11) +
  scale_fill_manual(values=c("#ffedcc", "#ffdb99", "#ffc04c", "#ffa500", "#cc8400", "#7f5200", "#4c3100"), 
                    name="",
                    labels=c("Fundamental Incompleto", "Fundamental Completo", "Médio Incompleto", "Médio Completo", "Sem Instrução", "Superior Incompleto", "Não Informado")) +
  labs(title=" ", x =" ", y = " ") +
  theme(axis.text.x = element_text(face="bold", color="black", 
                                   size=6)) +
  theme(legend.title = element_text(size=8)) +
  theme(legend.text = element_text(size=8)) +
  theme(legend.position="bottom")


##### Cor

perfil_cor <- data.frame(perfil$Data, perfil$amarela, 
                            perfil$branca,
                            perfil$indigena,
                            perfil$parda,
                            perfil$preta,
                            perfil$nao_informado)

perfil_cor2 <- melt(perfil_cor, id.vars='perfil.Data')
head(perfil_cor2)

level_order <- factor(perfil_cor2$perfil.Data, level = c('Set 2020', 'Out 2020', 'Nov 2020', 'Dez 2020', 'Jan 2021', 'Fev 2021', 'Mar 2021', 'Abr 2021', 'Mai 2021', 'Jun 2021'))

ggplot(perfil_cor2, aes(x=level_order, y=value, fill=variable)) +
  geom_bar(position="stack", stat="identity") +
  theme_light(base_size = 11) +
  scale_fill_manual(values=c("gold", "#7f5200", "#ffa500", "#cc8400", "#ffc04c", "#4c3100"), 
                    name="",
                    labels=c("Amarela", "Branca", "Indígena", "Parda", "Preta", "Não Informado")) +
  labs(title=" ", x =" ", y = " ") +
  theme(axis.text.x = element_text(face="bold", color="black", 
                                   size=6)) +
  theme(legend.title = element_text(size=8)) +
  theme(legend.text = element_text(size=8)) +
  theme(legend.position="bottom")

ggplot(perfil_cor2, aes(x=level_order, y=value, fill=variable)) +
  geom_bar(position="stack", stat="identity") +
  theme_light(base_size = 11) +
  scale_fill_manual(values=c("red", "#808080", "gold", "#a9a9a9", "#dcdcdc", "#4c3100"), 
                    name="",
                    labels=c("Amarela", "Branca", "Indígena", "Parda", "Preta", "Não Informado")) +
  labs(title=" ", x =" ", y = " ") +
  theme(axis.text.x = element_text(face="bold", color="black", 
                                   size=12)) +
  theme(legend.title = element_text(size=12)) +
  theme(legend.text = element_text(size=12)) +
  theme(legend.position="bottom")

##### Renda

perfil_renda <- data.frame(perfil$Data, perfil$ate_89_reais,
                           perfil$entre_89_178,
                           perfil$entre_178.01_ate_0.5_sal_min,
                           perfil$acima_0.5_sal_min)

perfil_renda2 <- melt(perfil_renda, id.vars='perfil.Data')
head(perfil_renda2)

level_order <- factor(perfil_renda2$perfil.Data, level = c('Set 2020', 'Out 2020', 'Nov 2020', 'Dez 2020', 'Jan 2021', 'Fev 2021', 'Mar 2021', 'Abr 2021', 'Mai 2021', 'Jun 2021'))

ggplot(perfil_renda2, aes(x=level_order, y=value, fill=variable)) +
  geom_bar(position="stack", stat="identity") +
  theme_light(base_size = 11) +
  scale_fill_manual(values=c("gold", "#ffa500", "#cc8400", "#ffc04c"), 
                    name="",
                    labels=c("Até 89 Reais", "De 89 a 178 Reais", "De 178 a 0.5 Salário Mínimo", "Acima de 0.5 Salário Mínimo")) +
  labs(title=" ", x =" ", y = " ") +
  theme(axis.text.x = element_text(face="bold", color="black", 
                                   size=6)) +
  theme(legend.title = element_text(size=8)) +
  theme(legend.text = element_text(size=8)) +
  theme(legend.position="bottom")

