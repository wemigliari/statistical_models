library(knitr)
library(data.table)
library(rgdal)
library(sf) ## Read shapefiles
library(dplyr)
library(leaflet)
library(cowplot)
library(ggplot2)
library(plotly)
library(readxl)
library(htmlwidgets)
library(stringr)

populacao_rua <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/populacao_rua_brasil.xlsx")
names(populacao_rua)[2] <- "nome"
names(populacao_rua)[3] <- "date"
populacao_rua <- data.frame(populacao_rua)

test <- populacao_rua %>%
  select(nome, date, Total)%>%
  filter(date > "2021-01-02" & date <"2021-02-11")

test <- test[order(test$nome),]


brasil <- read_sf("/Users/wemigliari/Documents/R/data/BRA_adm1.shp", 
                  options = "ENCODING=windows-1252")


data <- merge(test, brasil, by = "nome")


###
library(tmap)

shp_joined <- inner_join(brasil, data, by = "nome")
class(shp_joined) # Dataframe. It does not work yet!

shp_joined <- st_as_sf(shp_joined) 
class(shp_joined) # It is now converted to "sf" and "data.frame". It works!

data <- shp_joined %>%
  arrange(Total) %>%
  mutate(name=factor(nome, unique(nome)))

data <- data %>%
  select( date, Total, geometry.x, nome)%>%
  filter(date > "2020-12-02" & date <"2021-02-02")

#####

# Create a color palette with handmade bins.
mybins <- c(0, 500, 1000, 2000, 5000, 10000, 20000, 50000, 70000)
mypalette <- colorBin( palette="YlOrBr", domain=data$Total, na.color="transparent", bins=mybins)

mytext <- paste(
  "Estado: ", data$nome, "<br/>",
  "Total: ", data$Total, "<br/>",
  sep="") %>%
  lapply(htmltools::HTML)

####


leaflet(data) %>% 
  addPolygons( 
    fillColor = ~mypalette(Total), 
    stroke=TRUE, 
    fillOpacity = 1, 
    color="white", 
    weight=0.3,
    label = mytext,
    labelOptions = labelOptions( 
      style = list("font-weight" = "normal", padding = "3px 8px"), 
      textsize = "13px", 
      direction = "auto"
    )
  )%>% 
  addTiles()  %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addLegend(pal=mypalette, values=~data$Total, opacity=1, title = "Estados, Totais de Moradores em Situação de Rua", position = "bottomright" )%>%
  setView(-47.9392, -15.7801, zoom = 4.2)

####

qtm(data, fill = "Total", fill.breaks=c(0, 500, 1000, 2000, 5000, 10000, 20000, 50000, 70000),
    fill.title = "Moradores em Situação de Rua",
    fill.palette = "Reds", ## Blues, Reds, Purples etc for different colors. To invert the scale of the colors, use the minus sign, for instance, -Reds.
    title = "Fonte: CADÚnico",
    title.position = c("right", "top")) +
  tm_layout(asp=0) + 
  tm_compass (north = 0, type = "arrow", show.labels = 2) +
  tm_layout(legend.title.size = .75, 
            legend.text.size = .75, 
            legend.frame = FALSE, title.size = 0.9,
            outer.margins = c(0,0,0,0)) +
  tm_credits("R Studio by Migliari, W. (2021).", position = c("right", "BOTTOM"))

####

populacao_rua_mg <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/populacao_rua_mg.xlsx") ### Shape in form of sf

populacao_rua_mg <- data.frame(populacao_rua_mg)

test2 <- populacao_rua_mg %>%
  select(nome, date, Total)%>%
  filter(date > "2021-01-02" & date <"2021-02-11")

mg <- read_sf("/Users/wemigliari/Documents/R/data/BRA_adm2.shp", 
                  options = "ENCODING=windows-1252")

mg <- mg%>%filter(uf=="MG")

shp_joined <- inner_join(mg, test2, by = "nome")
class(shp_joined) # Dataframe. It does not work yet!

shp_joined <- st_as_sf(shp_joined) 
class(shp_joined) # It is now converted to "sf" and "data.frame". It works!

data1 <- shp_joined %>%
  arrange(Total) %>%
  mutate( name=factor(nome, unique(nome)))

data1 <- data1 %>%
  select( date, Total, geometry, nome)%>%
  filter(date > "2020-12-02" & date <"2021-02-02")


mybins1 <- c(0,10, 20, 30, 40, 50, 100, 200, 500, 1000, 2000, 5000, 8700)
mypalette1 <- colorBin( palette="YlOrBr", domain=data$Total, na.color="transparent", bins=mybins1)

mytext1 <- paste(
  "Municípios: ", data1$nome, "<br/>",
  "Total: ", data1$Total, "<br/>",
  sep="") %>%
  lapply(htmltools::HTML)

leaflet(data1) %>% 
  addPolygons( 
    fillColor = ~mypalette1(Total), 
    stroke=TRUE, 
    fillOpacity = 1, 
    color="white", 
    weight=0.3,
    label = mytext1,
    labelOptions = labelOptions( 
      style = list("font-weight" = "normal", padding = "3px 8px"), 
      textsize = "13px", 
      direction = "auto"
    )
  )%>% 
  addTiles()  %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addLegend(pal=mypalette1, values=~data$Total, opacity=1, title = "Total de Moradores em Situação de Rua, Municípios de Minas Gerais", position = "bottomright" )%>%
  setView(-40.940933, -19.912998, zoom = 6.3)
#####

qtm(data1, fill = "Total", fill.breaks=c(0,10, 20, 30, 40, 50, 100, 200, 500, 1000, 2000, 5000, 8700),
    fill.title = "Moradores em Situação de Rua, Minas Gerais",
    fill.palette = "Reds", ## Blues, Reds, Purples etc for different colors. To invert the scale of the colors, use the minus sign, for instance, -Reds.
    title = "Fonte: CADÚnico",
    title.position = c("right", "top")) +
  tm_layout(asp=0) + 
  tm_compass (north = 0, type = "arrow", show.labels = 2) +
  tm_layout(legend.title.size = .75, 
            legend.text.size = .75, 
            legend.frame = FALSE, title.size = 0.9,
            outer.margins = c(0,0,0,0)) +
  tm_credits("R Studio by Migliari, W. (2021).", position = c("right", "BOTTOM"))





