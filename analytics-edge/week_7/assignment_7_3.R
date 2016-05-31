# VISUALIZING TEXT DATA USING WORD CLOUDS

library(SnowballC)
library(tm)
library(wordcloud)

tweets <- read.csv("tweets.csv", stringsAsFactors = F)

# Problem 1 - Preparing the Data

corpus <- Corpus(VectorSource(tweets$Tweet))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, PlainTextDocument)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, c("apple", stopwords("english")))

tweets.dtm <- as.data.frame(as.matrix(DocumentTermMatrix(corpus)))
ncol(tweets.dtm)

# Problem 2 - Building a Word Cloud

words <- colnames(tweets.dtm)
freqs <- colSums(tweets.dtm)

wordcloud(words = words, freq = freqs)

# PROBLEM 3 - SIZE AND COLOR

# Word Cloud A
wordcloud(words = words, freq = freqs, rot.per = 0.5)

# Word Cloud B
wordcloud(words = words, freq = freqs, random.order = F)

# Word Cloud C
wordcloud(words = words, freq = freqs, random.color = T, colors = brewer.pal(2, "Accent"))

# Word Cloud D
wordcloud(words = words, freq = freqs, random.order = F)

# Problem 4 - Selecting a Color Palette

wordcloud(words = words, freq = freqs, random.color = T, colors = brewer.pal(3, "Accent"))
wordcloud(words = words, freq = freqs, random.color = T, colors = brewer.pal(3, "Set2"))
wordcloud(words = words, freq = freqs, random.color = T, colors = brewer.pal(2, "YlOrRd"))

brewer.pal(9, "Blues")[c(-5, -6, -7, -8, -9)]  
brewer.pal(9, "Blues")[c(-1, -2, -3, -4)]
brewer.pal(9, "Blues")[c(1, 2, 3, 4)] 
brewer.pal(9, "Blues")[c(5, 6, 7, 8, 9)]
