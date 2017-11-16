data <- c("Eagle", "Tails")
names(data) <- data

draw <- function(value, output){
  random <- data[sample(1:2, 1)]
  choice <- data[value]
  
  table <- read.table("data.txt", header = TRUE, sep = ";")
  colnames(table) <- names(data)
  
  if(random == choice){
    table[1, 1] <- table[1, 1] + 1
    
    output$text <- renderText({
      "You guess"
    })
    
  } else {
    table[1, 2] <- table[1, 2] + 1
    
    output$text <- renderText({
      "You do not guess"
    })
  }

  write.table(table, "data.txt", sep = ";")
  barplot(as.matrix(table[1, ]), ylab = "The number", beside=TRUE, col = c("green", "red"))
}

clear <- function(output){
  table <- data.frame(matrix(c(0, 0), ncol = 2))
  colnames(table) <- names(data)
  write.table(table, "data.txt", sep = ";")
  
  output$text <- renderText({})
  output$plot <- renderPlot({})
}

shinyServer(
  function(input, output, session) {
    observeEvent(input$button, {
      output$plot <- renderPlot({
        draw(input$value, output)
      })
    })
    
    observeEvent(input$clear, {
      clear(output)
    })
  }
)