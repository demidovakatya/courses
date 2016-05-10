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
