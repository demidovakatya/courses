library(shiny)

data <- read.csv(file = "gapminder.csv")

colnames <- c("Country", "Income.Per.Person", "Alcohol.Consum.Per.Adult", "Armed.Forces.Rate", "Breast.Cancer.Per.100k", "CO2.Emissions", "Female.Employ.Rate", "HIV.Rate", "Internet.Use.Rate", "Life.Expectancy", "Oil.Consum.Per.Person", "Democracy.Score", "Resid.Elect.Consum.Per.Person", "Suicide.Per.100k", "Employ.Rate", "Urban.Population.Rate")
colnames(data) <- colnames

# Функция, которая из data берет нужный столбец и подготавливает данные для map

# Функция, которая возвращает описание переменной

# Функция, которая считает статистику по переменной

# Функция, которая подготавливает данные для чарта по странам

shinyServer(function(input, output) {
        
  output$pretext <- renderText({
          paste("You have selected: ", input$var)
  })

  output$map <- renderPlot({

  })

})
