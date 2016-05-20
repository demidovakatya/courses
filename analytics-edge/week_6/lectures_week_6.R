# Recommendations Worth a Million: An Introduction to Clustering ----

# euclidean distance
a <- c(0,1,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0)
b <- c(0,1,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0)
(d <- (a - b) ^ 2 %>% sum %>% sqrt())

# Video 6: Getting the Data -----
movies <- read.table("movieLens.txt", header = F, sep = "|", quote = "\"")
str(movies)

colnames(movies) <- c("ID", "Title", "ReleaseDate", "VideoReleaseDate", "IMDB", 
                      "Unknown", "Action", "Adventure", "Animation", "Childrens", 
                      "Comedy", "Crime", "Documentary", "Drama", "Fantasy", 
                      "FilmNoir", "Horror", "Musical", "Mystery", "Romance", 
                      "SciFi", "Thriller", "War", "Western")
movies <- movies %>% select(-one_of(c("ID", "ReleaseDate", "VideoReleaseDate", "IMDB")))
movies <- unique(movies)
str(movies)

table(movies$Comedy)
table(movies$Western)
table(movies$Romance, movies$Drama)


# Video 7: Hierarchical Clustering in R ------
dists <- dist(movies[2:20], method = "euclidean")
movies.cluster <- hclust(dists, method = "ward.D")
plot(movies.cluster)

cluster.groups <- cutree(movies.cluster, k = 10)
tapply(movies$Action, cluster.groups, mean)
tapply(movies$Romance, cluster.groups, mean)
# The following command will split the data into subsets based on the clusters:
spl <- split(movies[2:20], cluster.groups)
# The following command will output the cluster centroids for all clusters:
lapply(spl, colMeans)

cluster.groups <- cutree(movies.cluster, k = 2)
movies[2:20] %>% subset(cluster.groups == 1) %>% colMeans
movies[2:20] %>% subset(cluster.groups != 1) %>% colMeans

# Seeing the Big Picture: Segmenting Images to Create Data (Recitation) ----- 
# Video 2: Clustering Pixels ------
flower <- read.csv("flower.csv", header = F)

flower.matrix <- as.matrix(flower)
str(flower.matrix)

flower.vector <- as.vector(flower.matrix)
str(flower.vector)

distance <- dist(flower.vector, method = "euclidean")
cluster.intensity <- hclust(distance, method = "ward.D")

plot(cluster.intensity)
rect.hclust(cluster.intensity, k = 3, border = "red")

cluster.groups <- cutree(cluster.intensity, k = 3) 
table(cluster.groups)
tapply(flower.vector, cluster.groups, mean)

#the original picture is 50x50 px 
dim(cluster.groups) <- c(50, 50) 

image(cluster.groups)
image(flower.matrix, axes = F, col = grey(seq(0, 1, length.out = 256)))


# Video 4: MRI Image ----
healthy <- read.csv("healthy.csv", header = F)
dim(healthy)

healthy.matrix <- as.matrix(healthy)
length(healthy.matrix)
image(healthy.matrix, axes = F, col = grey(seq(0, 1, length.out = 256)))

healthy.vector <- as.vector(healthy.matrix)
length(healthy.vector)

# Video 5: K-Means Clustering
k <- 5
set.seed(1)
kmc <- kmeans(healthy.vector, centers = k, iter.max = 1000)

healthy.clusters <- kmc$cluster
kmc$centers[2]

(dim(healthy.clusters) <- c(nrow(healthy.matrix), ncol(healthy.matrix)))
image(healthy.clusters, axes = FALSE, col = rainbow(k))


# Video 6. Detecting Tumors -----

# creating test vector
tumor <- read.csv("tumor.csv", header = F)
tumor.matrix <- as.matrix(tumor)
tumor.vector <- as.vector(tumor.matrix)
image(tumor.matrix, axes = F, col = grey(seq(0, 1, length.out = 256)))

# apply clusters from "healthyæ (before) to new image, using the flexclust package
library(flexclust)

kmc.kcca <- as.kcca(kmc, healthy.vector)
tumor.clusters <- predict(kmc.kcca, newdata = tumor.vector)

# Visualize the clusters
dim(tumor.clusters) <- c(nrow(tumor.matrix), ncol(tumor.matrix))
image(tumor.clusters, axes = FALSE, col = rainbow(k))


