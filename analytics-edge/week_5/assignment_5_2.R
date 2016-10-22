# AUTOMATING REVIEWS IN MEDICINE

library(tm)
library(SnowballC)
library(caTools)
library(rpart)
library(rpart.plot)
library(dplyr)
library(randomForest)

trials <- read.csv("week_5/clinical_trial.csv", stringsAsFactors = F)
str(trials)

trials$abstract %>% nchar %>% max
((trials$abstract %>% nchar) == 0) %>% sum
trials$title[trials$title %>% nchar %>% which.min]

# Problem 2 - Preparing the Corpus ---------
# load functions create.corpus() and create.nice.document.term.matrix()
source("week_5/_create_corpus_dtm.R")

# corpus.title <- create.corpus(trials$title)
# corpus.title[[1]]$content
(dtm.title <- trials$title %>% create.corpus %>% create.nice.document.term.matrix()) %>% dim
(dtm.abstract <- trials$abstract %>% create.corpus %>% create.nice.document.term.matrix()) %>% dim

dtm.abstract %>% colSums %>% which.max()

# Problem 3.1 - Building a model ---------
colnames(dtm.title) <- paste0("T", colnames(dtm.title))
colnames(dtm.abstract) <- paste0("A", colnames(dtm.abstract))
dtm <- cbind(dtm.title, dtm.abstract, row.names = NULL)
dtm$trial <- trials$trial

set.seed(144)
s <- sample.split(dtm$trial, SplitRatio = 0.7)
train <- subset(dtm, s == T)
test <- subset(dtm, s == F)

# baseline
prop.table(table(test$trial))[table(train$trial) %>% which.max]

# cart
find.accuracy <- function(train, test, split = s, plot = F) {
    tree <- rpart(trial ~ ., data = train, method = "class")
    pred <- predict(tree, newdata = test, type = "class")
    table(test$trial, pred) %>% prop.table %>% diag %>% sum
    if (plot) {
        tree %>% prp
    }
}

tree <- rpart(trial ~ ., data = train, method = "class")
tree %>% prp

predict(tree, newdata = train)[, 2] %>% max
pred <- predict(tree, newdata = train, type = "class")
(conf.matrix <- table(train$trial, pred))
conf.matrix %>% prop.table %>% diag %>% sum #accuracy
conf.matrix[4] / (conf.matrix[4] + conf.matrix[2]) #sensitivity
conf.matrix[1] / (conf.matrix[1] + conf.matrix[3]) #specificity

# Problem 4 - Evaluating the model on the testing set ---------
cart.pred <- predict(tree, newdata = test)
cart.rocr <- prediction(cart.pred[, 2], test$trial)
(cart.auc <- performance(cart.rocr, "auc")@y.values)
