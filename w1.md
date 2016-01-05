# Quiz 1: Exploring Data

1\. A researcher wants to measure physical height in as much detail as possible. Which level of measurement does s/he employ?

- Nominal level
- **Ratio level**
- Interval level
- Ordinal level

2\. You conduct a study on eye color and you question 550 people. 110 of them have brown eyes and 44% of them have blue eyes. What percentage of the people you questioned has blue or brown eyes?

```r
110 / 550
# [1] 0.2
0.2 + 0.44
# [1] 0.64
```

**64%**

3\. In which situation is a bar graph preferred to a pie chart?

- **When the number of categories in the data is high.**
- When one of the categories in the data is really large.
- When the number of categories in the data is low.
- When there are some large categories in the data.

4\. Ten students completed an exam. Their scores were: `5, 7, 2, 1, 3, 4, 8, 8, 6, 6`. What is the interquartilerange (IQR)?

```r
x <- c(5, 7, 2, 1, 3, 4, 8, 8, 6, 6)

quantile(x, 0.75) - quantile(x, 0.25)
# 3.5
IQR(x)
# [1] 3.5
```

- 5,5 
- 8 
- 5 
- **4**

5\. A researcher wants to know what people in Amsterdam think of football. He asks ten people to rate their attitude towards football on a scale from 0 (doesn't like football at all) to 10 (likes football a lot). The ratings are as follows: `1, 10, 6, 9, 2, 5, 6, 6, 5, 10`. What is the standard deviation?

```r
x <- c(1, 10, 6, 9, 2, 5, 6, 6, 5, 10)

sd(x)
# [1] 3.05505
```

- 9,3
- 6,0
- 9,2
- **3,1**

6\. You find a z-score of -1.99. Which statement(s) is/are true?

- **The score falls below the mean score.**
- **The score lies almost two standard deviations from the mean.**
- The standard deviation of the test is negative.
- 1.99 people scored higher than the person in question.

7\. Which of the following statements is true?

I. The stronger the skew, the smaller the difference between the median and the mean. **False**

II. The larger the variance, the smaller the standard deviation. **False**

- **Both statements are false.**
- Statement II is true, statement I is false.
- Statement I is true, statement II is false.
- Both statements are true.

8\. The grades for a statistics exam are as follows: `3, 5, 5, 6, 7.5, 6, 5, 1, 10, 4`. Which score is an outlier? (Use the interquartilerange (IQR).)

**10**

```r
x <- c(3, 5, 5, 6, 7.5, 6, 5, 1, 10, 4)

q1 <- quantile(x, 0.25)
# 4.25
q3 <- quantile(x, 0.75)
# 6
iqr <- IQR(x)
# [1] 1.75
q3 + 1.5 * iqr
# 8.625
q1 - 1.5 * iqr
# 1.625
```

9\. How many goals have the top strikers of the Dutch Eredivisie football competition scored? We look at 10 strikers and obtained the following information: `12, 10, 11, 12, 11, 14, 15, 18, 21, 11`. The (1) ... of the dataset equals 12, the mean equals (2) ... and the (3) ... equals 11. The standard deviation equals (4) ... Fill in the right words/numbers on the dots.

```r
x <- c(12, 10, 11, 12, 11, 14, 15, 18, 21, 11)

mean(x)
# [1] 13.5

median(x)
# [1] 12

sd(x)
# [1] 3.566822
```

- (1) Median, (2) 11, (3) Mode, (4) 3.57
- **(1) Median, (2) 13.5, (3) Mode, (4) 3.57**
- (1) Mode, (2) 13.5, (3) Median, (4) 12.72
- (1) Mode, (2) 11, (3) Median, (4) 12.72

10\. What is true about a variance of zero? (Multiple answers possible.)

- **There is no variability in the scores: everybody has the same score.**
- This is only the case when you take a sample of n=1.
- **The standard deviation equals zero as well.**

11\. What is the difference between variables and constants?

- Constants are discrete variables, variables are continuous variables.
- Variables are discrete variables, constants are continuous variables.
- **Variables vary across cases, constants do not vary.**
- Constants vary across cases, variables do not vary.
