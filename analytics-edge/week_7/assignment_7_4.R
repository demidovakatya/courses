# VISUALIZING ATTRIBUTES OF PAROLE VIOLATORS (OPTIONAL)

library(ggplot2)

parole <- read.csv("parole.csv")

parole$male <- as.factor(parole$male)
parole$state <- as.factor(parole$state)
parole$crime <- as.factor(parole$crime)

prop.table(table(subset(parole, violator == 1)$male))

which.max(table(subset(parole, state == 2)$crime))

ggplot(data = parole, aes(x = age)) + geom_histogram(binwidth = 5, color = "blue")

ggplot(data = parole, aes(x = age)) + geom_histogram(binwidth = 5) + facet_grid(male ~ .)
ggplot(data = parole, aes(x = age)) + geom_histogram(binwidth = 5) + facet_grid(. ~ male)

color.palette = c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", 
                  "#0072B2", "#D55E00", "#CC79A7")
ggplot(data = parole, aes(x = age, fill = male)) + geom_histogram(binwidth = 5) + 
    scale_fill_manual(values = color.palette)
ggplot(data = parole, aes(x = age, fill = male)) + geom_histogram(binwidth = 5, position = "identity", alpha = 0.5) + scale_fill_manual(values = color.palette) 
    

