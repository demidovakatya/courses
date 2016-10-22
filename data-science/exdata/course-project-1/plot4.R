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
library(tidyr)
data$datetime  <- as.POSIXct(paste(data$Date, data$Time, sep=" "))

# Create the plot
par(mfrow=c(2,2))

with(data, {
  plot(Global_active_power~datetime, type="l", col="black", 
                ylab = "Global Active Power", xlab="")
  plot(Voltage~datetime, type="l")
  plot(Sub_metering_1~datetime, type="l", col="black", ylab = "Energy sub metering", xlab="")
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), bty="n", cex=0.75)
  lines(Sub_metering_2~datetime, type="l", col="red")
  lines(Sub_metering_3~datetime, type="l", col="blue")
  plot(Global_reactive_power~datetime, type="l")
})

# Create the PNG file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
