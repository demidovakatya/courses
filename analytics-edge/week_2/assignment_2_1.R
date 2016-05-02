data <- read.csv("climate_change.csv")
train <- subset(data, Year <= 2006)
test <- subset(data, Year >= 2007)

model1 <- lm(Temp ~ . - Year - Month, data = train)
summary(model1)

cor(train)

model2 <- lm(Temp ~ MEI + TSI + Aerosols + N2O, data = train)
summary(model2)

model3 <- step(model1)
summary(model3)

predictions <- predict(model3, test)
SSE <- sum( (predictions - test$Temp)^2 )
SST <- sum( (mean(train$Temp) - test$Temp)^2 )
1 - SSE / SST
