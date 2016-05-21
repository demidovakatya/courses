# DOCUMENT CLUSTERING WITH DAILY KOS

# The file dailykos.csv contains data on 3,430 news articles or blogs that have been 
# posted on Daily Kos. Each of the variables in the dataset is a word that 
# has appeared in at least 50 different articles (1,545 words in total). 
# The set of  words has been trimmed according to some of the techniques covered 
# in the previous week on text analytics (punctuation has been removed, and 
# stop words have been removed). For each document, the variable values are the number of times that word appeared in the document. 

setwd("~/Documents/_courses/analytics-edge/week_6")
dk <- read.csv("dailykos.csv")
dim(dk) # [1] 3430 1545
# dk.matrix <- as.matrix(dk)
# dk.vector <- as.vector(dk.matrix)
# length(dk.vector)

dists <- dist(dk, method = "euclidean")
dk.cluster <- hclust(dists, method = "ward.D")
plot(dk.cluster)
