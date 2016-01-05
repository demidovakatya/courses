# Quiz 6: Confidence intervals


1\. You want to know how many hours of sleep new parents lose after they had their first baby. You know that the population mean equals `2.3` hours. Because you can't investigate the whole population, you take a sample of 100 people. You find an average sleep loss of `2.1` hours. What is, based on this sample, the point estimate of your population mean?

- **`2.1`**
- `0.2`
- `2.3`
- `5.4`


2\. Which of the following statement(s) is/are correct?

I. When you want to be really sure that you don't draw the wrong conclusions (e.g., when deciding about administering heavy medication or not) it is always best to use a 90% confidence interval instead of a 95% or a 99% confidence interval. False

II. 95% of the values under the normal distribution will fall between `-1.96` and `1.96` standard deviations of the mean. True

- Both statements are incorrect.
- **Statement II is correct, statement I is incorrect.**
- Both statements are correct.
- Statement I is correct, statement II is incorrect.


3\. Because of their sleep deprivation new parents have a hard time focusing. The average number of minutes a new parent can focus equals `3.7`. The standard deviation equals `0.8`. You assess how long 150 randomly selected new parents can focus and find that the mean equals `3.8` minutes and the standard deviation equals `0.5`. What is the 95% confidence interval?

```r
# 95% confidence interval: CI = x-bar ± 1.96 * sd (sd = sigma / sqrt(n))

3.8 + 1.96 * 0.8 / sqrt(150)
# [1] 3.928027
3.8 - 1.96 * 0.8 / sqrt(150)
# [1] 3.671973
```

- `(3.72, 3.88)`
- `(3.57, 3.83)`
- **`(3.67, 3.93)`**
- `(3.79, 3.81)`


4\. You've asked 55 parents if they have more than one child. It turns out that 77 in 100 parents have more than one child. Compute the 99% confidence interval.

```r
0.77 + 2.58 * sqrt(0.77 * (1 - 0.77) / 55)
# [1] 0.9164022
0.77 - 2.58 * sqrt(0.77 * (1 - 0.77) / 55)
# [1] 0.6235978
```

- `(63, 91)`
- `(0.63, 0.91)`
- **`(62, 92)`**
- `(0.62, 0.92)`


5\. A researcher wants to investigate the driving capabilities of new parents. He doesn't know anything about the population so he decides to draw a simple random sample of 88 new parents and to make inferences based on that sample. He makes the new parents drive in a simulator and finds that, on average, they make `2.1` more accidents than people who have not become a parent recently. What are the degrees of freedom?

```r
88 - 1
[1] 87
```


6\. A researcher wants to investigate the driving capabilities of new parents. He draws a simple random sample of 88 new parents and lets them take a test in a drive simulator. He finds that, on average, they fall asleep after `2.1` hours. The standard deviation equals `0.5` hours. Compute the 90% confidence interval.

```r
# n = 88, x-hat = 2.1, s = 0.5
# t = 1.671

2.1 - 1.671 * 0.5 / sqrt(88)
# [1] 2.010935
2.1 + 1.671 * 0.5 / sqrt(88)
# [1] 2.189065
```

- `(2.00, 2.20)`
- `(1.99, 2.21)`
- **`(2.01, 2.19)`**
- `(2.02, 2.18)`


7\. Which assumptions don't need to be satisfied for the construction of a confidence interval for a mean?

- **The independent variable must be discrete.**
- The sample must be random.
- **The relationship between X and Y must be linear.**
- **The sample mean must be equal to the population mean.**


8\. The following statements are about confidence intervals for proportions. Place in order from smallest to largest z-score.

(1) 99% confidence interval (`z = 2.33`)

(2) `z = 1.645`

(3) `point estimate ± 1.96 * SE`

- `(2) (1) (3)`
- `(1) (3) (2)`
- `(3) (2) (1)`
- **`(2) (3) (1)`**


9\. A professor wants to know the percentage of new parents who, in the first months after having a baby, sleep more than 2 hours per night less. She wants a margin of error up to `0.10`. How many parents does she have to include with a 90% confidence interval? Choose the 'save approach'.

```r
# Margin of error: 0.1
# z-score (for 90%): 1.645

0.25 * (1.645 ^ 2) / (0.1 ^ 2)
# [1] 67.65062
```

- **68**
- 67
- 96
- 97


10\. You have constructed a 99% confidence interval around your sample mean of `11.4`. The confidence interval is as follows: `(10.1, 12.7)`. Imagine you take a new sample from the same population and the mean now equals `11.6`. What happens to the confidence interval?

- **The confidence interval shifts because of the new mean.**
- It depends on the standard deviation of the new sample whether the confidence interval shifts or not.
- The confidence interval stays the same.
- You need the population mean to say what happens to the confidence interval.
