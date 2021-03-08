##### Dashboards

library(broom)
library(writexl)
library(ExPanDaR)
library(dplyr)
library(tibble)


#####

Motors <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/motors.xlsx")

test <- mtcars

test <- rownames_to_column(test, var = "model") %>% as_tibble()

class(test)

Motors <- data.frame(test)

library(ExPanDaR)
ExPanD(Motors, title = "Data Analysis & IoT")

library(broom)
library(writexl)

write_xlsx(Motors, "/Users/wemigliari/Documents/R/tabelas/motors.xlsx")

### Descriptive statistics (n, mean, sd etc)
output_model <- tidy(Motors)

###

test <- Motors

View

test <- model
row.names(test) <- test[,1]
test[,1] <- NULL

test1 <- signif(test, 1)

ExPanD(test1, title = "Data Analysis & IoT")

library(formattable)
test2 <- formattable(test, 1, format = FALSE)


########

library(formattable)
test2 <- formattable(test, 1, format = FALSE)
