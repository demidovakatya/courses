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

log <- glm(PoorCare ~ StartedOnCombination + ProviderCount, data = train, family = binomial)
summary(log)

pred.train <- predict(log, type = 'response')
summary(pred.train)

tapply(pred.train, train$PoorCare, mean)

table(train$PoorCare, pred.train > 0.5)
# sensitivity
3 / 25
# specificity
73 / 74

table(train$PoorCare, pred.train > 0.7)
# sensitivity
2 / 25
# specificity
73 / 74
