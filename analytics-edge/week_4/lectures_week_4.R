library(caTools)
library(rpart)
library(rpart.plot)
library(dplyr)
library(randomForest)

count.accuracy <- function(y, pred) {
    table(y, pred) %>% diag %>% sum / length(y)
}

# =====================
# Judge, Jury, and Classifier: An Introduction to Trees

data <- read.csv("stevens.csv")

set.seed(3000)
spl <- sample.split(data$Reverse, SplitRatio = 0.7)
train = subset(data, spl == T)
test = subset(data, spl == F)

tree <- rpart(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, 
              data = train, 
              method = "class", 
              minbucket = 25)

tree.roc <- predict(tree, newdata = test)
pred <- prediction(tree.roc[, 2], test$Reverse)
performance(pred, "auc")

rpart(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, 
      data = train, method = "class", minbucket = 5) %>% 
    prp

rpart(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, 
      data = train, method = "class", minbucket = 100) %>% 
    prp

train$Reverse <- as.factor(train$Reverse)
test$Reverse <- as.factor(test$Reverse)

# Let's see what happens if we set the seed to two different values and create two different random forest models.
set.seed(100)
rf <- randomForest(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, 
                   data = train, ntree = 200, nodesize = 25)
rf.pred <- predict(rf, newdata = test, type = "class")

count.accuracy(test$Reverse, rf.pred)

set.seed(200)
rf <- randomForest(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, 
                   data = train, ntree = 200, nodesize = 25)
rf.pred <- predict(rf, newdata = test, type = "class")

count.accuracy(test$Reverse, rf.pred)

# =====================
# Keeping an Eye on Healthcare Costs: The D2Hawkeye Story
data <- read.csv("ClaimsData.csv")

table(data$bucket2009) / nrow(data)

set.seed(88)
spl <- sample.split(data$bucket2009, SplitRatio = 0.6)
train <- subset(data, spl == TRUE)
test <- subset(data, spl == FALSE)

mean(train$age)
table(train$diabetes) / nrow(train)

# CART model
tree <- rpart(bucket2009 ~ age + alzheimers + arthritis + cancer + copd + depression + diabetes + heart.failure + ihd + kidney + osteoporosis + stroke + bucket2008 + reimbursement2008, 
              data = train, method = "class", cp = 0.00005)
# prp(tree)

predict.test <- predict(tree, newdata = test, type = "class")

# baseline method
count.accuracy(data$bucket2009, data$bucket2008)
# [1] 0.6833091

base.1 <- rep(1, nrow(test))
count.accuracy(test$bucket2009, base.1)

penalty.matrix <- matrix(c(0,1,2,3,4,2,0,1,2,3,4,2,0,1,2,6,4,2,0,1,8,6,4,2,0),
                         byrow = T, nrow = 5)
as.matrix(table(test$bucket2009, base.1))
sum(as.matrix(table(test$bucket2009, base.1)) * penalty.matrix[, 1]) / nrow(test)
