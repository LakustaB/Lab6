library("shiny")

shinyUI(pageWithSidebar(
  headerPanel("Eagle or tails"),
  
  sidebarPanel(
    selectInput("value", "Your choice:", choices=c("Eagle", "Tails")),
    actionButton("button", "Choose", width = "100%"),
    hr(),
    actionButton("clear", "Clear database", width = "100%")
  ),
  
  mainPanel(
    h2(textOutput("text")),
    plotOutput("plot")
  )
))