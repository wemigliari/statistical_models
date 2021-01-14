library(readxl)
library(dplyr)
library(tidyr)


data <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/tour_gov_health_cat_sweden.xlsx")


par(family= "Arial", cex = 0.5, mar = c(5,5,5,13), xpd = TRUE)

plot(as.Date(data$years), data$`Swedes in Catalonia`,
     type = "b", 
     bty = "l", 
     pch = 1,
     col = "red",
     xlab = "", 
     ylab = "Million",
     cex = 1)

plot(data$years, data$`Swedes in Catalonia`,
     pch=18, 
     cex=2, 
     col="#69b3a2",
     xlab = "",
     ylab = "Million",
     main="Swedish Visitors in Catalonia"
)

####

library(ggplot2)
library(viridis)


# Plot
cat <- ggplot(data, aes(x=years, y= `Swedes in Catalonia`, 
                        size = `Swedes in Catalonia`,
                        color = `Swedes in Catalonia`)) +
  geom_point(alpha=1) +
  theme_light() +
  scale_color_viridis() +
  scale_size(range = c(0, 7)) +
  labs(x = "", y = "") +
  guides(color=guide_legend("Swedes in Catalonia"), fill = data$`Swedes in Catalonia`)
  #geom_text(label = data$years, size = 2, data = data)

###

library(plotly)

cat1 <- ggplot(data, aes(x=years, y= `Swedes in Catalonia`, 
                        size = `Swedes in Catalonia`, 
                        color = `Swedes in Catalonia`)) + # If we want to add information, just write text = "text".
  geom_point(alpha=1) +
  theme_light() +
  scale_color_viridis() +
  scale_size(range = c(0, 7)) +
  labs(x = "", y = "") +
  guides(color=guide_legend("Swedes in Catalonia"), fill = data$`Swedes in Catalonia`) 
  #geom_text(label = data$years, size = 2, data = data)



###

library(plotly)

fig <- plot_ly(data, x = data$years, y = data$`Swedes in Catalonia`, type = 'scatter', mode = 'markers',
               marker = list(size = data$`Swedes in Catalonia`/1000, opacity = 0.7))
fig <- fig %>% layout(title = 'Swedes in Catalonia',
                      xaxis = list(showgrid = FALSE),
                      yaxis = list(showgrid = FALSE))

fig


