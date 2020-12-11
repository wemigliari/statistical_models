

library(dplyr)

set.seed(10-1-2015)
rnorm(5) ### It is equal to rnorm(5, mean = 0, sd = 1)
rnorm(5, mean = 0, sd = 1)

plot(rnorm(1000))

# Generating a random sample from a Poisson distribution with lambda=3
# For the Poison distribution lambda (λ)is equal to the mean or variance.
## Example: 1 nanogram of Plutonium-239 will have an average of 2.3 radioactive decays
## per second, and the number of decays will follow a Poisson distribution. What is the
## probability that in a 2 second period there are exactly 3 radioactive decays?
## λ = 2.3*2 = 4.6
## e = exp = 2.71828
## P(x = 3) = λ^x exp(-λ)/x! or P(x = 3) = (4.6^3 exp^4.6)/3!
## See https://www.youtube.com/watch?v=jmqZG6roVqU&ab_channel=jbstatistics

## In a minute: λ = 2.3*60 = 138

set.seed(100)
## P(x minor equal to 3)
pois <- dpois(0, lambda = 4.6)
pois2 <- dpois(1, lambda = 4.6)
pois3 <- dpois(2, lambda = 4.6) 
pois4 <- dpois(3, lambda = 4.6)

test <- c(pois, pois2, pois3, pois4)
test1 <- c(0:3)
test2 <- data.frame(test1, test)
test2 <- test2 %>% rename("Radioactive Decays" = test1, "Probability" = test)


barplot(test2$test, test2$test1, xlim = c(0,15))

library(ggplot2)
test2 %>% 
  ggplot(aes(`Radioactive Decays`, Probability))+
  geom_col() +
  labs(title="Poisson's Distribution of Probability")+
  geom_text(aes(label = signif(Probability, digits = 3)), nudge_y = 0.01)


####
options(scipen = 999, digits = 2)
events <- c(0:100)
density <- dpois(events, lambda = 4.6)
prob <- ppois(q = events, lambda = 4.6, lower.tail = TRUE)
df <- data.frame(events, density, prob)

ggplot(df, aes(x = factor(events), y = density)) +
  geom_col() +
  geom_text(
    aes(label = round(density,0.5), y = density + 0.01),
    position = position_dodge(0.6),
    size = 1.5,
    vjust = 0
  ) +
  labs(title = "PMF and CDF of Poisson Distribution",
       subtitle = "P(3).",
       x = "Events (x)",
       y = "Density") +
  geom_line(data = df, aes(x = events, y = prob)) +
  theme(
    axis.title.x = element_text(size = 0.5),
    axis.text.x = element_text(size = 0.5),
    axis.title.y = element_text(size = 0.5))


