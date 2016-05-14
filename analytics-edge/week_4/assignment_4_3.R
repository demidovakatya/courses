# PREDICTING EARNINGS FROM CENSUS DATA

library(ROCR)
library(pROC)
library(dplyr)
library(rpart)
library(rpart.plot)
library(randomForest)
library(caret)
library(e1071)
data <- read.csv("census.csv")

set.seed(2000)
spl <- sample.split(data$over50k, SplitRatio = 0.6)
train <- subset(data, spl == TRUE)
test <- subset(data, spl == FALSE)

log.model <- glm(over50k ~ ., data = train, family = "binomial")
summary(log.model)

log.pred <- predict(log.model, type = "response", newdata = test)
table(test$over50k, log.pred > 0.5) %>% diag %>% sum / nrow(test)

table(train$over50k)
baseline <- rep("<=50K", nrow(test))
table(test$over50k, baseline)[1] / nrow(test)

# What is the area-under-the-curve (AUC) for this model on the test set?
log.rocr <- prediction(log.pred, test$over50k)
(log.auc <- as.numeric(performance(log.rocr, "auc")@y.values))

cart <- rpart(over50k ~ ., data = train, method = "class")
prp(cart)

cart.pred <- predict(cart, newdata = test, type = "class")
table(test$over50k, cart.pred) %>% diag %>% sum / nrow(test)

# What is the AUC of the CART model on the test set?
cart.pred <- predict(cart, newdata = test)
cart.rocr <- prediction(cart.pred[, 2], test$over50k)
(cart.auc <- performance(cart.rocr, "auc")@y.values)

set.seed(1)
train.s <- train[sample(nrow(train), 2000), ]

set.seed(1)
rf <- randomForest(over50k ~ ., data = train.s)
pred.rf <- predict(rf, newdata = test, type = "class")
table(pred.rf, test$over50k) %>% diag %>% sum / nrow(test)

# This code produces a chart that for each variable measures the number of times 
# that variable was selected for splitting (the value on the x-axis). 
vu <- varUsed(rf, count = T)
vu.sorted <- sort(vu, decreasing = F, index.return = T)
dotchart(vu.sorted$x, names(rf$forest$xlevels[vu.sorted$ix]))

# A different metric we can look at is related to "impurity", which measures 
# how homogenous each bucket or leaf of the tree is. 
# In each tree in the forest, whenever we select a variable and perform a split, 
# the impurity is decreased. 
# Therefore, one way to measure the importance of a variable is to average 
# the reduction in impurity, taken over all the times that variable is selected 
# for splitting in all of the trees in the forest. 
varImpPlot(rf)

set.seed(2)
tr.control <- trainControl(method = "cv", number = 10)
grid <- expand.grid( .cp = seq(0.002, 0.1, 0.002))
cv <- train(over50k ~ ., data = train,
            method = "rpart",
            trControl = tr.control,
            tuneGrid = grid)
cv$bestTune

(best.tree <- cv$finalModel)
best.tree.pred <- predict(cv, newdata = test)
table(test$over50k, best.tree.pred) %>% diag %>% sum / nrow(test)

best.tree %>% prp
