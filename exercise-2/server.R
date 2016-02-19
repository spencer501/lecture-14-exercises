library(shiny)

# Code to be executed by the shiny server
shinyServer(function(input, output) {

   output$chart <- renderPlot({
      
      set.seed(14)
      
      x <- rnorm(input$num)
      y <- rnorm(input$num)
      
      
      return(plot(x, y, col = input$color))
   })
   
})