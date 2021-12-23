library(dplyr)
library(readxl)

pop_rua_6_21 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx", 
                          sheet = "06 2021")

count(pop_rua_6_21, POP_RUA)
count(pop_rua_6_21, TEMPO_VIVE_NA_RUA)
count(pop_rua_6_21, CONTATO_PARENTE_FORA_RUAS)
count(pop_rua_6_21, SEXO)
count(pop_rua_6_21, BOLSA_FAMILIA)
count(pop_rua_6_21, GRAU_INSTRUCAO)
count(pop_rua_6_21, COR_RACA)
count(pop_rua_6_21, Faixa_da_renda_familiar_per_capita)

########

pop_rua_5_21 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx", 
                          sheet = "05 2021")

count(pop_rua_5_21, POP_RUA)
count(pop_rua_5_21, TEMPO_VIVE_NA_RUA)
count(pop_rua_5_21, CONTATO_PARENTE_FORA_RUAS)
count(pop_rua_5_21, SEXO)
count(pop_rua_5_21, BOLSA_FAMILIA)
count(pop_rua_5_21, GRAU_INSTRUCAO)
count(pop_rua_5_21, COR_RACA)
count(pop_rua_5_21, Faixa_da_renda_familiar_per_capita)


######


pop_rua_4_21 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx", 
                          sheet = "04 2021")

count(pop_rua_4_21, POP_RUA)
count(pop_rua_4_21, TEMPO_VIVE_NA_RUA)
count(pop_rua_4_21, CONTATO_PARENTE_FORA_RUAS)
count(pop_rua_4_21, SEXO)
count(pop_rua_4_21, BOLSA_FAMILIA)
count(pop_rua_4_21, GRAU_INSTRUCAO)
count(pop_rua_4_21, COR_RACA)
count(pop_rua_4_21, Faixa_da_renda_familiar_per_capita)

pop_rua_3_21 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx", 
                          sheet = "03 2021")

count(pop_rua_3_21, POP_RUA)
count(pop_rua_3_21, TEMPO_VIVE_NA_RUA)
count(pop_rua_3_21, CONTATO_PARENTE_FORA_RUAS)
count(pop_rua_3_21, SEXO)
count(pop_rua_3_21, BOLSA_FAMILIA)
count(pop_rua_3_21, GRAU_INSTRUCAO)
count(pop_rua_3_21, COR_RACA)
count(pop_rua_3_21, Faixa_da_renda_familiar_per_capita)

pop_rua_2_21 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx", 
                          sheet = "02 2021")

count(pop_rua_2_21, POP_RUA)
count(pop_rua_2_21, TEMPO_VIVE_NA_RUA)
count(pop_rua_2_21, CONTATO_PARENTE_FORA_RUAS)
count(pop_rua_2_21, SEXO)
count(pop_rua_2_21, BOLSA_FAMILIA)
count(pop_rua_2_21, GRAU_INSTRUCAO)
count(pop_rua_2_21, COR_RACA)
count(pop_rua_2_21, Faixa_da_renda_familiar_per_capita)


pop_rua_1_21 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx", 
                          sheet = "01 2021")

count(pop_rua_1_21, POP_RUA)
count(pop_rua_1_21, TEMPO_VIVE_NA_RUA)
count(pop_rua_1_21, CONTATO_PARENTE_FORA_RUAS)
count(pop_rua_1_21, SEXO)
count(pop_rua_1_21, BOLSA_FAMILIA)
count(pop_rua_1_21, GRAU_INSTRUCAO)
count(pop_rua_1_21, COR_RACA)
count(pop_rua_1_21, Faixa_da_renda_familiar_per_capita)

pop_rua_12_20 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx", 
                          sheet = "12 2020")

count(pop_rua_12_20, POP_RUA)
count(pop_rua_12_20, TEMPO_VIVE_NA_RUA)
count(pop_rua_12_20, CONTATO_PARENTE_FORA_RUAS)
count(pop_rua_12_20, SEXO)
count(pop_rua_12_20, BOLSA_FAMILIA)
count(pop_rua_12_20, GRAU_INSTRUCAO)
count(pop_rua_12_20, COR_RACA)
count(pop_rua_12_20, Faixa_da_renda_familiar_per_capita)


pop_rua_11_20 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx", 
                           sheet = "11 2020")

count(pop_rua_11_20, POP_RUA)
count(pop_rua_11_20, TEMPO_VIVE_NA_RUA)
count(pop_rua_11_20, CONTATO_PARENTE_FORA_RUAS)
count(pop_rua_11_20, SEXO)
count(pop_rua_11_20, BOLSA_FAMILIA)
count(pop_rua_11_20, GRAU_INSTRUCAO)
count(pop_rua_11_20, COR_RACA)
count(pop_rua_11_20, Faixa_da_renda_familiar_per_capita)

pop_rua_10_20 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx", 
                           sheet = "10 2020")

count(pop_rua_10_20, POP_RUA)
count(pop_rua_10_20, TEMPO_VIVE_NA_RUA)
count(pop_rua_10_20, CONTATO_PARENTE_FORA_RUAS)
count(pop_rua_10_20, SEXO)
count(pop_rua_10_20, BOLSA_FAMILIA)
count(pop_rua_10_20, GRAU_INSTRUCAO)
count(pop_rua_10_20, COR_RACA)
count(pop_rua_10_20, Faixa_da_renda_familiar_per_capita)

pop_rua_09_20 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx", 
                           sheet = "09 2020")

count(pop_rua_09_20, POP_RUA)
count(pop_rua_09_20, TEMPO_VIVE_NA_RUA)
count(pop_rua_09_20, CONTATO_PARENTE_FORA_RUAS)
count(pop_rua_09_20, SEXO)
count(pop_rua_09_20, BOLSA_FAMILIA)
count(pop_rua_09_20, GRAU_INSTRUCAO)
count(pop_rua_09_20, COR_RACA)
count(pop_rua_09_20, Faixa_da_renda_familiar_per_capita)

#######

perfil <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                    sheet = "Perfil")
















