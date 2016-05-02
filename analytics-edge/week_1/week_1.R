WHO <- read.csv("WHO.csv")
mean(WHO$Over60)
which.min(WHO$Over60)
WHO$Country[183]

# mean percentage of population over 60 in regions
tapply(WHO$Over60, WHO$Region, mean)
tapply(WHO$LiteracyRate, WHO$Region, min, na.rm = T)
tapply(WHO$ChildMortality, WHO$Region, mean)
