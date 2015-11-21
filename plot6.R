# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Load and extract the data into the working directory
if (!file.exists("NEI_data/")) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url, destfile = "NEI_data.zip", method = "curl")
  unzip("NEI_data.zip", exdir = "NEI_data/")
}

# Load the data into the environment
if (!exists("nei")) { nei <- readRDS("NEI_data/summarySCC_PM25.rds") }
if (!exists("scc")) { scc <- readRDS("NEI_data/Source_Classification_Code.rds") }

# Aggregate the amout of PM2.5 emission by year 
# for Baltimore City OR Los Angeles County
# AND On-Road type of sources
chosen.nei <- subset(nei, type=="ON-ROAD")
chosen.nei <- subset(chosen.nei, (fips=="06037" | fips=="24510"))
emission.from.motor <- aggregate(Emissions ~ year + fips, data = chosen.nei, FUN = sum)
emission.from.motor$fips[emission.from.motor$fips=="06037"] <- "Los Angeles"
emission.from.motor$fips[emission.from.motor$fips=="24510"] <- "Baltimore City"

# Create the plot
library(ggplot2)
ggplot(emission.from.motor, aes(factor(year), Emissions)) + 
  facet_grid(. ~ fips) + geom_bar(stat="identity") + 
  xlab(label = "year") + ylab(label = "Emissions, tons") + 
  ggtitle(label = "Emissions from motor vehicle sources\nin Los Angeles and Baltimore")

# Save the plot
dev.copy(png, "plot6.png", width=600, height=600)
dev.off()
