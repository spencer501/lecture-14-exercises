# Server.r

library(shiny)
### Exercise 2 ###

# 1.  Build a shiny app that displays this chart
# 2.  Create number inputs that let you choose the number of points
# 3.  Bonus: Create a dropdown menu to let the user pick the color:

# We'll look into these more next week: http://shiny.rstudio.com/gallery/widget-gallery.html 

shinyServer(function(input, output) {
  # You can access the value of the widget with input$select, e.g.
  output$scatter <- renderPlot({ 
    set.seed(14)
    x <- rnorm(input$num)
    y <- rnorm(input$num)
    return(plot(x,y, col=input$color))
  })
  
})