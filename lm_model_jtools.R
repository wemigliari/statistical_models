library(jtools) ### Using new tools for your outputs

## Model https://cran.r-project.org/web/packages/jtools/vignettes/summ.html

model <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/tour_gov_health_barna.xlsx",
                   sheet = "esp_cat_swedes")
model<- data.frame(model)


model_mlr_ar_n1 <- lm(model$Arrivals_cat ~ model$Arrivals_cat_dk + 
                        model$Arrivals_cat_fin + 
                        model$Arrivals_cat_nor +
                        model$Arrivals_cat_se, data = model) 

summ(model_mlr_ar_n1, confint = TRUE, digits = 4, ci.width = 0.5)

plot_summs(model_mlr_ar_n1)
plot_summs(model_mlr_ar_n1, plot.distributions = TRUE)

##### Rshiny

library(ExPanDaR)

View

test <- model
row.names(test) <- test[,1]
test[,1] <- NULL

test1 <- signif(test, 1)

ExPanD(test1)

library(formattable)
test2 <- formattable(test, 1, format = FALSE)



### Coments

library(broom)

output_model <- tidy(model_mlr_ar_n1)
write_xlsx(output_model, "/Users/wemigliari/Documents/R/tabelas/public_health_coefficients_model.xlsx")
pairs(model[,10:13]/1000, pch  = 4, col = c("lawngreen", "darkgreen", "yellowgreen", "olivedrab"),
      labels = c("Denmark", "Finland", "Norway", "Sweden"))

library(GGally)

ggpairs(model[,10:13]/1000)





