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
