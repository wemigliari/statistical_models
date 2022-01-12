library(dplyr)
library(tidytext)
library(rvest)
library(pdftools)


riks_pdf <- pdf_text(pdf = "https://www.riksdagen.se/globalassets/07.-dokument--lagar/the-instrument-of-government-2015.pdf")

myCorpus_pdf <- paste0(as.character(riks_pdf))
class(myCorpus_pdf)

library(tokenizers)
words_riks <- tokenize_words(myCorpus_pdf, strip_numeric = TRUE, 
                             simplify = TRUE, 
                             stopwords = c("is", "not", "one", "at","laid", "are","has","such","that","as", "which","under","the", "on", "with", "down", "other", "of", "and", "for", "to", "in", "a", "an", "by", "or", "à"))

tab_riks <- data.frame(matrix(unlist(words_riks), ncol = 1),stringsAsFactors=FALSE)


######


library(plyr)

frequency <- count(tab_riks)

# Descending order
frequency <- frequency[order(frequency$freq, decreasing = TRUE),]
names(frequency)[1] <- "words"

percent <- frequency %>% group_by(words) %>%
  mutate(Percentage=paste0(round(freq/sum(freq),8)))
percent <- data.frame(percent)
num <- as.numeric(percent[,3])
percent <- cbind(percent, num)
colnames(percent)[4]<-"Percentage"
percent[,3] <- NULL


percent2 <- data.frame(percent[c(1:15),])

percent3 <- data.frame(percent)


### Normal distribution - word repetition

sample.range <- percent3$freq

class(sample.range)
sr_mean <- mean(sample.range)

sr_sd <- sd(sample.range)
sr_dist <- dnorm(sample.range, mean = sr_mean, sd = sr_sd)

sr_df <- data.frame("Repetition" = sample.range, "Density" = sr_dist)

library(ggplot2)
ggplot(sr_df, aes(x = Repetition, y = Density)) + geom_line() +
  labs(title="",
       y = "Normal Density Function", x = "", caption = "Source: Sveriges Riksdag",
       color = "")


### Probability. What is the probability of a word set being repeated x times?

Proportion <- percent3$freq/sum(percent3$freq)              #http://www.henry.k12.ga.us/ugh/apstat/chapternotes/7supplement.html
sum(Proportion)
                  
sr_df <- cbind(percent3$words, sr_df, Proportion)
sr_df$`percent3$words`<- NULL
names(sr_df)[1]<-"Words"


### Probability on Repetitions, not on the number of events over the total number of words
pp <- function(x) {
  print(paste0(round(x*100, 7), "%"))
}

# Repetition Number
perc <- pp(sr_df$Density[sr_df$Repetition == 8]) # likelihood of Entries == 50?

  
#Repetition Words
perc2 <- pp(sr_df$Density[sr_df$Words == "election"])

### Cumulative distribution function

sr_pnorm <- pnorm(sample.range, sr_mean, sr_sd)
sr_df2 <- cbind(sr_df, "CDF" = sr_pnorm)
ggplot(sr_df2, aes(x = sr_df2$Proportion, y = CDF)) + geom_line() +
  labs(title="",
       y = "Cumulative Distribution Function", x = "", caption = "Source: Sveriges Riksdag",
       color = "")

####### rnorm

sr_pnorm2 <- rnorm(sample.range)
p = ecdf(sr_pnorm2)
plot(p)


### Descriptive Statistics

library(pastecs)

mean(sr_df2$Words)

res <- stat.desc(sr_df2)
round(res, 2)

#### Scales

library(scales)

sr_df3 <- cbind(sr_df2, percent3$words)
names(sr_df3)[5]<- "Entries"

remove.list <- paste(c("be", "it", "its", "her", "his", "no", "any"), collapse = '|')

sr_df3 <- sr_df3[!grepl(remove.list, sr_df3$Entries),]

# expect a warning about rows with missing values being removed             https://www.tidytextmining.com/tidytext.html

ggplot(sr_df3, aes(x = Proportion, y = CDF, 
                      color = abs(CDF - Proportion))) +
  geom_abline(color = "gray40", lty = 2) +
  geom_jitter(alpha = 0.1, size = 1.5, width = 0.3, height = 0.3) +
  geom_text(aes(label = Entries), check_overlap = TRUE, vjust = 1.5) +
  scale_x_log10(labels = percent_format()) +
  scale_y_log10(labels = percent_format()) +
  scale_color_gradient(limits = c(0, 0.001), 
                       low = "darkslategray4", high = "gray75") +
  theme(legend.position="none") +
  labs(y = "Entries", x = NULL)



### Correlations
library(tokenizers)


tft_token_ngram2 <- tokenize_ngrams(x = myCorpus_pdf,
                                    lowercase = TRUE,
                                    n = 3L,
                                    n_min = 3L,
                                    stopwords = character(),
                                    ngram_delim = " ",
                                    simplify = FALSE)

tft_token_ngram2 <- tokenize_skip_ngrams(x = myCorpus_pdf,
                                         stopwords = character(),
                                         simplify = FALSE)

sr_df4 <- tibble(txt=myCorpus_pdf)

sr_df5 <- sr_df4 %>%
  unnest_tokens(word, txt)

sr_df6 <- sr_df4 %>%
  unnest_tokens(sentence, txt, token = "sentences")
sr_df7 <- sr_df4 %>%
  unnest_tokens(ngram, txt, token = "ngrams", n = 23)

library(factoextra)
# Correlation-based distance method
sr_df8 <- scale(percent[,2:3])
sr_df8 <- sr_df8[-c(101:1456),]
head(sr_df8)

res.dist <- get_dist(sr_df8, method = "pearson")
head(round(as.matrix(res.dist), 2))

fviz_dist(res.dist, lab_size = 8)

#### Lexical Dispersion Plot
         
library("quanteda")
library("quanteda.textplots")

myCorpus <- corpus(tab_riks$matrix.unlist.words_riks...ncol...1.) %>% 
  corpus_reshape(to = "sentences")
summary(myCorpus)
# make some duplicated author docvar values
set.seed(1)
docvars(myCorpus, "author") <- 
  sample(c("A", "B", "C"), 
         size = ndoc(myCorpus), replace = TRUE)

groupedtexts <- texts(myCorpus, groups = "author")
length(groupedtexts)
# [1] 3
names(groupedtexts)
# [1] "author1" "author2" "author3"


textplot_xray(
  kwic(myCorpus, pattern = "riksdag"),
  kwic(myCorpus, pattern = "law"),
  kwic(myCorpus, pattern = "be")
)



