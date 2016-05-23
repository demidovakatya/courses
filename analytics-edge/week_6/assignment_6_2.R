# MARKET SEGMENTATION FOR AIRLINES

library(caret)

airlines <- read.csv("AirlinesCluster.csv")
colMeans(airlines)

preproc <- preProcess(airlines)
airlines.norm <- predict(preproc, airlines)
summary(airlines.norm)

# Problem 2 - Hierarchical Clustering
dists <- dist(airlines.norm, method = "euclidean")
air.cluster <- hclust(dists, method = "ward.D")
plot(air.cluster)

hc.groups <- cutree(air.cluster, k = 5)
table(hc.groups)

tapply(airlines$Balance, hc.groups, mean)
tapply(airlines$QualMiles, hc.groups, mean)
tapply(airlines$BonusMiles, hc.groups, mean)
tapply(airlines$BonusTrans, hc.groups, mean)
tapply(airlines$FlightMiles, hc.groups, mean)
tapply(airlines$FlightTrans, hc.groups, mean)
tapply(airlines$DaysSinceEnroll, hc.groups, mean)

# Problem 3 - K-Means Clustering
set.seed(88)
kmc <- kmeans(airlines.norm, centers = 5, iter.max = 1000)

kmc.groups <- kmc$cluster
table(kmc.groups)

table(hc.groups, kmc.groups)
