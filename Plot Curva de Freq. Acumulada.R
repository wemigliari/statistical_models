library(ggplot2)
library(dplyr)

ggplot(data = GiniRB, aes(sample = Gini2015))

p <- ggplot(data = GiniRB, aes(sample = Gini2015))

p + stat_qq() + stat_qq_line()

p + stat_qq(col = "black") + stat_qq_line(col = "gray") + ggtitle("QQPlot")




