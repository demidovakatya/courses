shinyUI(pageWithSidebar(
  headerPanel("Hello Shiny!"),
  sidebarPanel(
    textInput(inputId = "text1", label = "Input Text 1"),
    textInput(inputId = "text2", label = "Input Text 2")
  ),
  
  mainPanel(
    p("Output text1"),
    textOutput("text1"),
    p("Output text2"),
    textOutput("text2"),
    p("Output text3"),
    textOutput("text3"),
    p("Output text"),
    textOutput("text4"),
    p("Inside text, but non-reactive"),
    textOutput("text5")
  )
  
))
