# Question 1
# download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", method = "curl", destfile = "idahoHousing.csv")
idaho.housing <- read.csv("idahoHousing.csv")
strsplit(x = colnames(idaho.housing), split = "wgtp")

# Question 2
# Remove the commas from the GDP numbers in millions of dollars and average them. What is the average? 
gdp <- read.csv("gross.csv")
gdp <- gdp[5:194,1:5]
colnames(gdp) <- c("CountryCode", "rankGDP", "Stuff", "LongName", "GDP")
gdp$GDP <- sub(",","",gdp$GDP)
gdp$GDP <- sub(",","",gdp$GDP)
gdp$GDP <- as.numeric(gdp$GDP)
mean(gdp$GDP)

# Question 3
# In the data set from Question 2 what is a regular expression 
# that would allow you to count the number of countries whose name begins with "United"? 
# Assume that the variable with the country names in it is named countryNames. 
# How many countries begin with United?
grep("^United",gdp$LongName)

# Question 4
# Match the data based on the country shortcode.
# Of the countries for which the end of the fiscal year is available, how many end in June? 
ed.stats <- read.csv("ed-gross.csv")
data <- merge(gdp, ed.stats, all = TRUE, by=c("CountryCode"))
fiscal.years <- as.vector(data$Special.Notes[grep("^Fiscal year end: June", data$Special.Notes)])
length(fiscal.years)

# Question 5
# install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
# How many values were collected in 2012?
# How many values were collected on Mondays in 2012?

