# 1. Load the ToothGrowth data and perform some basic exploratory data analyses 
# 2. Provide a basic summary of the data.
# 3. Use confidence intervals and/or hypothesis tests to compare tooth growth by supp and dose. (Only use the techniques from class, even if there's other approaches worth considering)
# 4. State your conclusions and the assumptions needed for your conclusions. 

library(ggplot2)

library(datasets)
tg <- ToothGrowth
str(tg)


ggplot(data = tg, aes(as.factor(dose), len)) + geom_point(aes(colour=supp), size=4) + ggtitle("") + facet_grid(. ~ supp) 
ggplot(data = tg, aes(supp, len)) + geom_point(aes(colour=as.factor(dose)), size=4) + ggtitle("")

