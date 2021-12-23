library(readxl)
library(rgdal)
library(tmap)
library(tidyverse)
library(purrr)
library(sf)
library(dplyr)



## Shape

br_municipios <- st_read("/Users/wemigliari/Documents/R/data/mg_municipios/brasil_municipios.shp",
                         stringsAsFactors=FALSE, options="encoding=WINDOWS-1252")

mg_municipios <- filter(br_municipios, uf == "MG")

## Data and Subsetting

rm_bh  <- read_excel("/Users/wemigliari/Documents/R/tabelas/pop_rua_renda_rmbh.xlsx")
names(rm_bh)[1] <- "nome"  ### Getting the list of the cities, metro area

metropole <- rm_bh$nome
bh_rm <- filter(mg_municipios, mg_municipios$nome %in% metropole)

## Exporting the shape of the Metropolitan Region of BH

st_write(bh_rm, "/Users/wemigliari/Documents/R/data/mg_municipios/pop_rua_rm_pobreza_bh_qgis.shp")

class(bh_rm)

## Merging data for QGIS

shape_data <- merge(mg_municipios, rm_bh, by= "nome")
class(shape_data)

###Converting multipolygons into two columns_sp
qgis <- st_transform(shape_data, "+proj=longlat +datum=WGS84")
qgis <- shape_data %>%
  dplyr::mutate(geometry = st_centroid(geometry))
qgis2 <- qgis %>% mutate(lat = unlist(map(qgis$geometry,2)), long = unlist(map(qgis$geometry,1)))

qgis2$geometry <- NULL

write.csv(qgis2, "/Users/wemigliari/Documents/R/data/mg_municipios/pop_rua_rm_bh_qgis2.csv")

# Plotting
library(tmap)
#1
qtm(shape_data, fill= 'nome', text = 'Total_Julho') 

#2

tm_shape(shape_data) + tm_fill(col = "Total_Julho", palette = "Blues", title = "") + 
  tm_polygons(border.col = "black") +
  tm_fill(title = "") +
  tm_borders() + tm_layout(frame=F) + 
  tm_layout(
    "Número de Famílias em Extrema Pobreza & Pobreza, Região Metropolitana de Belo Horizonte",
    legend.title.size=1,
    legend.text.size = 0.6,
    legend.position = c("left","bottom")) +
  tm_text("nome", size = 0.3)

#3
tm_shape(shape_data) + tm_fill(col = "Total_Julho", palette = "BuGn", title = "", style="kmeans") +
  tm_fill(title = c("Região Metropolitana de Belo Horizonte, Julho")) +
  tm_borders() + tm_layout(frame=F) + 
  tm_layout(
    "Famílias em Extrema Pobreza & Pobreza",
    legend.title.size=1,
    legend.text.size = 0.6,
    legend.position = c("right","bottom")) +
  tm_text("nome", size = 0.3)

#4
tm_shape(shape_data) + tm_fill(col = "Total_Agosto", palette = "BuGn", title = "", style="kmeans") +
  tm_fill(title = c("Região Metropolitana de Belo Horizonte, Agosto")) +
  tm_borders() + tm_layout(frame=F) + 
  tm_layout(
    "Famílias em Extrema Pobreza & Pobreza",
    legend.title.size=1,
    legend.text.size = 0.6,
    legend.position = c("right","bottom")) +
  tm_text("nome", size = 0.3)










