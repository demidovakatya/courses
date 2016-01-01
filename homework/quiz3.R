# Question 1
# In a population of interest, a sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. What is a 95% Student's T confidence interval for the mean brain volume in this new population?
m <- 1100 # sample average, X-bar
sd <- 30 # st. deviation
n <- 9 # number of observations
p <- 0.95 + (1 - 0.95) / 2
conf <- round(m + c(-1, 1) * qt(p = p, df = n-1) * sd/sqrt(n)) # confidence interval
# [1077,1123]

# Question 2
# A diet pill is given to 9 subjects over six weeks. The average difference in weight (follow up - baseline) is -2 pounds. What would the standard deviation of the difference in weight have to be for the upper endpoint of the 95% T confidence interval to touch 0?
n <- 9
m <- -2 # sample average
p <- 0.95 + (1 - 0.95) / 2 # 0.975
# sd is unknown
conf.upper <- 0
# conf.upper = m + qt(p, n-1) * sd / sqrt(n)
sd <- (conf.upper - m) * sqrt(n) / qt(p, n-1)
# 2.60

# Question 3
# In an effort to improve running performance, 5 runners were either given a protein supplement or placebo. Then, after a suitable washout period, they were given the opposite treatment. Their mile times were recorded under both the treatment and placebo, yielding 10 measurements with 2 per subject. The researchers intend to use a T test and interval to investigate the treatment. Should they use a paired or independent group T test and interval?
# A paired interval

# Question 4
# In a study of emergency room waiting times, investigators consider a new and the standard triage systems. To test the systems, administrators selected 20 nights and randomly assigned the new triage system to be used on 10 nights and the standard system on the remaining 10 nights. They calculated the nightly median waiting time (MWT) to see a physician. The average MWT for the new system was 3 hours with a variance of 0.60 while the average MWT for the old system was 5 hours with a variance of 0.68. Consider the 95% confidence interval estimate for the differences of the mean MWT associated with the new system. Assume a constant variance. What is the interval? Subtract in this order (New System - Old System).
n1 <- 10
m1 <- 5
var1 <- 0.68 # var = s ^ 2
n2 <- 10
m2 <- 3
var2 <- 0.6
# pooled sd
sp <- sqrt(((n1 - 1) * var1 + (n2 - 1) * var2) / (n1 + n2 - 2)) 
conf <- (m2 - m1) + c(-1, 1) * qt(0.975, df = (n1 + n2 - 2)) * sp * sqrt(1/n1 + 1/n2)
# [-2.75, -1.25]

# Question 5
# Suppose that you create a 95% T confidence interval. You then create a 90% interval using the same data. What can be said about the 90% interval with respect to the 95% interval?
p1 <- 0.95 + (1 - 0.95) / 2 
p2 <- 0.90 + (1 - 0.90) / 2
m <- 1100 # sample average, X-bar
sd <- 30 # st. deviation
n <- 9 # number of observations
conf1 <- round(m + c(-1, 1) * qt(p = p1, df = n-1) * sd/sqrt(n)) 
conf2 <- round(m + c(-1, 1) * qt(p = p2, df = n-1) * sd/sqrt(n))
conf1
conf2
# The interval will be narrower.

# Question 6
# To further test the hospital triage system, administrators selected 200 nights and randomly assigned a new triage system to be used on 100 nights and a standard system on the remaining 100 nights. They calculated the nightly median waiting time (MWT) to see a physician. The average MWT for the new system was 4 hours with a standard deviation of 0.5 hours while the average MWT for the old system was 6 hours with a standard deviation of 2 hours. Consider the hypothesis of a decrease in the mean MWT associated with the new treatment. What does the 95% independent group confidence interval with unequal variances suggest vis a vis this hypothesis? (Because there's so many observations per group, just use the Z quantile instead of the T.)
n1 <- 100
m1 <- 6
sd1 <- 2
var1 <- sd1^2
n2 <- 100
m2 <- 4
sd2 <- 0.5
var2 <- sd2^2
p <- 0.975
sp <- sqrt(((n1 - 1) * var1 + (n2 - 1) * var2) / (n1 + n2 - 2)) 
conf <- (m1 - m2) + c(-1, 1) * qt(p, df = (n1 + n2 - 2)) * sp * sqrt(1/n1 + 1/n2)
conf
# When subtracting (old - new) the interval is entirely above zero. The new system appears to be effective.

# Question 7
#Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo. Subjects’ body mass indices (BMIs) were measured at a baseline and again after having received the treatment or placebo for four weeks. The average difference from follow-up to the baseline (followup - baseline) was −3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. The corresponding standard deviations of the differences was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI over the four week period appear to differ between the treated and placebo groups? Assuming normality of the underlying data and a common population variance, calculate the relevant *90%* t confidence interval. Subtract in the order of (Treated - Placebo) with the smaller (more negative) number first.
# the treated group
n1 <- 9
m1 <- -3
sd1 <- 1.5
var1 <- sd1 ^ 2
# the placebo group
n2 <- 9
m2 <- 1
sd2 <- 1.8
var2 <- sd2 ^ 2
# pooled sd
sp <- sqrt(((n1 - 1) * var1 + (n2 - 1) * var2) / (n1 + n2 - 2))
p <- 0.9 + (1-0.9)/2
conf <- (m1 - m2) + c(-1, 1) * qt(p, df = (n1 + n2 - 2)) * sp * sqrt(1/n1 + 1/n2)
conf
#[-5.364, -2.636]