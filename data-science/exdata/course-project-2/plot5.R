# How have emissions from motor vehicle sources changed from 1999–2008 
# in Baltimore City?

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
# for the Baltimore City AND motor vehicle sources
emission.from.motor.in.baltimore <- aggregate(Emissions ~ year, data = 
                                subset(nei, fips=="24510" & type=="ON-ROAD"), FUN = sum)

# Create the plot
library(ggplot2)
ggplot(emission.from.motor.in.baltimore, aes(factor(year), Emissions)) + 
  geom_bar(stat="identity") + 
  xlab(label = "year") + ylab(label = "Emissions, tons") + 
  ggtitle(label = "Emissions from motor vehicle sources in Baltimore")

# Save the plot
dev.copy(png, "plot5.png", width=600, height=600)
dev.off()
