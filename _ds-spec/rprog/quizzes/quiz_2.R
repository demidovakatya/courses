
# 1. 
cube <- function(x, n) {
        x^3
}
cube(3)
# [1] 27

# 2. 
# The following code will produce a warning in R.
# Why?

x <- 1:10
if(x > 5) {
        x <- 0
}

# 'x' is a vector of length 10 and 'if' can only test a single logical statement.

 
# 3. 
f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}
z <- 10
f(3)
# [1] 10

# 4. 
x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}
y
# [1] 10

# 5. 
h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}
# Which symbol in the above function is a free variable?
# 
# f

# 6. 
# What is an environment in R?
# 
# a collection of symbol/value pairs

# 7. 
# The R language uses what type of scoping rule for resolving free variables?
# 
# lexical scoping

# 8. 
# How are free variables in R functions resolved?
# 
# The values of free variables are searched for in the environment in which the function was defined

# 9. 
# What is one of the consequences of the scoping rules used in R?
# 
# All objects must be stored in memory

# 10. 
# In R, what is the parent frame?
# 
# It is the environment in which a function was called
