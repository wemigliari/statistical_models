### http://r-statistics.co/Complete-Ggplot2-Tutorial-Part2-Customizing-Theme-With-R-Code.html#Legend%20Title

library(ggplot2)
library(ggthemes)
library(extrafont)

ggplot(USmetrocomp, aes(USmetrocomp$`2000`/1000000, USmetrocomp$`2010`/1000000)) +
  geom_point() + geom_rangeframe() + 
  theme_stata() +
  theme(text=element_text(family="Times New Roman", size=12)) +
  labs(title = "Fig. 1.  49 Most Populous Metropolitan Areas in the U.S.", y = "Population in Millions. Census 2010.", x = "Population in Millions. Census 2000.")


