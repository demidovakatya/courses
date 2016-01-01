# Question 1
# A pharmaceutical company is interested in testing a potential blood pressure lowering medication. Their first examination considers only subjects that received the medication at baseline then two weeks later. The data are as follows (SBP in mmHg)
# Subject	Baseline	Week 2
# 1     	140	      132
# 2	      138	      135
# 3	      150	      151
# 4     	148	      146
# 5	      135     	130
# Consider testing the hypothesis that there was a mean reduction in blood pressure? Give the P-value for the associated two sided T test.
# (Hint, consider that the observations are paired.)
x <- c(140, 138, 150, 148, 135)
y <- c(132, 135, 151, 146, 130)
t.test(x, y, paired = T)
# 0.087

# Question 2
# A sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. What is the complete set of values of μ0 that a test of H0:μ=μ0 would fail to reject the null hypothesis in a two sided 5% Students t-test?
n <- 9
m <- 1100
sd <- 30
p <- 0.975
(conf <- m + c(-1, 1)*qt(p, df = n - 1)*sd/sqrt(n))
# 1077 to 1123

# Question 3
# Researchers conducted a blind taste test of Coke versus Pepsi. Each of four people was asked which of two blinded drinks given in random order that they preferred. The data was such that 3 of the 4 people chose Coke. Assuming that this sample is representative, report a P-value for a test of the hypothesis that Coke is preferred to Pepsi using a one sided exact test.
n <- 4
x <- 3
binom.test(x, n, alternative = "greater")
# 0.31

# Question 4
# Infection rates at a hospital above 1 infection per 100 person days at risk are believed to be too high and are used as a benchmark. A hospital that had previously been above the benchmark recently had 10 infections over the last 1,787 person days at risk. About what is the one sided P-value for the relevant test of whether the hospital is *below* the standard?
# 
# 0.03
# 0.11
# 0.22
# 0.52


# Question 5
# Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo. Subjects’ body mass indices (BMIs) were measured at a baseline and again after having received the treatment or placebo for four weeks. The average difference from follow-up to the baseline (followup - baseline) was −3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. The corresponding standard deviations of the differences was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI appear to differ between the treated and placebo groups? Assuming normality of the underlying data and a common population variance, give a pvalue for a two sided t test.
# 
# Less than 0.01
# Less than 0.05, but larger than 0.01
# Larger than 0.10
# Less than 0.10 but larger than 0.05
# Question 6
# Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to 1,123 cc. Would you reject in a two sided 5% hypothesis test of H0:μ=1,078?
# 
# It's impossible to tell.
# No you wouldn't reject.
# Where does Brian come up with these questions?
# Yes you would reject.
# Question 7
# Researchers would like to conduct a study of 100 healthy adults to detect a four year mean brain volume loss of .01 mm3. Assume that the standard deviation of four year volume loss in this population is .04 mm3. About what would be the power of the study for a 5% one sided test versus a null hypothesis of no volume loss?
# 
# 0.80
# 0.70
# 0.50
# 0.60

# Question 8
# Researchers would like to conduct a study of n healthy adults to detect a four year mean brain volume loss of .01 mm3. Assume that the standard deviation of four year volume loss in this population is .04 mm3. About what would be the value of n needded for 90% power of type one error rate of 5% one sided test versus a null hypothesis of no volume loss?
# 
# 180
# 160
# 120
# 140
# Question 9
# As you increase the type one error rate, α, what happens to power?
# 
# You will get larger power.
