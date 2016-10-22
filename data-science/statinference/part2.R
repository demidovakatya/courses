# 1. Load the ToothGrowth data and perform some basic exploratory data analyses 
# 2. Provide a basic summary of the data.
# 3. Use confidence intervals and/or hypothesis tests to compare tooth growth by supp and dose. (Only use the techniques from class, even if there's other approaches worth considering)
# 4. State your conclusions and the assumptions needed for your conclusions. 

# 1
library(ggplot2)

library(datasets)
tg <- ToothGrowth
str(tg)
head(tg)
summary(tg)

tg$dose <- as.factor(tg$dose)
str(tg)

# 2
ggplot(data = tg, aes(as.factor(dose), len)) + geom_point(aes(colour=supp), size=4) + ggtitle("") + facet_grid(. ~ supp) 

# 3
library(dplyr)
tg %>% group_by(supp) %>% summarise(mean(len))
