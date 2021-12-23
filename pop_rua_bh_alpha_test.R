library(readxl)
library(psych)

alpha_test_pop_rua <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx", 
                          sheet = "Total")


class(alpha_test_pop_rua)
alpha_test_pop_rua <- data.frame(alpha_test_pop_rua)
alpha_test_pop_rua <- alpha_test_pop_rua[, -c(1,3)]

alpha_test <- alpha(alpha_test_pop_rua, check.keys=TRUE)
class(test)

test <- data.frame(alpha_test$total, alpha_test$alpha.drop, alpha_test$item.stats)


library("writexl")
write_xlsx(test, "/Users/wemigliari/Documents/R/tabelas/pop_rua_bh_alpha_test.xlsx")



library(ltm)

cronbach.alpha(alpha_test_pop_rua, CI = TRUE)

