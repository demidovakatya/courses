library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Gapminder"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
        helpText("Choose a variable from the sel"),
            
        selectInput("var",
                  "choose wisely:",
                  choices = list("10" = 10, "25" = 25,
                       "50" = 50), selected = 10)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      textOutput("pretext"),
            
      plotOutput("map"),
      
      p("Founded in Stockholm by Ola Rosling, Anna Rosling Rönnlund and Hans Rosling, GapMinder is a non/profit venture promoting sustainable global development and  achievement of the United Nations Millennium Development Goals. It seeks to  increase the use and understanding of statistics about social, economic, and  environmental development at local, national, and global levels."),
      p("Since its conception in 2005, Gapminder has grown to include over 200 indicators,  including gross domestic product, total employment rate, and estimated HIV  prevalence. Gapminder contains data for all 192 UN members, aggregating data for  Serbia and Montenegro. Additionally, it includes data for 24 other areas, generating  a total of 215 areas."),
      p("GapMinder collects data from a handful of sources, including the Institute for Health  Metrics and Evaulation, US Census Bureau’s International Database, United Nations  Statistics Division, and the World Bank."),
      p("More information is available at", 
        a("www.gapminder.org", href="www.gapminder.org"))
    )
  )
))
