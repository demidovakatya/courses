library(lpSolve)

## Video 4: Solving the Problem -------------------------

# x1 = Number of regular seats
# x2 = Number of discount seats
## Problem setup: Maximize
# 617 x1 + 238 x2 subject to
# Constraints:
#     x1 + 0   x2 <= 100
#  0  x1 + 1   x2 <= 150
#     x1 +     x2 <= 166

# Coefficients for objective function
f.obj <- c(617, 238)
# Coefficient matrix of constraints
f.con <- rbind(diag(2), matrix(1, nrow = 1, ncol = 2))
# Vector of signs (length = number of equations/rows in constraint matrix)
f.dir <- rep("<=", 3)
# Constraint values
f.rhs <- c(100, 150, 166)

# Solver
res <- lp("max", f.obj, f.con, f.dir, f.rhs)
res$objval
res$solution


##  -------------------------

## Problem setup: Maximize
# 428 x1 + 190 x2 + 642 x3 + 224 x4 + 512 x5 + 190 x6 subject to
# Constraints:
#     x1 +   0 x2 +   0 x3 +   0 x4 +   0 x5 +   0 x6 <= 80
#   0 x1 +     x2 +   0 x3 +   0 x4 +   0 x5 +   0 x6 <= 120
#   0 x1 +   0 x2 +     x3 +   0 x4 +   0 x5 +   0 x6 <= 75
#   0 x1 +   0 x2 +     x3 +     x4 +   0 x5 +   0 x6 <= 100
#   0 x1 +   0 x2 +   0 x3 +   0 x4 +     x5 +   0 x6 <= 60
#   0 x1 +   0 x2 +   0 x3 +   0 x4 +   0 x5 +     x6 <= 110
#     x1 +     x2 +     x3 +     x4 +   0 x5 +   0 x6 <= 166
#     x1 +     x2 +   0 x3 +   0 x4 +     x5 +     x6 <= 166

# x1 = Number of regular seats b/w JFK-LAX
# x2 = Number of discount seats b/w JFK-LAX
# x3 = Number of regular seats b/w JFK-DFW
# x4 = Number of discount seats b/w JFK-DFW
# x5 = Number of regular seats b/w DFW-LAX
# x6 = Number of discount seats b/w DFW-LAX

# Coefficients for objective function
f.obj <- c(428, 190, 642, 224, 512, 190)
# Coefficient matrix of constraints
f.con <- rbind(diag(6), 
               matrix(c(1, 1, 1, 1, 0, 0), nrow = 1, ncol = 6), 
               matrix(c(1, 1, 0, 0, 1, 1), nrow = 1, ncol = 6))
# Vector of signs (length = number of equations/rows in constraint matrix)
f.dir <- rep("<=", 8)
# Constraint values
f.rhs <- c(80, 120, 75, 100, 60, 110, 166, 166)

# Solver
res <- lp("max", f.obj, f.con, f.dir, f.rhs)
res$objval
    matrix(res$solution, nrow = 6, byrow = T)
