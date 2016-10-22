b0 <- -1.5
b1 <- 3
b2 <- -0.5
x1 <- 1
x2 <- 5
# What is the value of the Logit for this observation?
# Recall that the Logit is log(Odds).
(odds <- exp(b0 + b1 * x1 + b2 * x2))
(logit <- b0 + b1 * x1 + b2 * x2)
(p.y.equals.1 <- 1 / (1 + exp(-logit)))

data <- read.csv("quality.csv")
str(data)
table(data$PoorCare)

library(caTools)

set.seed(88)
split <- sample.split(data$PoorCare, SplitRatio = 0.75)
split

train <- subset(data, split == T)
test <- subset(data, split == F)

log <- glm(PoorCare ~ StartedOnCombination + ProviderCount, newdata = train, family = binomial)
summary(log)

pred.train <- predict(log, type = 'response')
summary(pred.train)

# tapply(pred.train, train$PoorCare, mean)
# 
# table(train$PoorCare, pred.train > 0.5)
# # sensitivity
# 3 / 25
# # specificity
# 73 / 74
# 
# table(train$PoorCare, pred.train > 0.7)
# # sensitivity
# 2 / 25
# # specificity
# 73 / 74

log <- glm(PoorCare ~ OfficeVisits + Narcotics, data = train, family = binomial)
pred.test <- predict(log, type = "response", newdata = test)
rocr.pred.test <- prediction(pred.test, test$PoorCare)
auc.test <- as.numeric(performance(rocr.pred.test, "auc")@y.values)
auc.test


# --------

dat <- read.csv("framingham.csv")
str(dat)

library(caTools)
set.seed(1000)
split <- sample.split(dat$TenYearCHD, SplitRatio = 0.65)
train <- subset(dat, split == TRUE)
test <- subset(dat, split == FALSE)

log <- glm(TenYearCHD ~ ., data = train, family = "binomial")
summary(log)

pred.test <- predict(log, type = "response", newdata = test)

library(ROCR)
rocr.pred <- prediction(pred.test, test$TenYearCHD)
as.numeric(performance(rocr.pred, "auc")@y.values)

library(pROC)
auc(test$TenYearCHD, pred.test)

# sensitivity
11 / (11 + 187)
# specificity
1069 / (1069 + 6)
