# DETECTING FLU EPIDEMICS VIA SEARCH ENGINE QUERY DATA 
train <- read.csv("FluTrain.csv")

train$Week[which.max(train$Queries)]
train$Week[which.max(train$ILI)]

hist(train$ILI)

plot(train$Queries, log(train$ILI))

flu.trend.1 <- lm(log(ILI) ~ Queries, data = train)
summary(flu.trend.1)

(cor(log(train$ILI), train$Queries))^2

test <- read.csv("FluTest.csv")

pred.test.1 <- exp(predict(flu.trend.1, test))

which(test$Week %in% "2012-03-11 - 2012-03-17")
# [1] 11
pred.test.1[11]

(test$ILI[11] - pred.test.1[11]) / test$ILI[11]

sqrt(mean((pred.test.1 - test$ILI)^2))

library(zoo)
ILILag2 <- lag(zoo(train$ILI), -2, na.pad=TRUE)
train$ILILag2 <- coredata(ILILag2)
summary(train$ILILag2)

plot(log(ILILag2) ~ log(ILI), data = train)

flu.trend.2 <- lm(log(ILI) ~ Queries + log(ILILag2), data = train)
summary(flu.trend.2)

ILILag2 <- lag(zoo(test$ILI), -2, na.pad=TRUE)
test$ILILag2 <- coredata(ILILag2)
summary(test$ILILag2)

test$ILILag2[1:2] <- train$ILI[416:417]
test$ILILag2[1:2]

pred.test.2 <- exp(predict(flu.trend.2, test))
sqrt(mean((pred.test.2 - test$ILI)^2))
pred.test.3 <- exp(predict(flu.trend.1, test))
sqrt(mean((pred.test.3 - test$ILI)^2))
