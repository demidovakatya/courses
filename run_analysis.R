library(plyr)

# Read the files.
# A 561-feature vector with time and frequency domain variables. 
features <- read.table("features.txt")
features <- as.vector(features[,2])
# Sets and activity labels
x.test <- read.table("test/X_test.txt", header = FALSE, col.names = features)
y.test <- read.table("test/y_test.txt", header = FALSE, col.names = "Activity.Label")
x.train <- read.table("train/X_train.txt", header = FALSE, col.names = features)
y.train <- read.table("train/y_train.txt", header = FALSE, col.names = "Activity.Label")
# An identifier of the subject who carried out the experiment.
subject.test <- read.table("test/subject_test.txt", header = FALSE, col.names = "Subject")
subject.train <- read.table("train/subject_train.txt", header = FALSE, col.names = "Subject")

# Merge datasets: test and train.
test <- cbind(subject.test, y.test, x.test)
train <- cbind(subject.train, y.train, x.train)

# Merge the training and the test sets to create one data set.
data <- rbind(test, train)

# Extract only the measurements on the mean and standard deviation for each measurement. 
req.features <- grepl("-mean", features) & !grepl("-meanFreq", features) | grepl("-std", features)
# Add subject and activity label.
req.cols <- c(TRUE, TRUE, req.features)
data <- data[,req.cols]

# Uses descriptive activity names to name the activities in the data set
# Read activity names
activity.labels <- read.table("activity_labels.txt", header = FALSE, col.names = c("Activity.Label", "Activity.Name"))
# Use activity names
data <- join(data, activity.labels)

# Appropriately labels the data set with descriptive variable names.
# Store current variable names in a vector
variable.names <- colnames(data)
# Change poor names
variable.names <- sub("mean", "Mean", variable.names)
variable.names <- sub("std", "StDev", variable.names)
variable.names <- sub("Acc", ".Acceleration", variable.names)
variable.names <- sub("Mag", ".Magnitude", variable.names)
variable.names <- sub("Gyro", ".AngularVelocity", variable.names)
variable.names <- sub("^t", "Time.", variable.names)
variable.names <- sub("^f", "Freq.", variable.names)
variable.names <- sub("(Body)+", "Body", variable.names)
variable.names <- sub("\\.(\\.)+", "", variable.names)
variable.names <- sub("X$", ".X", variable.names)
variable.names <- sub("Y$", ".Y", variable.names)
variable.names <- sub("Z$", ".Z", variable.names)
# Put them back
colnames(data) <- variable.names

# From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
write.table()
