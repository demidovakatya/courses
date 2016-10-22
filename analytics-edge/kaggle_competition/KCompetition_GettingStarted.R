# KAGGLE COMPETITION - GETTING STARTED

# This script file is intended to help you get started on the Kaggle platform, and to show you how to make a submission to the competition.

# Let's start by reading the data into R
# Make sure you have downloaded these files from the Kaggle website, and have navigated to the directory where you saved the files on your computer
train <- read.csv("train2016.csv")
test <- read.csv("test2016.csv")

# We will just create a simple logistic regression model, to predict Party using all other variables in the dataset, except for the user ID:
simple.log <- glm(Party ~ . - USER_ID, data = train, family = binomial)

# And then make predictions on the test set:
pred.test <- predict(simple.log, newdata = test, type = "response")
threshold <- 0.5
pred.test.labels <- as.factor(ifelse(pred.test < threshold, "Democrat", "Republican"))

# However, you can submit the file on Kaggle to see how well the model performs. You can make up to 5 submissions per day, so don't hesitate to just upload a solution to see how you did.

# Let's prepare a submission file for Kaggle (for more about this, see the "Evaluation" page on the competition site):
my.sub <- data.frame(USER_ID = test$USER_ID, Predictions = pred.test.labels)
write.csv(my.sub, "SubmissionSimpleLog2.csv", row.names = FALSE)

# You should upload the submission "SubmissionSimpleLog.csv" on the Kaggle website to use this as a submission to the competition
# This model was just designed to help you get started - to do well in the competition, you will need to build better models!
