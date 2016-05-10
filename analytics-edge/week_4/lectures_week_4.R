data <- read.csv("ClaimsData.csv")

library(caTools)

table(data$bucket2009) / nrow(data)

set.seed(88)
spl <- sample.split(data$bucket2009, SplitRatio = 0.6)
train <- subset(data, spl == TRUE)
test <- subset(data, spl == FALSE)

mean(train$age)
table(train$diabetes) / nrow(train)

library(rpart)
library(rpart.plot)

# CART model
tree <- rpart(bucket2009 ~ age + alzheimers + arthritis + cancer + copd + depression + diabetes + heart.failure + ihd + kidney + osteoporosis + stroke + bucket2008 + reimbursement2008, data = train, method = "class", cp = 0.00005)

prp(tree)
