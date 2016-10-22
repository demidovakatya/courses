# PREDICTING STOCK RETURNS WITH CLUSTER-THEN-PREDICT

library(caTools)
library(caret)
library(flexclust)

stocks <- read.csv("StocksCluster.csv")
nrow(stocks)

stocks$PositiveDec %>% table %>% prop.table

cor(stocks) %>% which.max()

colMeans(stocks)

# Problem 2 - Initial Logistic Regression Model
set.seed(144)
spl <- sample.split(stocks$PositiveDec, SplitRatio = 0.7)
train <- subset(stocks, spl == T)
test <- subset(stocks, spl == F)

lm <- glm(PositiveDec ~ ., train, family = "binomial")

lm.train.pred <- predict(lm, newdata = train, type = "response")
table(train$PositiveDec, lm.train.pred > 0.5) %>% prop.table %>% diag %>% sum

lm.pred <- predict(lm, newdata = test, type = "response")
table(test$PositiveDec, lm.pred > 0.5) %>% prop.table %>% diag %>% sum

(table(test$PositiveDec) %>% prop.table)[2]

# Problem 3 - Clustering Stocks
limited.train <- train
limited.train$PositiveDec <- NULL
limited.test <- test
limited.test$PositiveDec <- NULL

preproc <- preProcess(limited.train)
norm.train <- predict(preproc, limited.train)
norm.test <- predict(preproc, limited.test)

norm.train$ReturnJan %>% mean()
norm.test$ReturnJan %>% mean()

set.seed(144)
km <- kmeans(norm.train, 3)
table(km$cluster)

km.kcca <- as.kcca(km, norm.train)
cluster.train <- predict(km.kcca)
cluster.test <- predict(km.kcca, newdata = norm.test)
cluster.test %>% table()

# Problem 4 - Cluster-Specific Predictions
tapply(train$PositiveDec, cluster.train, mean)

stocks.train.1 <- subset(train, cluster.train == 1)
stocks.train.2 <- subset(train, cluster.train == 2)
stocks.train.3 <- subset(train, cluster.train == 3)
stocks.test.1 <- subset(test, cluster.test == 1)
stocks.test.2 <- subset(test, cluster.test == 2)
stocks.test.3 <- subset(test, cluster.test == 3)

lm.1 <- glm(PositiveDec ~ ., stocks.train.1, family = "binomial")
lm.2 <- glm(PositiveDec ~ ., stocks.train.2, family = "binomial")
lm.3 <- glm(PositiveDec ~ ., stocks.train.3, family = "binomial")

(colSums(rbind(lm.1$coefficients > 0, lm.2$coefficients > 0, lm.3$coefficients > 0)))

lm.1.pred <- predict(lm.1, newdata = stocks.test.1, type = "response")
table(stocks.test.1$PositiveDec, lm.1.pred > 0.5) %>% prop.table %>% diag %>% sum

lm.2.pred <- predict(lm.2, newdata = stocks.test.2, type = "response")
table(stocks.test.2$PositiveDec, lm.2.pred > 0.5) %>% prop.table %>% diag %>% sum

lm.3.pred <- predict(lm.3, newdata = stocks.test.3, type = "response")
table(stocks.test.3$PositiveDec, lm.3.pred > 0.5) %>% prop.table %>% diag %>% sum

all.pred <- c(lm.1.pred, lm.2.pred, lm.3.pred)
all.outcomes <- c(stocks.test.1$PositiveDec, stocks.test.2$PositiveDec, stocks.test.3$PositiveDec)
table(all.outcomes, all.pred > 0.5) %>% prop.table %>% diag %>% sum
