# PREDICTING EARNINGS FROM CENSUS DATA

library(ROCR)
library(pROC)
library(dplyr)
library(rpart)
data <- read.csv("census.csv")

set.seed(2000)
spl <- sample.split(data$over50k, SplitRatio = 0.6)
train <- subset(data, spl == TRUE)
test <- subset(data, spl == FALSE)

log.model.over50k <- glm(over50k ~ ., data = train, family = "binomial")
summary(log.model.over50k)

pred.over50k <- predict(log.model.over50k, type = "response", newdata = test)
table(test$over50k, pred.over50k > 0.5) %>% diag %>% sum / nrow(test)

table(train$over50k)
baseline <- rep("<=50K", nrow(test))
table(test$over50k, baseline)[1] / nrow(test)

# What is the area-under-the-curve (AUC) for this model on the test set?
log.over50.rocr <- prediction(pred.over50k, test$over50k)
(log.over50.auc <- as.numeric(performance(log.over50.rocr, "auc")@y.values))

cart.over50 <- rpart(over50k ~ ., data = train, method = "class")
prp(cart.over50)

cart.pred.over50 <- predict(cart.over50, newdata = test, type = "class")
table(test$over50k, cart.pred.over50) %>% diag %>% sum / nrow(test)

# What is the AUC of the CART model on the test set?
cart.pred.over50 <- predict(cart.over50, newdata = test)
cart.over50.rocr <- prediction(cart.pred.over50[, 2], test$over50k)
(cart.over50.auc <- performance(cart.over50.rocr, "auc")@y.values)
# auc(test$over50k, cart.pred.over50)

set.seed(1)
