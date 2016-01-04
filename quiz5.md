# Quiz 5: Sampling distributions


1\. What is the difference between descriptive and inferential statistics?

- Where inferential statistics only concerns the sample, descriptive statistics concerns the underlying population.
- **Where descriptive statistics only concerns the sample, inferential statistics concerns the underlying population.**
- Where descriptive statistics is used with discrete variables, inferential statistics is used with continous variables.
- Where inferential statistics is used with discrete variables, descriptive statistics is used with continous variables.


2\. ![](/images/quiz5-symbols.png)

- 1(a), 2(b), 3(c), 4(d)
- 1(b), 2(c), 3(a), 4(d)
- **1(a), 2(b), 3(d), 4(c)**
- 1(d), 2(c), 3(a), 4(b)


3\. Which of the statement(s) is/are correct?

I. A disadvantage of a telephone interview compared to a face-to-face questionnaire is that people tend to be less patient. True

II. The cheapest way of collecting data is an online survey. True

- Both statements are incorrect.
- Statement II is correct, statement I is incorrect.
- **Both statements are correct.**
- Statement I is correct, statement II is incorrect.


4\. How do you call the bias that can occur when not everybody from the population is included in the sampling frame?

- Sampling bias
- **Undercoverage**
- Respons bias
- Convenience sampling


5\. Imagine you want to know the length of the beard of every male student in America. You know that the population mean equals `2.2` millimeters and the population standard deviation equals `0.9` millimeters. What will be the mean (in millimeters) of the sampling distribution of the sample mean (i.e., if you take an infinite number of samples)?

`x-bar = µ = **2.2**`

6\. What is the central limit theorem?

- The central limit theorem says that the population distribution approximates a bell shape given that the sample is large enough.
- The central limit theorem says that the mean is centered if the sample size approximates infinity.
- The central limit theorem says that the sampling distribution approximates a bell shape given that the sample is large enough and the population distribution is bell shaped.
- **The central limit theorem says that the sampling distribution approximates a bell shape given that the sample is large enough.**


7\. Which of the following statement(s) is/are true?

- **The larger the variability in the population distribution, the larger the variability in the sampling distribution of the sample mean.**
- The standard deviation of the sampling distribution of the sample mean is not affected by the sample size.
- **The sampling distribution of the sample mean is the distribution of an infinite number of sample means (with a given sample size).**
- The larger the sample, the more the standard deviation of the sampling distribution of the sample mean resembles the standard deviation in the population.


8\. You know that the sample size is larger than 30.

![](/images/quiz5-skewed.png)

- This is a population distribution.
- **This could be a population distribution or a data distribution.**
- This is a sampling distribution. - No, it would be bell-shaped given n > 30.
- This could be a population distribution, a data distribution or a sampling distribution.


9\. You know that twenty percent of the people in Amsterdam describe themselves as Hipsters. You ask 400 respondents if they identify as a Hipster or not. What is the standard deviation of the sampling distribution of the sample proportion?

```r
# Population proportion: π = 0.2
# Sample size: n = 400

sqrt(0.2 * 0.8 / 400)
# [1] 0.02
```

10\. Which conclusion can you draw if a data distribution is very different from the corresponding population distribution (provided that the sample size is very large)?

- The population is biased.
- You cannot conclude anything at this point. You have to do further research.
- **The sample is biased and does not represent the population well.**
- This is not a problem. Just continue the analysis.
