# UNDERSTANDING WHY PEOPLE VOTE
library(ROCR)

data <- read.csv("gerber.csv")

table(data$voting) / nrow(data)

prop.table(table(data$voting[data$hawthorne == 1]))
prop.table(table(data$voting[data$civicduty == 1]))
prop.table(table(data$voting[data$self == 1]))
prop.table(table(data$voting[data$neighbors == 1]))

log.model <- glm(voting ~ civicduty + hawthorne + self + neighbors, 
                 data, family = "binomial")
summary(log.model)

log.predictions <- predict(log.model, type = "response", newdata = data)
table(data$voting, log.predictions > 0.3)
(log.accuracy.03 <- (134513 + 51966) / (134513 + 100875 + 56730 + 51966))
table(data$voting, log.predictions > 0.5)
(log.accuracy.05 <- 235388 / (235388 + 108696))

log.rocr <- prediction(log.predictions, data$voting)
(log.auc <- as.numeric(performance(log.rocr, "auc")@y.values))

cart.model <- rpart(voting ~ civicduty + hawthorne + self + neighbors, 
                    data = data)
prp(cart.model)

cart.model.2 <- rpart(voting ~ civicduty + hawthorne + self + neighbors, 
                    data = data, cp = 0.0)
prp(cart.model.2)

cart.model.3 <- rpart(voting ~ civicduty + hawthorne + self + neighbors + sex + control, 
                    data = data, cp = 0.0)
prp(cart.model.3)

cart.model.control <- rpart(voting ~ control, cp = 0.0, data = data)
prp(cart.model.control, digits = 6)
abs(0.296638 - 0.34)

cart.model.control.sex <- rpart(voting ~ control + sex, cp = 0.0, data = data)
prp(cart.model.control.sex, digits = 6)
abs(0.290456 - 0.334176)
abs(0.302795 - 0.345818)

log.model.sex <- glm(voting ~ sex + control, data = data, family = "binomial")
summary(log.model.sex)

possibilities <- data.frame(sex = c(0, 0, 1, 1), 
                            control = c(0, 1, 0, 1))
predict(log.model.sex, newdata = possibilities, type = "response")
abs(0.290456 - 0.2908065)

log.model.2 <- glm(voting ~ sex + control + sex:control, 
                   data = data, family = "binomial")
summary(log.model.2)

predict(log.model.2, newdata = possibilities, type = "response")
round(abs(0.290456 - 0.2904558), 5)
