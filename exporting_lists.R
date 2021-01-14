### Exporting the table to MySQLWorkbench

library(DBI)
library(odbc)
library(RMySQL)
library(readxl)
library(rio) #Import list, if you want to. But, sincerely, the method with plyr is better.
library (plyr)

#### First Table. Importing the first sheet of a table and leaving the others.

model <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/tour_gov_health_barna.xlsx",
                   sheet = "esp_cat_swedes")
model<- data.frame(model)

con <- dbConnect(MySQL(), user="root", password="We*20866135", 
                 dbname="city_time", host="localhost", port=8889)

dbListTables(con) # Checking the tables I have in MysqlWorkbench

my_sql_table <- sqlCreateTable(con, "tour_cat_nordics", model, row.names = NA, temporary = FALSE) #https://rdrr.io/cran/DBI/man/sqlCreateTable.html
odbcDataType(con, my_sql_table)

dbSendQuery(con, "SET GLOBAL local_infile = true;")

dbWriteTable(con, "tour_cat_nordics", model) # Create the structure in your SQL server
dbDisconnect(con) #Disconnect

#### Second Table. Importing all sheets from a table.

model <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/tour_gov_health_spain.xlsx")
model<- data.frame(model)

model<- import_list("/Users/wemigliari/Documents/R/tabelas/tour_gov_health_spain.xlsx", 
                    setclass = "tbl", rbind = TRUE)
model <- model[-c(14:15)]

model <- ldply (model, data.frame) ###making the list into a dataframe


con <- dbConnect(MySQL(), user="root", password="We*20866135", 
                 dbname="city_time", host="localhost", port=8889)

dbListTables(con) # Checking the tables I have in MysqlWorkbench

my_sql_table <- sqlCreateTable(con, "tour_spain_nordics", model, row.names = NA, temporary = FALSE) #https://rdrr.io/cran/DBI/man/sqlCreateTable.html
odbcDataType(con, my_sql_table)

dbSendQuery(con, "SET GLOBAL local_infile = true;")

dbWriteTable(con, "tour_spain_nordics", model) # Create the structure in your SQL server
dbDisconnect(con) #Disconnect


