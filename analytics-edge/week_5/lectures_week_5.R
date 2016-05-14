library(tm)
library(SnowballC)
library(caTools)
library(rpart)
library(rpart.plot)
library(dplyr)
library(randomForest)

# Turning Tweets into Knowledge: An Introduction to Text Analytics

tweets <- read.csv("tweets.csv", stringsAsFactors = F)

tweets$negative <- as.factor(tweets$Avg <= -1)
table(tweets$negative)

corpus <- Corpus(VectorSource(tweets$Tweet))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, PlainTextDocument)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, c("apple", stopwords("en")))
corpus <- tm_map(corpus, stemDocument)
corpus[[1]]$content

(freqs <- DocumentTermMatrix(corpus))
inspect(freqs[1000:1005, 505:515])

findFreqTerms(freqs, lowfreq = 20)
findFreqTerms(freqs, lowfreq = 100)
(freqs.sparse.terms.removed <- removeSparseTerms(freqs, 0.995))

tweets.sparse <- as.data.frame(as.matrix(freqs.sparse.terms.removed))
(colnames(tweets.sparse) <- make.names(colnames(tweets.sparse)))

tweets.sparse$Negative <- tweets$negative

set.seed(123)
spl <- sample.split(tweets.sparse$Negative, SplitRatio = 0.7)

train <- subset(tweets.sparse, spl == T)
test <- subset(tweets.sparse, spl == F)

tree <- rpart(Negative ~ ., data = train, method = "class")
# prp(tree)

pred <- predict(tree, newdata = test, type = "class")
table(test$Negative, pred) %>% diag %>% sum / nrow(test)

# Baseline accuracy 
prop.table(table(test$Negative))[1]

# Random forest model
set.seed(123)
rf <- randomForest(Negative ~ ., data = train)
rf.pred <- predict(rf, newdata = test)
table(test$Negative, rf.pred) %>% diag %>% sum / nrow(test)

# Logistic regression
log.model <- glm(Negative ~ ., data = train, family = "binomial")
log.pred <- predict(log.model, newdata = test, type = "response")
table(test$Negative, log.pred > 0.5) %>% diag %>% sum / nrow(test)
