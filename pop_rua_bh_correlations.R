library(ggpubr)

perfil <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/pop_rua_bh.xlsx",
                    sheet = "Perfil")

print("Pearson Correlations")

cor(perfil$Total, perfil$Ate_seis_meses_tempo_rua,  method = "pearson", use = "complete.obs")
cor(perfil$Total, perfil$Entre_seis_meses_e_um_ano_tempo_rua, method = "pearson", use = "complete.obs")
cor(perfil$Total, perfil$Entre_um_e_dois_anos_tempo_rua, method = "pearson", use = "complete.obs")
cor(perfil$Total, perfil$Entre_dois_e_cinco_anos_tempo_rua, method = "pearson", use = "complete.obs")
cor(perfil$Total, perfil$Entre_cinco_e_dez_anos_tempo_rua, method = "pearson", use = "complete.obs")
cor(perfil$Total, perfil$Mais_de_dez_anos_tempo_rua, method = "pearson", use = "complete.obs")

########

flattenCorrMatrix <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
  )
}

library(Hmisc)
perfil_corr<-rcorr(as.matrix(perfil[,c(2,4:9)]))
pop_rua_bh_tab_corr <- flattenCorrMatrix(perfil_corr$r, perfil_corr$P)

library("writexl")
write_xlsx(pop_rua_bh_tab_corr,"/Users/wemigliari/Documents/R/tabelas/pop_rua_bh_tab_corr.xlsx")

######

ggscatter(perfil, x = "Total", y = "Ate_seis_meses_tempo_rua", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Total", ylab = "Até Seis Meses de Tempo de Rua")



#####

library("PerformanceAnalytics")

perfil2 <- perfil[, c(2,4,5,6,7,8, 9)]
chart.Correlation(perfil2, histogram=TRUE, pch=19)

install.packages("devtools")
devtools::install_github("taiyun/corrplot", build_vignettes = TRUE)

library(corrplot)
res <- cor(perfil2)
round(res, 2)
corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)

library(RColorBrewer)
library(GGally)
ggcorr(perfil2, method = c("everything", "pearson")) 

ggpairs(perfil, columns = c(2, 4:9), ggplot2::aes(colour="Reds")) 









