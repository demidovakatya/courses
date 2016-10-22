#' Building a Model with Top 10 Features
#'
#' This function develops a prediction algorithm based on the top 10 features
#' in 'x' that are most predictive of 'y'
#'
#' @param x a n x p matrix of n observations and p predictors
#' @param y a vector of length n representing the response
#' @return a vector of coefficients from the final fitted model taken from the 10 smallest p-values
#' @export
#' @importFrom stats lm

topten <- function(x, y) {
  p <- ncol(x)
  if(p < 10)
    stop("there are less than 10 predictors")
  pvalues <- numeric(p)
  for (i in seq_len(p)) {
    fit <- lm(y ~ x[, i])
    summ <- summary(fit)
    pvalues[i] <- summ$coefficients[2, 4]
  }
  ord <- order(pvalues)
  ord <- ord[1:10]
  x10 <- x[, ord]
  fit <- lm(y ~ x10)
  coef(fit)
}

#' Prediction with Top 10 Features
#'
#' This function takes a set of coefficients produced by \code{topten} function
#' and makes a prediction for each of the values provided in the input 'X' matrix.
#'
#' @param X a n x 10 matrix containing n new observations
#' @param b a vector of coefficients obtained from the \code{topten} function
#' @return a numeric vector containing the predicted values

predict10 <- function(X, b) {
  X <- cbind(1, X)
  drop(X %*% b)
}