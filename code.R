# Loading and preprocessing the data

# Download the package
if (!file.exists("activity.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip", "activity.zip", method = "curl")
}
# Unzip the package
if (!file.exists("activity.csv")) {
  unzip("activity.zip")
}
# Load the raw data
activity <- read.csv("activity.csv", stringsAsFactors = F)
# Show the structure and the first part of the loaded data
str(activity)
head(activity)
# Convert the 'date' variable to an date-time object
activity$date <- as.POSIXct(activity$date, format = "%Y-%m-%d")
# Create a character vector 'weekday' from known dates
# (A separate vector is created so there are no useless variables)
weekday <- tolower(weekdays(activity$date))
# Create a variable that indicates day type (weekday/weekend)
activity$daytype <- as.factor(ifelse(weekday == "saturday" | 
                                       weekday == "sunday", 
                           "weekend", "weekday"))
# Show the structure and the first part of the processed data
str(activity)
head(activity)

# What is mean total number of steps taken per day?
# For this part of the assignment, you can ignore the missing values in the dataset.
# Create a dataframe with summarized data
daily.steps <- aggregate(activity$steps, list(activity$date), 
                         FUN = sum, na.rm = TRUE)
colnames(daily.steps) <- c("day", "total.steps")
# Make a histogram of the total number of steps taken each day
hist(daily.steps$total.steps, breaks = 20, xlab = "Number of steps", main = "Histogram of the total number\nof steps taken each day", col="red")
# Calculate and report the mean and median total number of steps taken per day
mean(daily.steps$total.steps)
median(daily.steps$total.steps)

# What is the average daily activity pattern?
interval.steps <- aggregate(activity$steps, 
                            by = list(activity$interval), 
                            FUN = mean, na.rm = TRUE)
colnames(interval.steps) <- c("interval", "average.steps")
# Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
plot(interval.steps$interval, interval.steps$average.steps, 
     type = "l", main = "Average daily activity pattern", 
     xlab = "5-minute interval", 
     ylab = "Average number of steps taken")
# Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
interval.steps[which.max(interval.steps$average.steps),]

# Imputing missing values
# There are a number of days/intervals where there are missing values (coded as NA). The presence of missing days may introduce bias into some calculations or summaries of the data.
# Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs).
# Due to the fact that only the 'steps' variable has missing values, the total number of rows with missing values in the dataset equals to the total number of missing values in the 'steps' column:
sum(is.na(activity$steps))
# A strategy for filling in all of the missing values in the dataset us to use the mean for the 5-minute interval.
# Fortunately, we have already counted these means and stored them in the 'interval.steps' dataframe.
# Create a new dataset that is equal to the original dataset but with the missing data filled in.
# We merge the original dataset with this dataframe and fill the missing values
filled.activity <- merge(activity, interval.steps)
filled.activity$steps <- ifelse(is.na(filled.activity$steps), 
                                filled.activity$average.steps, 
                                filled.activity$steps)
# Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?
daily.filled.steps <- aggregate(filled.activity$steps, 
                                list(filled.activity$date), 
                         FUN = sum, na.rm = TRUE)
colnames(daily.filled.steps) <- c("day", "total.steps")
hist(daily.filled.steps$total.steps, breaks = 20, xlab = "Number of steps", main = "Histogram of the total number\nof steps taken each day", col="red")
mean(daily.filled.steps$total.steps)
median(daily.filled.steps$total.steps)

# Are there differences in activity patterns between weekdays and weekends?
# We have already created a factor variable in the dataset with two levels -- "weekday" and "weekend" indicating whether a given date is a weekday or weekend day.
# Make a panel plot containing a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis).
week.steps <- aggregate(filled.activity$steps, 
                        by = list(filled.activity$daytype, 
                                  filled.activity$interval),
                        mean)
colnames(week.steps) <- c("daytype", "interval", "average.steps")
library(lattice)
xyplot(average.steps ~ interval | daytype, data = week.steps, 
       type = "l", layout = c(1,2), 
       xlab = "Interval", ylab = "Number of Steps", 
       main = "Average daily activity pattern\nfor weekends and weekdays")

