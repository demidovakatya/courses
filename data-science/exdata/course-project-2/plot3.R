# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions 
# from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Load and extract the data into the working directory
if (!file.exists("NEI_data/")) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url, destfile = "NEI_data.zip", method = "curl")
  unzip("NEI_data.zip", exdir = "NEI_data/")
}

# Load the data into the environment
if (!exists("nei")) { nei <- readRDS("NEI_data/summarySCC_PM25.rds") }
if (!exists("scc")) { scc <- readRDS("NEI_data/Source_Classification_Code.rds") }

# Aggregate the amout of PM2.5 emission by year and source for Baltimore City
emission.for.baltimore <- aggregate(Emissions ~ year + type, 
                              data = subset(nei, fips=="24510"), FUN = sum)

# Create the plot
library(ggplot2)
ggplot(data = emission.for.baltimore, aes(factor(year), Emissions, group=type, color=type)) + 
  geom_line() + geom_point(size=4) +
  xlab("year") + ylab("Emission, tons") +
  ggtitle("Emissions from different types of sources\nin Baltimore City")

# Save the plot
dev.copy(png, "plot3.png", width=600, height=600)
dev.off()
