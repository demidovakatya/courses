# Quiz 2: Correlation and Regression


1\. You want to show the results of a study in a graph. When assessing only one ordinal or nominal variable it is sufficient to use a (1) .... When looking at the relationship between two of these ordinal or nominal variables you'd better use a (2) .... When you're assessing the correlation between two continuous variables it's best to use a (3) ... Fill in the right words on the dots.

- (1) Contingency table, (2) Scatterplot, (3) Frequency table
- (1) Contingency table, (2) Frequency table, (3) Scatterplot
- (1) Scatterplot, (2) Frequency table, (3) Contingency table
- **(1) Frequency table, (2) Contingency table, (3) Scatterplot**


2\. Which statement(s) about correlations is/are right?

I. When dealing with a positive Pearson's `r`, the line goes up. True

II. When the observations cluster around a straight line we're dealing with a linear relation between the variables. True

III. The steeper the line, the smaller the correlation. False

- All statements are true.
- Statement I and III are true, statement II is false.
- **Statement I and II are true, statement III is false.**
- Statement II is true, statements I and III are false.


3\. You've collected the following data about the amount of chocolate people eat and how happy these people are.

Amount of chocolate bars a week: `2, 4, 1.5, 2, 3`.

Grades for happiness: `7, 3, 8, 8, 6`.

(Note, the numbers are in the right order so person one eats 2 chocolate bars and scores her happiness with a 7.)

Compute the Pearson's `r` (2 decimals).

**-0.96**

```r
x <- c(2, 4, 1.5, 2, 3)
y <- c(7, 3, 8, 8, 6)

cor(x, y)
# [1] -0.9644856
```


4\. You've investigated how eating chocolate bars influences a student's grades. You've done this by asking people to keep track of their chocolate intake (in bars per week) and by assessing their exam results one day later. Which statement(s) about the regression line `y-hat = 0.66x + 1.99` is/are true?

- If your grade becomes one point higher, you will eat `0.66` more chocolate a week.
- Eating chocolate bars makes your grades lower.
- **If you eat one more chocolate bar a week, your grade becomes `0.66` higher.**
- **If you don't eat chocolate at all, your grade will equal `1.99`.**


5\. A professor uses the following formula to grade a statistics exam:

`y-hat = 0.5 + 0.53x`. After obtaining the results the professor realizes that the grades are very low, so he might have been too strict. He decides to level up all results by one point. What will be the new grading equation?

- `y-hat = 0.5 + 0.53x`
- **`y-hat = 1.5 + 0.53x`**
- `y-hat + 1 = 0.5 + 0.53x`
- `y-hat = 1.5 + 1.53x`


6\. What is the explained variance? And how can you measure it?

- The explained variance is the variance of the dependent variable. You can measure this with `r-squared`.
- The explained variance is the percentage of the variance in the dependent variable that can be explained using the formula of the regression line. You can measure this with Pearson's `r`.
- **The explained variance is the percentage of the variance in the dependent variable that can be explained using the formula of the regression line. You can measure this with `r-squared`.**
- The explained variance is the variance of the dependent variable. You can measure this with Pearson's `r`.


7\. Put in increasing order.

(1) `r = .80` (`=> R-squared = .64`)

(2) You can predict `Y` based on `X` for 50 percent. (`=> R-squared = .5`)

(3) `R-squared = .78`

- (1) (3) (2)
- (1) (2) (3)
- **(2) (1) (3)**
- (2) (3) (1)


8\. A teacher asks his students to fill in a form about how many cigarettes they smoke every week and how much they weigh. After obtaining the results he makes a scatterplot and analyses the datapoints. He computes the Pearson's `r` to assess the correlation. He finds a correlation of `.80`. He concludes that smoking more cigarettes causes high body weight. What is wrong with this analysis?

- A correlation of `.80` is too low to conclude anything about the relationship between smoking and body weight.
- **He concludes that smoking causes high body weight. This is not possible after having conducted a regression analysis.**
- There is nothing wrong with the analysis.
- He uses a scatterplot. He has to use a frequency table.


9\. What can you conclude about a Pearson's `r` that is bigger than 1?

- The correlation is very high.
- **This is impossible. Correlations are always between -1 and 1.**
- There is a non-lineair relationship between X and Y.
- This is impossible. Correlations are always between 0 and 1.


10\. Why do you use squared residuals when computing the regression line?

- To balance the results (because you take the squared root later on).
- **Because the residuals equal each other out (i.e. their sum equals zero).**
- To make the differences between the predicted values and the real datapoints even clearer.
- Because you have an X-value and a Y-value for every datapoint.
