CPS <- read.csv("CPSData.csv")

nrow(CPS)
table(CPS$Industry)
sort(table(CPS$State))
(table(CPS$Citizenship)[[1]] + table(CPS$Citizenship)[[2]]) / nrow(CPS)
table(CPS$Hispanic, CPS$Race)

summary(CPS$State)

table(CPS$Region, is.na(CPS$Married))
table(CPS$Sex, is.na(CPS$Married))
table(CPS$Citizenship, is.na(CPS$Married))
table(CPS$Age, is.na(CPS$Married))

# length(subset(table(CPS$State, is.na(CPS$MetroAreaCode))[, 2], 
#        table(CPS$State, is.na(CPS$MetroAreaCode))[, 2] > 0))
# length(subset(table(CPS$State, is.na(CPS$MetroAreaCode))[, 1], 
#        table(CPS$State, is.na(CPS$MetroAreaCode))[, 1] > 0))
table(CPS$State, is.na(CPS$MetroAreaCode))
sum(table(CPS$State, is.na(CPS$MetroAreaCode))[,'FALSE'] == 0)
sum(table(CPS$State, is.na(CPS$MetroAreaCode))[,'TRUE'] == 0)

prop.table(table(CPS$Region, is.na(CPS$MetroAreaCode)), 
           margin=1)

sort(tapply(is.na(CPS$MetroAreaCode),CPS$State,mean))

MetroAreaMap <- read.csv("MetroAreaCodes.csv")
CountryMap <- read.csv("CountryCodes.csv")

nrow(MetroAreaMap)
nrow(CountryMap)

CPS <- merge(CPS, MetroAreaMap, 
             by.x = "MetroAreaCode", by.y = "Code", 
             all.x = TRUE)
summary(CPS)

sort(table(CPS$MetroArea), decreasing = T)
library(dplyr)
choices <- c("Atlanta-Sandy Springs-Marietta, GA", "Baltimore-Towson, MD", "Boston-Cambridge-Quincy, MA-NH", "San Francisco-Oakland-Fremont, CA")
CPS %>%
  filter(MetroArea %in% choices) %>%
  group_by(MetroArea) %>%
  summarise(n_count = n()) %>%
  arrange(-n_count)

sort(tapply(CPS$Hispanic, CPS$MetroArea, mean))

sort(tapply(CPS$Race == "Asian", CPS$MetroArea, mean))

sort(tapply(CPS$Education == "No high school diploma", 
            CPS$MetroArea, mean, na.rm = T))[1]


CPS <- merge(CPS, CountryMap, 
             by.x = "CountryOfBirthCode", by.y = "Code", 
             all.x = TRUE)
summary(CPS)

sort(table(CPS$Country), decreasing=TRUE)[1:5]

sort(tapply(CPS$Country != "United States", CPS$MetroArea,
            mean, na.rm = T))["New York-Northern New Jersey-Long Island, NY-NJ-PA"]

which.max(tapply(CPS$Country == "India", 
            CPS$MetroArea, sum, na.rm = T))
which.max(tapply(CPS$Country == "Brazil", 
            CPS$MetroArea, sum, na.rm = T))
which.max(tapply(CPS$Country == "Somalia", 
            CPS$MetroArea, sum, na.rm = T))
CPS %>%
  filter(Country == "India") %>%
  group_by(MetroArea) %>%
  summarise(n_count = n()) %>%
  arrange(-n_count) %>%
  head()
CPS %>%
  filter(Country == "Brazil") %>%
  group_by(MetroArea) %>%
  summarise(n_count = n()) %>%
  arrange(-n_count) %>%
  head()
CPS %>%
  filter(Country == "Somalia") %>%
  group_by(MetroArea) %>%
  summarise(n_count = n()) %>%
  arrange(-n_count) %>%
  head()

rm(CountryMap, MetroAreaMap, CPS, choices)
