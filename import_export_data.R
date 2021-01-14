
library(varhandle) # to unfactor your column types
library(rvest) # to import the table from the Worldometers webpage
library(dplyr) # among other functions, rename()
library(tidyr)

#### First the dataframe 

test <- read_html("https://www.worldometers.info/coronavirus/")
tbls <- html_nodes(test, "table")

tbls_ls <- test %>%
  html_nodes("table") %>%
  html_table(fill = TRUE)

str(tbls_ls)
test2 <- as.data.frame(tbls_ls)

#### Filtering data or subsetting the data.frame

test3 <- unfactor(test2)
dat <- test3[ which(test3$Continent=="Europe"),]

dat <- dat[, -c(1, 17:50), drop = FALSE]
dat <- dat[, -c(16:22), drop = FALSE]

dat1 <- dat%>%rename(c(name = Country.Other,
                       total_cases= TotalCases,
                       new_cases = NewCases,
                       total_deaths = TotalDeaths,
                       new_deaths = NewDeaths,
                       total_recov = TotalRecovered,
                       new_recov = NewRecovered,
                       active_cases = ActiveCases,
                       critical = Serious.Critical,
                       total_per_million = Tot.Cases.1M.pop,
                       deaths_per_million = Deaths.1M.pop,
                       total_tests = TotalTests,
                       tests_per_million = Tests.1M.pop,
                       population = Population,
                       continent = Continent))
class(dat1)
colu <- colnames(dat1) #rownames() for rows

# Removing signs (+, comma etc)
dat1$total_cases <- as.numeric(gsub(",","", dat1$total_cases)) #just one column
dat1[] <- lapply(dat1, gsub, pattern="[\\,+]", replacement="") #https://stackoverflow.com/questions/32857873/remove-a-character-from-the-entire-data-frame

class(dat1)
typeof(dat1)

#Converting factors into appropriate classes for columns with type.convert, package utils
cor_eur <- type.convert(dat1) 

class(cor_eur)
typeof(cor_eur)


library(writexl)
write.csv(cor_eur, "/Users/wemigliari/Documents/R/tabelas/cor_eur.csv")


### Exporting the table to MySQLWorkbench

library(DBI)
library(odbc)

con <- dbConnect(MySQL(), user="root", password="your_password", 
                 dbname="city_time", host="localhost", port=8889)

dbListTables(con) # Checking the tables I have in MysqlWorkbench

my_sql_table <- sqlCreateTable(con, "cor_eur", cor_eur, row.names = NA, temporary = FALSE) #https://rdrr.io/cran/DBI/man/sqlCreateTable.html
odbcDataType(con, my_sql_table)

dbSendQuery(con, "SET GLOBAL local_infile = true;")

dbWriteTable(con, "cor_eur", cor_eur) # Create the structure in your SQL server
dbDisconnect(con) #Disconnect


### Importing the table from MySQLWorkbench

con <- dbConnect(MySQL(),
                 user="root", password="your_password",
                 dbname="city_time", host="localhost", port=8889)


test1 <- dbSendQuery(con, "SELECT * FROM cor_eur;") # Make sure you run a LIMIT if your query is too large
data <- fetch(test1, n = -1)














