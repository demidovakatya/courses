# Recommendations Worth a Million: An Introduction to Clustering 

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
