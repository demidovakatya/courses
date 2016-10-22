# DETECTING VANDALISM ON WIKIPEDIA

library(tm)
library(SnowballC)
library(caTools)
library(rpart)
library(rpart.plot)
library(dplyr)
library(randomForest)

wiki <- read.csv("week_5/wiki.csv", stringsAsFactors = F)
wiki$Vandal <- as.factor(wiki$Vandal)
str(wiki)
table(wiki$Vandal)

added.corpus <- Corpus(VectorSource(wiki$Added)) %>% 
    tm_map(removeWords, stopwords()) %>% 
    tm_map(stemDocument)
added.corpus[[1]]$content
(dtm <- DocumentTermMatrix(added.corpus))
num.words.added <- dtm %>% as.matrix %>% rowSums
added.words <- dtm %>% removeSparseTerms(0.997) %>% as.matrix %>% as.data.frame
dim(added.words)
colnames(added.words) <- paste("A", colnames(added.words))

removed.corpus <- Corpus(VectorSource(wiki$Removed)) %>% 
    tm_map(removeWords, stopwords()) %>% 
    tm_map(stemDocument)
removed.corpus[[1]]$content
(dtm <- DocumentTermMatrix(removed.corpus))
num.words.removed <- dtm %>% as.matrix %>% rowSums
removed.words <- dtm %>% removeSparseTerms(0.997) %>% as.matrix %>% as.data.frame
dim(removed.words)
colnames(removed.words) <- paste("R", colnames(removed.words))

wiki.words <- cbind(added.words, removed.words) 
wiki.words$Vandal <- wiki$Vandal

set.seed(123)
s <- sample.split(wiki.words$Vandal, SplitRatio = 0.7)
train <- subset(wiki.words, s == T)
test <- subset(wiki.words, s == F)

# baseline
prop.table(table(test$Vandal))[1]

# a simple function to avoid copying and pasting 5 lines of code every time
# analytics edge asks for a model's accuracy
find.accuracy <- function(data, split = s, plot = F) {
    train <- subset(data, s == T)
    test <- subset(data, s == F)
    tree <- rpart(Vandal ~ ., data = train, method = "class")
    pred <- predict(tree, newdata = test, type = "class")
    table(test$Vandal, pred) %>% prop.table %>% diag %>% sum
    if (plot) {
        tree %>% prp
    }
}

# cart
find.accuracy(wiki.words)

# We hypothesize that given that a lot of vandalism seems to be adding links 
# to promotional or irrelevant websites, the presence of a web address is 
# a sign of vandalism.
# We can search for the presence of a web address in the words added by searching
# for "http" in the Added column.
wiki.words.2 <- wiki.words
wiki.words.2$HTTP <- ifelse(grepl("http", wiki$Added, fixed = T), 1, 0)
table(wiki.words.2$HTTP)[[2]]

find.accuracy(wiki.words.2)

# Another possibility is that the number of words added and removed is predictive, 
# perhaps more so than the actual words themselves. 
wiki.words.2$num.words.added <- num.words.added
wiki.words.2$num.words.removed <- num.words.removed
wiki.words.2$num.words.added %>% mean()

find.accuracy(wiki.words.2)
# much better!

wiki.words.3 <- wiki.words.2
wiki.words.3$Minor <- wiki$Minor
wiki.words.3$Loggedin <- wiki$Loggedin

find.accuracy(wiki.words.3, plot = T)
# no waaay!
