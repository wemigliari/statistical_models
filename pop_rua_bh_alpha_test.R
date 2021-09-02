library(readxl)
library(psych)

alpha_test_pop_rua <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx", 
                          sheet = "Total")


class(alpha_test_pop_rua)
alpha_test_pop_rua <- data.frame(alpha_test_pop_rua)
alpha_test_pop_rua <- alpha_test_pop_rua[, -c(1,3)]

alpha(alpha_test_pop_rua, check.keys=TRUE)


library(ltm)

cronbach.alpha(alpha_test_pop_rua, CI = TRUE)

