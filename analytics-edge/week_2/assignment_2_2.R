# READING TEST SCORES

train <- read.csv("pisa2009train.csv")
test <- read.csv("pisa2009test.csv")

nrow(train)

tapply(train$readingScore, train$male, mean)

summary(train)
train <- na.omit(train)
nrow(train)
test <- na.omit(test)
nrow(test)

train$raceeth <- relevel(train$raceeth, "White")
test$raceeth <- relevel(test$raceeth, "White")

lm.score <- lm(readingScore ~ ., data = train)
summary(lm.score)

sqrt(mean(lm.score$residuals^2))

pred.test <- predict(lm.score, test)
max(pred.test) - min(pred.test)

(SSE <- sum((pred.test - test$readingScore) ** 2))
(RMSE <- sqrt(mean((pred.test - test$readingScore) ** 2)))

(baseline <- mean(train$readingScore))
(SST <- sum((baseline - test$readingScore)^2))

1 - SSE/SST
