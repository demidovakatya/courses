# 1
# The R language is a dialect of which of the following programming languages?
# S

# 2
# The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition?
# The freedom to prevent users from using the software for undesirable purposes.

# 3
# In R the following are all atomic data types EXCEPT 
# data frame

4
If I execute the expression x <- 4 in R, what is the class of the object `x' as determined by the `class()' function?
x <- 4
numeric

5
What is the class of the object defined by x <- c(4, TRUE)?
numeric

6
If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression rbind(x, y)?
a matrix with three columns and two rows

7
A key property of vectors in R is that
elements of a vector all must be of the same class

8
Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[1]] give me?
a numeric vector of length 1.

8
Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[2]] give me?
a character vector containing the letter "a".

9
Suppose I have a vector x <- 1:4 and y <- 2:3. What is produced by the expression x + y?
an integer vector with the values 3, 5, 5, 7.

9
Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?
a numeric vector with elements 3, 4, 5, 6.

10
Suppose I have a vector x <- c(3, 5, 1, 10, 12, 6) and I want to set all elements of this vector that are less than 6 to be equal to zero. What R code achieves this?
x[x <= 5] <- 0

10
Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all elements of this vector that are greater than 10 to be equal to 4. What R code achieves this?
x[x > 10] <- 4

10
Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all elements of this vector that are greater than 10 to be equal to 4. What R code achieves this?
x[x >= 11] <- 4

11
In the dataset provided for this Quiz, what are the column names of the dataset?
names(data)
Ozone, Solar.R, Wind, Temp, Month, Day

12
Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
data[c(1:2),]
 Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2

13
How many observations (i.e. rows) are in this data frame?
nrow(data)
153

14
Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
data[c(nrow(data)-1, nrow(data)),]
   Ozone Solar.R Wind Temp Month Day
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30


15
What is the value of Ozone in the 47th row?
data[47,c("Ozone")]
21

16
How many missing values are in the Ozone column of this data frame?
table(factor(is.na(c(data$Ozone))))[2]
37

17
What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(data$Ozone[!is.na(data$Ozone)])
42.1

18
Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?

good <- complete.cases(data$Ozone, data$Solar.R, data$Temp)
mean(data$Solar.R[good & data$Ozone > 31 & data$Temp > 90])
212.8

19
What is the mean of "Temp" when "Month" is equal to 6? 

good <- complete.cases(data$Month, data$Temp)
mean(data$Temp[good & data$Month == 6])
79.1

20
What was the maximum ozone value in the month of May (i.e. Month = 5)?
max(data$Ozone[data$Month==5 & !is.na(data$Ozone)])
115