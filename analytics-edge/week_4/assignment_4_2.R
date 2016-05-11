# LETTER RECOGNITION

library(dplyr)
library(randomForest)

data <- read.csv("letters_ABPR.csv")

data$isB <- as.factor(data$letter == "B")

set.seed(1000)
spl <- sample.split(data$isB, SplitRatio = 0.5)
train <- subset(data, spl == TRUE)
test <- subset(data, spl == FALSE)

baseline.b <- rep(F, nrow(data))
table(data$isB, baseline.b)[1] / nrow(data)

cart.b <- rpart(isB ~ . - letter, data = train, method = "class")
pred.cart.b <- predict(cart.b, newdata = test, type = "class")
(table(test$isB, pred.cart.b)[1] + table(test$isB, pred.cart.b)[4]) / nrow(test)

set.seed(1000)
rf.b <- randomForest(isB ~ . - letter, data = train)
pred.rf.b <- predict(rf.b, newdata = test, type = "class")
(table(test$isB, pred.rf.b)[1] + table(test$isB, pred.rf.b)[4]) / nrow(test)

data$letter <- as.factor(data$letter)

set.seed(2000)
spl <- sample.split(data$letter, SplitRatio = 0.5)
train <- subset(data, spl == TRUE)
test <- subset(data, spl == FALSE)

table(data$letter)
#  A   B   P   R 
# 789 766 803 758 

baseline <- rep("P", nrow(test))
table(train$letter)[3] / nrow(test)

cart <- rpart(letter ~ . - isB, data = train, method = "class")
pred <- predict(cart, newdata = test, type = "class")
table(pred, test$letter) %>% diag %>% sum / nrow(test)

rf <- randomForest(letter ~ . - isB, data = train)
pred.rf <- predict(rf, newdata = test, type = "class")
table(pred.rf, test$letter) %>% diag %>% sum / nrow(test)
