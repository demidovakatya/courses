# VISUALIZING NETWORK DATA

library(ggplot2)
library(igraph)

edges <- read.csv("edges.csv")
users <- read.csv("users.csv")

# Problem 1 - Summarizing the Data

nrow(users)
c(edges$V1, edges$V2)

table(users$locale)
table(users$school, users$gender)

# Problem 2 - Creating a Network

g <- graph.data.frame(edges, FALSE, users)

plot(g, vertex.size = 5, vertex.label = NA)

length(degree(g)[degree(g) >= 10])

V(g)$size <- degree(g)/2 + 2
plot(g, vertex.label = NA)
summary(V(g)$size)

# Problem 3 - Coloring Vertices

V(g)$color <- "black"
V(g)$color[V(g)$gender == "A"] <- "red"
V(g)$color[V(g)$gender == "B"] <- "gray"
plot(g, vertex.label = NA)

V(g)$color <- "black"
V(g)$color[V(g)$school == "A"] <- "red"
V(g)$color[V(g)$school == "AB"] <- "gray"
plot(g, vertex.label = NA)

V(g)$color <- "black"
V(g)$color[V(g)$locale == "A"] <- "red"
V(g)$color[V(g)$locale == "B"] <- "gray"
plot(g, vertex.label = NA)

