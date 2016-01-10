# Quiz 1

## Question 1

Consider the following code for the `cars` data set

```r
library(manipulate)
myPlot <- function(s) {
    plot(cars$dist - mean(cars$dist), cars$speed - mean(cars$speed))
    abline(0, s)
}
```

This function plots distance versus speed, each de-meaned and an associated line of slope `s`.

Which of the following code will make a manipulate plot that creates a slider for the slope?

- `manipulate(myPlot, s = slider(0, 2, step = 0.1))`
- `manipulate(myPlot(s), x.s = slider(0, 2, step = 0.1))`
- `manipulate(myPlot(s), slider = x(0, 2, step = 0.1))`
- **`manipulate(myPlot(s), s = slider(0, 2, step = 0.1))`**

## Question 2

Which of the following code uses the `rCharts` package to create a sortable and searchable data table for the `𝚊𝚒𝚛𝚚𝚞𝚊𝚕𝚒𝚝𝚢` data set? Assume the `rCharts` package and the `airquality` data set have already been loaded into R.

- `airquality`
- `d <- data.frame(airquality, stringsAsFactors = FALSE); print(d)`
- `head(airquality)`
- **`dTable(airquality, sPaginationType = "full_numbers")`**

## Question 3

A basic shiny data product requires:

- A 𝚜𝚑𝚒𝚗𝚢.𝚁 file.
- **A 𝚞𝚒.𝚁 and 𝚜𝚎𝚛𝚟𝚎𝚛.𝚁 file or a A 𝚜𝚎𝚛𝚟𝚎𝚛.𝚁 file and a directory called 𝚠𝚠𝚠 containing the relevant html files.**
- A 𝚜𝚎𝚛𝚟𝚎𝚛.𝚁 file only.
- A 𝚞𝚒.𝚁 file only.

## Question 4

What is incorrect about the followig syntax in 𝚞𝚒.𝚁?

```r
library(shiny)
shinyUI(pageWithSidebar(  
  headerPanel("Data science FTW!"),  
  sidebarPanel(    
     h2('Big text')    
     h3('Sidebar')  
  ),  
  mainPanel(      
       h3('Main Panel text')  
  )
))
```

- The 𝚑𝟸 command has the wrong arguments.
- The 𝚑𝟹 command should be an 𝚑𝟸 command.
- The "𝚂𝚒𝚍𝚎𝚋𝚊𝚛" should say "𝚂𝚒𝚍𝚎𝚋𝚊𝚛 𝚝𝚎𝚡𝚝".
- **Missing a comma in the sidebar panel**

## Question 5

Consider the following code in 𝚞𝚒.𝚁

```r
shinyUI(pageWithSidebar(  
   headerPanel("Example plot"),  
   sidebarPanel(    
     sliderInput('mu', 'Guess at the mu',value = 70, min = 60, max = 80, step = 0.05,)  ), 
   mainPanel(    
     plotOutput('newHist')  
   )
))
```

And the following 𝚜𝚎𝚛𝚟𝚎𝚛.𝚁 code.

```r
library(UsingR)
data(galton)
shinyServer(  
    function(input, output) {    
       output$myHist <- renderPlot({      
          hist(galton$child, xlab='child height', col='lightblue',main='Histogram')      
          mu <- input$mu      
          lines(c(mu, mu), c(0, 200),col="red",lwd=5)      
          mse <- mean((galton$child - mu)^2)      
          text(63, 150, paste("mu = ", mu))      
          text(63, 140, paste("MSE = ", round(mse, 2)))      
          })      }
)
```

Why isn't it doing what we want?

- **The `server.R` output name isn't the same as the `plotOutput` command used in ui.R.**
- The phrase "Guess at the mu value" should say "mean" instead of "mu"
- The limits of the slider are set incorrectly and giving an error.
- It should be 𝚖𝚞 <- 𝚒𝚗𝚙𝚞𝚝$𝚖𝚎𝚊𝚗 in `server.R`
