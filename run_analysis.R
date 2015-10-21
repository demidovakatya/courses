# ================================================================================
# 0. Read the files. 
# ================================================================================

# A 561-feature vector with time and frequency domain variables. 
features <- read.table("features.txt")
features <- as.vector(features[,2])

# Sets and activity labels
x.test <- read.table("test/X_test.txt", header = FALSE, col.names = features)
y.test <- read.table("test/y_test.txt", header = FALSE, col.names = "Activity")
x.train <- read.table("train/X_train.txt", header = FALSE, col.names = features)
y.train <- read.table("train/y_train.txt", header = FALSE, col.names = "Activity")

# An identifier of the subject who carried out the experiment.
subject.test <- read.table("test/subject_test.txt", header = FALSE, col.names = "Subject")
subject.train <- read.table("train/subject_train.txt", header = FALSE, col.names = "Subject")


# ================================================================================
# 1. Merge datasets.
# ================================================================================

# Merge imported data into the test set and the training set
test <- cbind(subject.test, y.test, x.test)
train <- cbind(subject.train, y.train, x.train)

# Merge the training and the test sets to create one data set.
data <- rbind(test, train)

# Remove unnecessary stuff
rm(x.test, x.train, y.train, y.test, test, train, subject.train, subject.test)


# ================================================================================
# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# ================================================================================

# Create a logical vector of requested features.
req.features <- grepl("-mean", features) & !grepl("-meanFreq", features) | grepl("-std", features)

# Add subject and activity (first two columns).
req.cols <- c(TRUE, TRUE, req.features)

# Get rid of unnecessary columns.
data <- data[req.cols]

# Encode subject IDs as factors (because this variable is categorical)
data$Subject <- as.factor(data$Subject)


# ================================================================================
# 3. Use descriptive activity names to name the activities in the data set
# ================================================================================

# Read activity names
activity.labels <- read.table("activity_labels.txt", header = FALSE, col.names = c("Activity.Label", "Activity.Name"))

# Use activity names as labels for the factor variable (activity type is categorical too)
data$Activity <- factor(data$Activity, levels = activity.labels$Activity.Label, 
                        labels = activity.labels$Activity.Name)


# ================================================================================
# 4. Appropriately label the data set with descriptive variable names.
# ================================================================================

# Store current variable names in a vector
variable.names <- colnames(data)

# Beautify poor names
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


# ================================================================================
# 5. From the data set in step 4, create a second, independent tidy data set
# with the average of each variable for each activity and each subject.
# ================================================================================

# plyr library is needed
library(plyr)

# Get the average of each value.
tidy.data <- aggregate(. ~ Subject + Activity, data, mean)

# Write the tidy data set to a txt file.
write.table(tidy.data, "tidy_data.txt", row.name = FALSE, quote= FALSE)

