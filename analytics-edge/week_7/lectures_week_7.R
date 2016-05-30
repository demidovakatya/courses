library(ggplot2)
library(maps)
library(ggmap)

# Visualizing the World: An Introduction to Visualization ----

who <- read.csv("WHO.csv")
str(who)

scatterplot <- ggplot(who, aes(x = GNI, y = FertilityRate))
scatterplot + geom_point()
# scatterplot + geom_line()
fert.gni.plot <- scatterplot + geom_point(color = "blue", size = 2, shape = 17) + 
    ggtitle("Fertility Rate vs. GNI")
pdf("fert.gni.plot.pdf")
print(fert.gni.plot)
dev.off()

ggplot(who, aes(x = GNI, y = FertilityRate, color = Region)) + geom_point()
ggplot(who, aes(x = GNI, y = FertilityRate, color = LifeExpectancy)) + geom_point()

ggplot(who, aes(x = FertilityRate, y = Under15, color = Region)) + geom_point()

# The Analytical Policeman: Visualization for Law and Order

mvt <- read.csv("mvt.csv", stringsAsFactors = F)

mvt$Date <- strptime(mvt$Date, format = "%m/%d/%y %H:%M")
mvt$Weekday <- weekdays(mvt$Date)
mvt$Hour <- mvt$Date$hour

weekday.crimes <- data.frame(table(mvt$Weekday))
weekday.crimes$Var1 <- factor(weekday.crimes$Var1, ordered = T, 
                              levels = c("Monday", "Tuesday", "Wednesday",
                                         "Thursday", "Friday", "Saturday", "Sunday"))
ggplot(weekday.crimes, aes(x = Var1, y = Freq)) + geom_line(aes(group = 1)) +
    xlab("day of the week") + ylab("total motor vehicle thefts")
# ggplot(weekday.crimes, aes(x = Var1, y = Freq)) + geom_line(aes(group = 1), linetype = 2) +
#    xlab("day of the week") + ylab("total motor vehicle thefts")

hour.weekday.crimes <- data.frame(table(mvt$Weekday, mvt$Hour))
hour.weekday.crimes$Hour <- as.numeric(as.character(hour.weekday.crimes$Var2))
hour.weekday.crimes$Var1 <- factor(hour.weekday.crimes$Var1, ordered = T, 
                                   levels = c("Monday", "Tuesday", "Wednesday",
                                              "Thursday", "Friday", "Saturday", "Sunday"))
ggplot(hour.weekday.crimes, aes(x = Hour, y = Freq)) + geom_line(aes(group = Var1, color = Var1)) +
    xlab("hour of the day") + ylab("total motor vehicle thefts")
ggplot(hour.weekday.crimes, aes(x = Hour, y = Var1)) + geom_tile(aes(fill = Freq)) +
    scale_fill_gradient(name = "thefts", low = "white", high = "red") + 
    theme(axis.title.y = element_blank())

chicago <- get_map("chicago", zoom = 11)
ggmap(chicago) + geom_point(data = mvt[1:100, ], aes(x = Longitude, y = Latitude))

lat.lon.crimes <- data.frame(table(round(mvt$Longitude, 2), round(mvt$Latitude, 2)))
lat.lon.crimes$long <- as.numeric(as.character(lat.lon.crimes$Var1))
lat.lon.crimes$lat <- as.numeric(as.character(lat.lon.crimes$Var2))

ggmap(chicago) + geom_point(lat.lon.crimes, aes(x = long, y = lat, color = Freq, size = Freq)) + 
    scale_color_gradient(low = "yellow", high = "red")
ggmap(chicago) + geom_tile(lat.lon.crimes, aes(x = long, y = lat, alpha = Freq), fill = "red")

lat.lon.crimes.2 <- subset(lat.lon.crimes, Freq > 0)
nrow(lat.lon.crimes) - nrow(lat.lon.crimes.2)
