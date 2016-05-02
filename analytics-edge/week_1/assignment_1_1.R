mvt <- read.csv("mvtWeek1.csv")

nrow(mvt)
max(mvt$ID)
min(mvt$Beat)
table(mvt$Arrest)
table(mvt$LocationDescription)
head(mvt$Date)

DateConvert <-  as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))
summary(DateConvert)

mvt$Month = months(DateConvert)
mvt$Weekday = weekdays(DateConvert)
mvt$Date <- DateConvert

min(table(mvt$Month))
which.max(table(mvt$Weekday))
table(mvt$Month, mvt$Arrest)
which.max(table(mvt$Month, mvt$Arrest))

hist(mvt$Date, breaks=100)
boxplot(mvt$Date ~ mvt$Arrest)

sort(table(mvt$LocationDescription))

top5 <- subset(mvt, LocationDescription == "STREET" | LocationDescription == "PARKING LOT/GARAGE(NON.RESID.)" | LocationDescription == "ALLEY" | LocationDescription == "GAS STATION" | LocationDescription == "DRIVEWAY - RESIDENTIAL")
nrow(top5)
top5$LocationDescription <- factor(top5$LocationDescription)
which.min(table(mvt$Month, mvt$Arrest))
