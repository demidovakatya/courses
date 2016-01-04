# Quiz 4: Probability distributions


1\. The ice cream shop has problems with the delivery of the different flavours. As a consequence the shop doesn't have the same amount of flavours every day. In the following table you see the probability distribution of the different amounts of flavours.

```
Amount of flavours (probability)
4                  (0.14)
5                  (0.35)
6                  (0.31)
7                  (0.20)
```

What is the mean amount of flavours the ice cream shop sells?

```r
4 * 0.14 + 5 * 0.35 + 6 * 0.31 + 7 * 0.20
# [1] 5.57
```

2\. Which of the following statements is correct?

I. A discrete random variable can take a finite number of distinct values. True

II. Height (as measured in cm) is an example of a continuous random variable. True

- Statement II is true, statement I is false.
- **Both statements are true.**
- Both statements are false.
- Statement I is true, statement II is false.


3\. A researcher is interested in the time people spend online on social media per day. She plots the probability distribution for this variable using hours as the unit, and it looks as follows.

![](/images/quiz34-graph.png)

What happens to the graph if she decides to measure the time in minutes instead of hours?

- The graph stays the same. Only the values on the x-axis change.
- The graph becomes flatter.
- The graph becomes steaper.
- **The graph stays the same apart from the values on both axes.**


4\. Consider the following discrete probability distribution.

```
X   P(x)
1   0.20
2   0.33
3   0.06
4   0.27
5   0.14
```

What is the probability of X being higher than 2? 

```r
0.06 + 0.27 + 0.14
# [1] 0.47
```

- `0.80`
- `0.53`
- `0.33`
- **`0.47`**


5\. You investigate the number of earthquakes that occur in a year. You get the following outcomes:

![](/images/quiz4-earthquake.png)

What is the variance of this random phenomenon?

```r
0.95 * 0 + 0.03 * 1 + 0.02 * 2
# [1] 0.07

(0.07 - 0) ^ 2 * 0.95 + (0.07 - 1) ^ 2 * 0.03 + (0.07 - 2) ^ 2 * 0.02
# [1] 0.1051
```

6\. You have a random variable X with variance 3. Now you multiply X with 2. What becomes the variance of X?

- **12**
- 3
- 7
- 6


7\. Imagine you're investigating the time people wait at traffic lights, a variable which appears to be approximately normally distributed with a mean of `1.3` minutes and a standard deviation of `0.57` minutes. Which of the following intervals contains 95% of the waiting times?

```r
1.3 - 2 * 0.57
# [1] 0.16

1.3 + 2 * 0.57
# [1] 2.44
```

- **`0.16` and `2.44`**
- `0.16` and `1.3`
- `1.3` and `2.44`
- `0.73` and `1.87`


8\. You investigate the amount of money football payers make a week. The mean equals €10.000. The standard deviation equals €6.000. Messi makes €22.000. What is the corresponding z-score of Messi's earnings?

```r
(22000 - 10000) / 6000
# [1] 2
```


9\. On average, a fraction `0.48` of newborns are girls. What are the chances that in a family with 4 children there are exactly three daughters.

```r
factorial(4) * 0.48 ^ 3 * (1 - 0.48) / (factorial(3) * factorial(4 - 3)) 
# [1] 0.2300314
```

10\. Looking at the binomial distribution above, what would be reasonable values for the parameters of this distribution?

![](/images/quiz4-binomial.png)

- number of trials = 2, probability of success = `0.29`
- number of trials = 20, probability of success = `0.29`
- number of trials = 2, probability of success = `0.1`
- **number of trials = 20, probability of success = `0.1`**


11\. A multiple choice exam consists of 12 questions, each having 5 possible answers. To pass you must answer at least 8 out of 12 correctly. What are your chances if you go into the exam without knowing a thing and have to resort to pure guessing?

```r
(factorial(12)/(factorial(8)*factorial(4))) * (0.2 ^ 8) * (0.8 ^ 4)
# [1] 0.0005190451
```

12\. The total time that I wait for busses on a long trip has the following probability density function.

![](/images/quiz4-waiting-time.png)

If I wait for more than 30 minutes I will be late for my appointment. What is the chance that this may happen?

```r
0.5 * 10 * 0.025
# [1] 0.125
```

13\. The following equation describes a normal distribution for a random variable X.

![](/images/quiz4-equation.png)

It appears that the time people in the age range of 20 to 50 years spend sleeping is approximately normally distributed with a mean of 7 hours and a standard deviation of 1 hour. Can you estimate the height of this probability density curve at the mean and also give the unit of this value?

```r
0.4
```


14\. For a normally distributed variable with a mean of 10 and standard deviation of 5, what is the proportion of the data with negative values? 

```r
pnorm(0, 10, 5)
# [1] 0.02275013
# or 0.025
```

15\. The following figure shows two lines that are meant to represent the cumulative probability distribution of the age of trees in a young forest where the oldest tree is 10 years.

![](/images/quiz4-cdf.png)

What can you say about these two cumulative distribution functions (`cdf`s)?

- **Neither of these is a proper `cdf`.**
- The dotted line represents a proper `cdf`, the dashed line doesn't.
- The dashed line represents a proper `cdf`, the dotted doesn't.
- Both lines can be proper `cdf`s.
