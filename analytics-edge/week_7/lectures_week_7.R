library(ggplot2)

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
