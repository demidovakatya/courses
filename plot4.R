# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999–2008?

# Load and extract the data into the working directory
if (!file.exists("NEI_data/")) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url, destfile = "NEI_data.zip", method = "curl")
  unzip("NEI_data.zip", exdir = "NEI_data/")
}

# Load the data into the environment
if (!exists("nei")) { nei <- readRDS("NEI_data/summarySCC_PM25.rds") }
if (!exists("scc")) { scc <- readRDS("NEI_data/Source_Classification_Code.rds") }

# Merge the NEI and SCC data and select rows with "coal" in SCC Short Name
nei.with.scc <- merge(nei, scc, by = "SCC")
source.is.coal.related <- grepl("coal", nei.with.scc$Short.Name, ignore.case=TRUE)
chosen.data <- nei.with.scc[source.is.coal.related, ]

# Aggregate the amout of PM2.5 emission from coal combustion-related sources by year
emission.from.coal <- aggregate(Emissions ~ year, 
                                    data = chosen.data, FUN = sum)

# Create the plot
library(ggplot2)
ggplot(data = emission.from.coal, aes(factor(year), Emissions)) + 
  geom_bar(stat = "identity") +
  xlab("year") + ylab("Emission, tons") +
  ggtitle("Emissions from coal combustion-related sources")

# Save the plot
dev.copy(png, "plot4.png", width=600, height=600)
dev.off()
