library(ggplot2)
library(gplots)

dev.off()

mean(US15$`PersonsPoverty%`)
sd(US15$`PersonsPoverty%`)

dat <- read.table(text = 
  "info mean sd
  USCensus 11.2  16.17
  USModelo 20.07 16.17
  Farmington 2.6 16.17
  Flint 41.2 16.17
", header = TRUE)

dat

densities <- apply(dat[, -1], 1, function(x) rnorm(n = 1000000, mean = x[1], sd = x[2]))
colnames(densities) <- dat$info

par(family = "")

plot(0, type = "n", xlim = c(min(densities), max(densities)), ylim = c(0, .04), xlab = "Poverty Threshold", ylab = "")
for (d in 1:ncol(densities)){
  lines(density(densities[, d]), lty = d, col = c("darkgreen", "darkblue", "black", "gray"))
}
abline(v = c(2.6, 11.2, 20, 41), lty = 1, lwd = 0.3, col = "green")
legend("topright", legend=colnames(densities), cex = 0.8, lty=1:ncol(densities), bty = "n", col = "darkgreen")

dev.off()

#To print in eps extension and export to LaTex.

dat <- read.table(text = 
                    "info mean sd
  USCensus 11.2  16.17
  USModelo 20.07 16.17
  Farmington 2.6 16.17
  Flint 41.2 16.17
", header = TRUE)

dat

densities <- apply(dat[, -1], 1, function(x) rnorm(n = 1000000, mean = x[1], sd = x[2]))
colnames(densities) <- dat$info
setEPS() #command 
postscript("rstudio3.eps", family = "sans", paper = "special") #command for fonts mainly
plot(0, type = "l", xlim = c(min(densities), max(densities)), ylim = c(0, .04), xlab = "", ylab = "")
for (d in 1:ncol(densities)){
  lines(density(densities[, d]), lty = d)
}
abline(v = c(2.6, 11.8, 20, 41), lty = 1, lwd = 0.3)
legend("topright", legend=colnames(densities), cex = 0.8, lty=1:ncol(densities), bty = "n")
dev.off() #important to close the document

#family "sans" for Arial, "serif" for Times New Roman.
#bty = "n", "o", “l”, “h”, “c”, “u”, or “]”: 
#xlim = range of the x axis
#ylim = range of the y axis
#cex = size of the fonts, labels, axis etc
#lwd = line width 
#lty = line type
#pch = option to specify symbols
#abline(v = c(3,5))  ------ draws vertical lines at x=3 and x=5 
#abline(h = c(4,6))  ------ draws vertical lines at y=4 and y=6 
#abline(a=10, b=1)  ------ draws vertical lines with intercept 10 and slope 1

#https://www.statmethods.net/advgraphs/parameters.html
#http://www.countbio.com/web_pages/left_object/R_for_biology/R_fundamentals/draw_inside_plot_R.html

generateRLineTypes<-function(){
  oldPar<-par()
  par(font=7, mar=c(0,0,0,0))
  plot(1, pch="", ylim=c(0,6), xlim=c(0,0.7),  axes=FALSE,xlab="", ylab="")
  for(i in 0:6) lines(c(0.3,0.7), c(i,i), lty=i, lwd=3)
  text(rep(0.1,6), 0:6, labels=c("0.'blank'", "1.'solid'", "2.'dashed'", "3.'dotted'",
                                 "4.'dotdash'", "5.'longdash'", "6.'twodash'"))
  par(mar=oldPar$mar,font=oldPar$font )
}
generateRLineTypes()




