# Read the full dataset
if (file.exists("household_power_consumption.txt")) {
  raw.data <- read.csv("household_power_consumption.txt", sep=";", 
                       stringsAsFactors = FALSE, na.strings = "?")
} else {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  raw.data <- read.csv(unz(temp, "household_power_consumption.txt"), sep=";", 
                       stringsAsFactors = FALSE, na.strings = "?")
  unlink(temp)
}

# Subset the data
raw.data$Date <- as.Date(raw.data$Date, format = "%d/%m/%Y")
data <- subset(raw.data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(raw.data) 

# Convert the Date and Time variables to Date/Time classes
data$datetime  <- as.POSIXct(paste(data$Date, data$Time, sep=" "))

# Create the plot
par(mfrow=c(1,1))
with(data, {
  plot(Sub_metering_1~datetime, type="l", col="black", ylab = "Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime, type="l", col="red")
  lines(Sub_metering_3~datetime, type="l", col="blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Create the PNG file
dev.copy(png, file="plot3.png")
dev.off()

