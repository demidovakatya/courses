# ELECTION FORECASTING REVISITED

library(ggplot2)
library(ggmap)
library(maps)

states.map <- map_data("state")
polling <- read.csv("PollingImputed.csv")

# Problem 1 - Drawing a Map of the US

str(states.map)
table(states.map$group)

ggplot(states.map, aes(x = long, y = lat, group = group)) + 
    geom_polygon(fill = "white", color = "black")

# Problem 2 - Coloring the States by Predictions

train <- subset(polling, Year == 2004 | Year == 2008)
test <- subset(polling, Year == 2012)

log.model <- glm(Republican ~ SurveyUSA + DiffCount, data = train, family = "binomial")
test.pred <- predict(log.model, newdata = test, type = "response")
test.pred.binary <- as.numeric(test.pred > 0.5)
predictions <- data.frame(test.pred, test.pred.binary, test$State)

table(predictions$test.pred.binary)
mean(predictions$test.pred)

predictions$region <- tolower(predictions$test.State)
predictions.map <- merge(states.map, predictions, by = "region")
predictions.map <- predictions.map[order(predictions.map$order), ]

nrow(predictions.map)
nrow(states.map)

length(table(predictions.map$group))

ggplot(predictions.map, aes(x = long, y = lat, group = group, 
                            fill = test.pred.binary)) + 
    geom_polygon(color = "black")

ggplot(predictions.map, aes(x = long, y = lat, group = group, fill = test.pred.binary)) + 
    geom_polygon(color = "black") + 
    scale_fill_gradient(low = "blue", high = "red", guide = "legend", 
                        breaks = c(0, 1), labels = c("Democrat", "Republican"), 
                        name = "Prediction 2012")
ggplot(predictions.map, aes(x = long, y = lat, group = group, fill = test.pred)) + 
    geom_polygon(color = "black") + 
    scale_fill_gradient(low = "blue", high = "red", guide = "legend", 
                        breaks = c(0, 1), labels = c("Democrat", "Republican"), 
                        name = "Prediction 2012")

# Problem 3 - Understanding the Predictions

predictions[predictions$region == "florida", ]

# PROBLEM 4 - PARAMETER SETTINGS

# plot 1
ggplot(predictions.map, aes(x = long, y = lat, group = group, fill = test.pred.binary)) + 
    geom_polygon(color = "black", linetype = 3) + 
    scale_fill_gradient(low = "blue", high = "red", guide = "legend", 
                        breaks = c(0, 1), labels = c("Democrat", "Republican"), 
                        name = "Prediction 2012")
# plot 2
ggplot(predictions.map, aes(x = long, y = lat, group = group, fill = test.pred.binary)) + 
    geom_polygon(color = "black", size = 3) + 
    scale_fill_gradient(low = "blue", high = "red", guide = "legend", 
                        breaks = c(0, 1), labels = c("Democrat", "Republican"), 
                        name = "Prediction 2012")

# plot 3
ggplot(predictions.map, aes(x = long, y = lat, group = group, fill = test.pred.binary)) + 
    geom_polygon(color = "black", alpha = 0.3) + 
    scale_fill_gradient(low = "blue", high = "red", guide = "legend", 
                        breaks = c(0, 1), labels = c("Democrat", "Republican"), 
                        name = "Prediction 2012")
