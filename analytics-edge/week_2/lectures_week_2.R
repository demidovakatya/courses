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

# ============================

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

cor(wine$HarvestRain, wine$WinterRain)

# ============================

baseball <- read.csv("baseball.csv")
moneyball <- subset(baseball, Year < 2002)

moneyball$RD <- moneyball$RS - moneyball$RA

wins.reg <- lm(W ~ RD, data = moneyball)
summary(wins.reg)

predict(wins.reg, data.frame(713 - 614))

runs.reg <- lm(RS ~ OBP + SLG + BA, data = moneyball)
summary(runs.reg)

rs.model <- lm(RS ~ OBP + SLG, data = moneyball)
ra.model <- lm(RA ~ OOBP + OSLG, data = moneyball)
predict(rs.model, data.frame(OBP = 0.311, SLG = 0.405))
predict(ra.model, data.frame(OOBP = 0.297, OSLG = 0.370))

dat <- data.frame(OBP = c(0.338, 0.391, 0.369, 0.313, 0.361), 
                  SLG = c(0.540, 0.450, 0.374, 0.447, 0.500))
predict(rs.model, dat)

teamRank <- c(1, 2, 3, 3, 4, 4, 4, 4, 5, 5)
wins2012 <- c(94, 88, 95, 88, 93, 94, 98, 97, 93, 94)
wins2013 <- c(97, 97, 92, 93, 92, 96, 94, 96, 92, 90)
cor(teamRank, wins2012)
cor(teamRank, wins2013)
