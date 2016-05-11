# PREDICTING EARNINGS FROM CENSUS DATA

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
# TODO: Problem 1.4 - A Logistic Regression Model
# What is the area-under-the-curve (AUC) for this model on the test set?

cart.over50 <- rpart(over50k ~ ., data = train, method = "class")
prp(cart.over50)

cart.pred.over50 <- predict(cart.over50, newdata = test, type = "class")
table(test$over50k, cart.pred.over50) %>% diag %>% sum / nrow(test)
