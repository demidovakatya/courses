# DOCUMENT CLUSTERING WITH DAILY KOS

# The file dailykos.csv contains data on 3,430 news articles or blogs that have been 
# posted on Daily Kos. Each of the variables in the dataset is a word that 
# has appeared in at least 50 different articles (1,545 words in total). 
# The set of  words has been trimmed according to some of the techniques covered 
# in the previous week on text analytics (punctuation has been removed, and 
# stop words have been removed). For each document, the variable values are the number of times that word appeared in the document. 

library(dplyr)

setwd("~/Documents/_courses/analytics-edge/week_6")
dk <- read.csv("dailykos.csv")
dim(dk) # [1] 3430 1545
# dk.matrix <- as.matrix(dk)
# dk.vector <- as.vector(dk.matrix)
# length(dk.vector)

dists <- dist(dk, method = "euclidean")
dk.cluster <- hclust(dists, method = "ward.D")
plot(dk.cluster)

cluster.groups <- cutree(dk.cluster, k = 7)
table(cluster.groups)

hc.group.1 <- subset(dk, cluster.groups == 1)
hc.group.2 <- subset(dk, cluster.groups == 2)
hc.group.3 <- subset(dk, cluster.groups == 3)
hc.group.4 <- subset(dk, cluster.groups == 4)
hc.group.5 <- subset(dk, cluster.groups == 5)
hc.group.6 <- subset(dk, cluster.groups == 6)
hc.group.7 <- subset(dk, cluster.groups == 7)

hc.group.1 %>% colMeans %>% sort %>% tail
hc.group.2 %>% colMeans %>% sort %>% tail
hc.group.3 %>% colMeans %>% sort %>% tail
hc.group.4 %>% colMeans %>% sort %>% tail
hc.group.5 %>% colMeans %>% sort %>% tail
hc.group.6 %>% colMeans %>% sort %>% tail
hc.group.7 %>% colMeans %>% sort %>% tail

# Problem 2 - K-Means Clustering
k <- 7
set.seed(1000)
kmc <- kmeans(dk, centers = k)

kmc.groups <- kmc$cluster
table(kmc.groups)

kmc.group.1 <- subset(dk, kmc.groups == 1)
kmc.group.2 <- subset(dk, kmc.groups == 2)
kmc.group.3 <- subset(dk, kmc.groups == 3)
kmc.group.4 <- subset(dk, kmc.groups == 4)
kmc.group.5 <- subset(dk, kmc.groups == 5)
kmc.group.6 <- subset(dk, kmc.groups == 6)
kmc.group.7 <- subset(dk, kmc.groups == 7)

kmc.group.1 %>% colMeans %>% sort %>% tail
kmc.group.2 %>% colMeans %>% sort %>% tail
kmc.group.3 %>% colMeans %>% sort %>% tail
kmc.group.4 %>% colMeans %>% sort %>% tail
kmc.group.5 %>% colMeans %>% sort %>% tail
kmc.group.6 %>% colMeans %>% sort %>% tail
kmc.group.7 %>% colMeans %>% sort %>% tail

table(cluster.groups, kmc.groups)
