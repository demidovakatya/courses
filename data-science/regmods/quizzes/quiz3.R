# Question 1
# Consider the mtcars data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight as confounder. Give the adjusted estimate for the expected change in mpg comparing 8 cylinders to 4.
summary(lm(mpg ~ as.factor(cyl) + wt, data = mtcars))$coef
# -6.071


# Question 2
# Consider the mtcars data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight as a possible confounding variable. Compare the effect of 8 versus 4 cylinders on mpg for the adjusted and unadjusted by weight models. Here, adjusted means including the weight variable as a term in the regression model and unadjusted means the model without weight included. What can be said about the effect comparing 8 and 4 cylinders after looking at models with and without weight included?.
summary(lm(mpg ~ as.factor(cyl) + wt, data = mtcars))$coef
summary(lm(mpg ~ as.factor(cyl), data = mtcars))$coef
# Holding weight constant, cylinder appears to have less of an impact on mpg than if weight is disregarded.

# Question 3
# Consider the mtcars data set. Fit a model with mpg as the outcome that considers number of cylinders as a factor variable and weight as confounder. Now fit a second model with mpg as the outcome model that considers the interaction between number of cylinders (as a factor variable) and weight. Give the P-value for the likelihood ratio test comparing the two models and suggest a model using 0.05 as a type I error rate significance benchmark.
fit1 <- lm(mpg ~ as.factor(cyl) + wt, data = mtcars)
fit2 <- lm(mpg ~ as.factor(cyl) * wt, data = mtcars)
anova(fit1, fit2, test="Chisq")
# The P-value is larger than 0.05. So, according to our criterion, we would fail to reject, which suggests that the interaction terms may not be necessary.

# Question 4
# Consider the mtcars data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight inlcuded in the model as
# 
# lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
# How is the wt coefficient interpretted?
# The estimated expected change in MPG per one ton increase in weight for a specific number of cylinders (4, 6, 8).

# Question 5
# Consider the following data set
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
# Give the hat diagonal for the most influential point
fit <- lm(y ~ x)

plot(x, y)
abline(fit)

hatvalues(fit)
hatvalues(lm(y ~ x))
# 0.9946

# Question 6
# Consider the following data set
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
# Give the slope dfbeta for the point with the highest hat value.
influence.measures(lm(y ~ x))
## Influence measures of
##   lm(formula = y ~ x) :
## 
##    dfb.1_     dfb.x     dffit cov.r   cook.d   hat inf
## 1  1.0621 -3.78e-01    1.0679 0.341 2.93e-01 0.229   *
## 2  0.0675 -2.86e-02    0.0675 2.934 3.39e-03 0.244    
## 3 -0.0174  7.92e-03   -0.0174 3.007 2.26e-04 0.253   *
## 4 -1.2496  6.73e-01   -1.2557 0.342 3.91e-01 0.280   *
## 5  0.2043 -1.34e+02 -149.7204 0.107 2.70e+02 0.995   *

# -134

# Question 7
# Consider a regression relationship between Y and X with and without adjustment for a third variable Z. Which of the following is true about comparing the regression coefficient between Y and X with and without adjustment for Z.
# It is possible for the coefficient to reverse sign after adjustment. For example, it can be strongly significant and positive before adjustment and strongly significant and negative after adjustment.