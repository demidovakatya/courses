# 1
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# and load the data into R. The code book, describing the variable names is here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# How many properties are worth $1,000,000 or more?

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
# download.file(url = url, method = "curl", destfile = "quiz1-1.csv")
data <- read.csv("quiz1-1.csv")
library(dplyr)
data <- tbl_df(data)
filter(data, VAL >= 14) %>% select(VAL)
# 53

# 3
# Download the Excel spreadsheet on Natural Gas Aquisition Program here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
# dat
# What is the value of:
# sum(dat$Zip*dat$Ext,na.rm=T)
# (original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
# download.file(url = url, method = "curl", destfile = "quiz1-3.xlsx")
library(xlsx)
dat <- read.xlsx("quiz1-3.xlsx")
sum(dat$Zip*dat$Ext,na.rm=T)
# [1] 36534720

# 4
# Read the XML data on Baltimore restaurants from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
# How many restaurants have zipcode 21231?

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
# download.file(url = url, method = "curl", destfile = "quiz1-4.xml")
library(XML)
doc <- xmlTreeParse("quiz1-4.xml")
rootNode <- xmlRoot(doc)
zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
table(zipcode == 21231)
# 127

# 5
# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
# using the fread() command load the data into an R object
# DT
# The following are ways to calculate the average value of the variable
# pwgtp15
# broken down by sex. Using the data.table package, which will deliver the fastest user time?
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
# download.file(url = url, method = "curl", destfile = "quiz1-5.csv")
library(data.table)
DT <- fread("quiz1-5.csv")
system.time(DT[,mean(pwgtp15),by=SEX])
DT[,mean(pwgtp15),by=SEX]
# user  system elapsed 
# 0.008   0.002   0.013 
