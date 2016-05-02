# 0, 2
# 1, 2
# 1, 8
# y = 3 * x + 2
(2 + 2 + 8) / 3
# baseline: 4 
(2-2)**2 + (2-5)**2 + (8-5)**2
# 18
(2-4)**2 + (2-4)**2 + (8-4)**2
# 24
1 - ( ((2-2)**2 + (2-5)**2 + (8-5)**2) / ((2-4)**2 + (2-4)**2 + (8-4)**2) )
#  0.25

wine <- read.csv("wine.csv")
wine.test <- read.csv("wine_test.csv")
str(wine)

model1 <- lm(Price ~ AGST, data = wine)
summary(model1)
model1$residuals
SSE <- sum(model1$residuals^2)
# [1] 5.734875

model2 <- lm(Price ~ AGST + HarvestRain, data = wine)
SSE <- sum(model2$residuals^2)
# [1] 2.970373

model3 <- lm(Price ~ AGST + HarvestRain + WinterRain + Age + FrancePop, data = wine)
SSE <- sum(model3$residuals^2)
# [1] 1.732113

model.rains <- lm(Price ~ HarvestRain + WinterRain, data = wine)
summary(model.rains)
