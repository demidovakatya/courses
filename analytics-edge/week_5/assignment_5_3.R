# SEPARATING SPAM FROM HAM

library(tm)
library(SnowballC)
library(caTools)
library(rpart)
library(rpart.plot)
library(dplyr)
library(randomForest)

#  (PART 1) ---------
# Problem - Loading the Dataset ---------
emails <- read.csv("week_5/emails.csv", stringsAsFactors = F)
nrow(emails)
table(emails$spam)[2]

emails$text %>% nchar %>% max
emails$text %>% nchar %>% which.min

# Problem 2.1 - Preparing the Corpus ---------
# load functions create.corpus() and create.nice.document.term.matrix()
source("week_5/_create_corpus_dtm.R")
(dtm <- emails$text %>% create.corpus %>% DocumentTermMatrix)
(sp.dtm <- dtm %>% removeSparseTerms(0.95) %>% as.matrix %>% as.data.frame) %>% ncol
colnames(sp.dtm) <- colnames(sp.dtm) %>% make.names

sp.dtm %>% colSums %>% which.max
sp.dtm$spam <- emails$spam
((subset(sp.dtm, sp.dtm$spam == F) %>% select(-spam) %>% colSums) >= 5000) %>% sum
((subset(sp.dtm, sp.dtm$spam == T) %>% select(-spam) %>% colSums) >= 1000) %>% sum

# Problem 3 - Building Machine Learning Models -------
sp.dtm$spam <- as.factor(sp.dtm$spam)

set.seed(123)
s <- sample.split(sp.dtm$spam, 0.7)
train <- subset(sp.dtm, s == T)
test <- subset(sp.dtm, s == F)

# Using the training set, train the following three machine learning models.
lm <- glm(spam ~ ., data = train, family = "binomial")
tree <- rpart(spam ~ ., data = train, method = "class")
set.seed(123)
rf <- randomForest(spam ~ ., data = train)

# For each model, obtain the predicted spam probabilities for the training set.
lm.pred <- predict(lm, newdata = train)
tree.pred <- predict(tree, newdata = train)[, 2]
rf.pred <- predict(rf, newdata = train, type = "prob")[, 2]

find.accuracy <- function(y, pred) {
    table(y, pred) %>% 
        prop.table %>% 
        diag %>% sum
}

(lm.pred < 0.00001) %>% sum
(lm.pred > 0.99999) %>% sum
((lm.pred < 0.99999) & (lm.pred > 0.00001)) %>% sum
summary(lm)
(lm.acc <- find.accuracy(train$spam, lm.pred > 0))
(lm.auc <- as.numeric(performance(prediction(lm.pred, train$spam), "auc")@y.values))

prp(tree)
(tree.acc <- find.accuracy(train$spam, tree.pred > 0.5))
(tree.auc <- as.numeric(performance(prediction(tree.pred, train$spam), "auc")@y.values))

(rf.acc <- find.accuracy(train$spam, rf.pred > 0.5))
(rf.auc <- as.numeric(performance(prediction(rf.pred, train$spam), "auc")@y.values))

models.on.train.results <- matrix(data = c(lm.acc, tree.acc, rf.acc, 
                                           lm.auc, tree.auc, rf.auc), 
                                  ncol = 2, dimnames = list(c("lm", "tree", "rf"),
                                                            c("acc", "auc"))
                                  )

# Problem 4 - Evaluating on the Test Set -------
lm.pred <- predict(lm, newdata = test)
tree.pred <- predict(tree, newdata = test)[, 2]
rf.pred <- predict(rf, newdata = test, type = "prob")[, 2]

lm.acc <- find.accuracy(test$spam, lm.pred > 0)
lm.auc <- as.numeric(performance(prediction(lm.pred, test$spam), "auc")@y.values)

tree.acc <- find.accuracy(test$spam, tree.pred > 0.5)
tree.auc <- as.numeric(performance(prediction(tree.pred, test$spam), "auc")@y.values)

rf.acc <- find.accuracy(test$spam, rf.pred > 0.5)
rf.auc <- as.numeric(performance(prediction(rf.pred, test$spam), "auc")@y.values)

(models.on.test.results <- matrix(data = c(lm.acc, tree.acc, rf.acc, 
                                           lm.auc, tree.auc, rf.auc), 
                                  ncol = 2, dimnames = list(c("lm", "tree", "rf"),
                                                            c("acc", "auc"))
                                  ))
rm(lm.acc, lm.auc, tree.acc, tree.auc, rf.acc, rf.auc)

# (PART 2 - OPTIONAL) -------------
# Problem 6 - Integrating Word Count Information
word.count <- dtm %>% as.matrix %>% rowSums
hist(word.count)

log.word.count <- log(word.count)
hist(log.word.count)
rm(word.count)

sp.dtm$log.word.count <- log.word.count
train <- subset(sp.dtm, s == T)
test <- subset(sp.dtm, s == F)

tapply(sp.dtm$log.word.count, sp.dtm$spam, summary)
boxplot(sp.dtm$log.word.count ~ sp.dtm$spam)

tree <- rpart(spam ~ ., data = train, method = "class")
set.seed(123)
rf <- randomForest(spam ~ ., data = train)

tree %>% prp

tree.pred <- predict(tree, newdata = test)[, 2]
rf.pred <- predict(rf, newdata = test, type = "prob")[, 2]

tree.acc <- find.accuracy(test$spam, tree.pred > 0.5)
tree.auc <- as.numeric(performance(prediction(tree.pred, test$spam), "auc")@y.values)
rf.acc <- find.accuracy(test$spam, rf.pred > 0.5)
rf.auc <- as.numeric(performance(prediction(rf.pred, test$spam), "auc")@y.values)

(models.on.test.results <- matrix(data = c(tree.acc, rf.acc, tree.auc, rf.auc), 
                                  ncol = 2, 
                                  dimnames = list(c("tree", "rf"), c("acc", "auc")))
)
