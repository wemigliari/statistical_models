library(rvest)
library(purrr)
library(DBI)
library(dplyr)
library(varhandle)

#### First the dataframe 

test <- read_html("https://www.worldometers.info/coronavirus/")
tbls <- html_nodes(test, "table")

tbls_ls <- test %>%
  html_nodes("table") %>%
  html_table(fill = TRUE)

str(tbls_ls)
test2 <- as.data.frame(tbls_ls)


#### Filtering data or subsetting data.frame

test3 <- unfactor(test2)
dat <- filter(test3, Continent == "Europe")





