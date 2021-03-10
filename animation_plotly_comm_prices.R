
library(plotly)
library(lazyeval)
library(dplyr)

commodities_price <- read_excel("Documents/R/data/commodities_price.xlsx", 
                                col_types = c("numeric", "numeric", "numeric", "date", "numeric", "text", 
                                              "numeric", "text", "numeric", "text", 
                                              "numeric", "numeric", "numeric", 
                                              "text", "numeric", "text", "numeric", 
                                              "text", "numeric", "text", "numeric", 
                                              "text", "numeric", "text", "numeric", 
                                              "text", "numeric", "text", "numeric", 
                                              "text", "numeric", "text"))


commodities_price <- as.data.frame(commodities_price)


class(commodities_price)


accumulate_by <- function(dat, var) {
  var <- lazyeval::f_eval(var, dat)
  lvls <- plotly:::getLevels(var)
  dats <- lapply(seq_along(lvls), function(x) {
    cbind(dat[var %in% lvls[seq(1, x)], ], frame = lvls[[x]])
  })
  dplyr::bind_rows(dats)
}

test <-commodities_price
test <- commodities_price%>% accumulate_by(~date)


plot_ly(test, x=~date, y=~PriceCoalSA, frame=~frame, 
        name='Price SA Coal',  hoverinfo = 'text',
        size = test$PriceCoalSA*8,
        text = ~paste('Coal SA Price: ', test$PriceCoalSA,
                      'Year: ', test$year, 
                      'Month: ', test$month,
                      sep="\n"),
        type = 'scatter', mode = 'markers',
        color = I("darkgreen")) %>%
  add_markers(x=~date, y = ~PriceCrudeOil, name='Crude Oil Price', 
              hoverinfo = 'text',
              type = 'scatter', mode = 'markers',
              text = ~paste('Crude Oil Price: ', test$PriceCrudeOil,
                            'Year: ', test$year, 
                            'Month: ', test$month,
                            sep="\n"),
              color = I("darkgray"))%>%
  add_markers(x=~date, y = ~PriceIron, name='Iron Price',
              hoverinfo = 'text',
              type = 'scatter', mode = 'markers',
              text = ~paste('Iron Price: ', test$PriceIron,
                            'Year: ', test$year, 
                            'Month: ', test$month,
                            sep="\n"),
              color = I("steelblue")) %>%
  layout(yaxis = list(title = ''), 
         xaxis = list(title = ''),
         zeroline = F)%>%
  animation_opts(
    frame = 500, 
    transition = 0, 
    redraw = FALSE
  )%>%
  animation_slider(
    currentvalue = list(prefix = " ", font = list(color="white"))
  )


plot_ly(test, x=~date, y=~PriceCoalSA, frame=~frame, 
        name='Price SA Coal',  hoverinfo = 'text',
        text = ~paste('Coal SA Price: ', test$PriceCoalSA),
        type = 'scatter', mode = 'markers',
        line = list(simplyfy = F),
        color = I("darkgreen")) %>%
  add_markers(x=~date, y = ~PriceCrudeOil, name='Crude Oil Price', 
              mode = 'markers', 
              text = ~paste('Crude Oil Price: ', 
                            test$PriceCrudeOil),
              color = I("darkgray"))%>%
  add_markers(x=~date, y = ~PriceIron, name='Iron Price', 
              mode = 'markers', 
              text = ~paste('Iron Price: ', 
                            test$PriceIron),
              color = I("steelblue")) %>%
  layout(yaxis = list(title = ''), 
         xaxis = list(title = ''),
         zeroline = F)%>%
  animation_opts(
    frame = 500, 
    transition = 0, 
    redraw = FALSE
  )



