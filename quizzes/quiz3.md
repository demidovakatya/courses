# Quiz 3

## Question 1

Which of the following items is required for an R package to pass R CMD check without any warnings or errors?

- a demo directory
- vignette
- unit tests
- example data sets
- **DESCRIPTION file**

(One or more options.)

## Question 2

Which of the following is a generic function in a fresh installation of R, with only the default packages loaded?

- `lm`
- `colSums`
- `dgamma`
- **`mean`**
- **`predict`**
- **`show`**

(One or more options.)

## Question 3

What function is used to obtain the function body for an S4 method function?

- `getS3method()` – gets a method for an S3 generic, possibly from a namespace or the generic's registry.
- `showMethods()` - shows a summary of the methods for one or more generic functions, possibly restricted to those involving specified classes.
- `getClass()` – gets the definition of a class.
- **`getMethod()`** – returns the method.

## Question 4

Please download the R package [DDPQuiz3](https://d396qusza40orc.cloudfront.net/devdataprod/DDPQuiz3_1.0.zip) from the course web site. Examine the 𝚌𝚛𝚎𝚊𝚝𝚎𝚖𝚎𝚊𝚗 function implemented in the R/ sub-directory. What is the appropriate text to place above the 𝚌𝚛𝚎𝚊𝚝𝚎𝚖𝚎𝚊𝚗 function for Roxygen2 to create a complete help file?

```
#' This function calculates the mean
#' 
#' @param x is a numeric vector
#' @return the mean of x
#' @export
#' @examples 
#' x <- 1:10
#' createmean(x)
```
