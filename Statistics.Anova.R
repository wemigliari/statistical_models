###Anova

### https://www.youtube.com/watch?v=-oZ2Etv5V1M&t=1129s
#https://feliperego.github.io/blog/2015/10/23/Interpreting-Model-Output-In-R

set.seed(122)
speed.c = scale(USmetrocomp$`2000`, center=TRUE, scale=FALSE)
mod1 = lm(formula = `2000` ~ `2010`, data = USmetrocomp)
summary(mod1)


anova(`2000`~ `2010`)
