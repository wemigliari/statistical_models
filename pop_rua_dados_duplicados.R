library(dplyr)
library(readxl)



duplicados_pop_rua1 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                                 sheet = "09 2020")
duplicados_pop_rua2 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                                  sheet = "10 2020")
duplicados_pop_rua3 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                                  sheet = "11 2020")
duplicados_pop_rua4 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                                  sheet = "12 2020")


duplicados_pop_rua5 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                      sheet = "01 2021")

duplicados_pop_rua6 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                                       sheet = "02 2021")

duplicados_pop_rua7 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                                       sheet = "03 2021")

duplicados_pop_rua8 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                                       sheet = "04 2021")

duplicados_pop_rua9 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                                 sheet = "05 2021")

duplicados_pop_rua10 <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                                 sheet = "06 2021")

nrow(duplicados_pop_rua6)

nrow(duplicados_pop_rua7)

### Other months

nrow(duplicados_pop_rua1)

nrow(duplicados_pop_rua2)

nrow(duplicados_pop_rua3)

nrow(duplicados_pop_rua4)

nrow(duplicados_pop_rua5)

nrow(duplicados_pop_rua8)

nrow(duplicados_pop_rua9)

nrow(duplicados_pop_rua10)


