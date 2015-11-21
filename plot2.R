# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Load and extract the data into the working directory
if (!file.exists("NEI_data/")) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url, destfile = "NEI_data.zip", method = "curl")
  unzip("NEI_data.zip", exdir = "NEI_data/")
}

# Load the data into the environment
if (!exists("nei")) { nei <- readRDS("NEI_data/summarySCC_PM25.rds") }
if (!exists("scc")) { scc <- readRDS("NEI_data/Source_Classification_Code.rds") }

# Aggregate the amout of PM2.5 emission by year for the Baltimore City
emission.by.year <- aggregate(Emissions ~ year, data = subset(nei, fips=="24510"), FUN = sum)

# Create the plot
options(scipen = 20)
with(emission.by.year, 
     barplot(height = Emissions, xlab = "year", names.arg = year, 
             ylab = "PM2.5 emission, tons", col="red",
             main="The total PM2.5 emission\nin the Baltimore City\n(all sources)", yaxs="i"))

# Save the plot
dev.copy(png, "plot2.png", width=600, height=600)
dev.off()