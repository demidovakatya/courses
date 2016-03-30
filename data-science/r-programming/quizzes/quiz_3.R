library(datasets)
data(iris)
data.frame(iris)

v <- mean(iris$Sepal.Length[iris$Species=="virginica"])
round(v)

apply(iris[, 1:4], 1, mean)

data(mtcars)
data.frame(mtcars)

with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)

round(209.21429 - 82.63636)
# 127

# If you run
# debug(ls)
# what happens when you next call the 'ls' function?
# Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.
