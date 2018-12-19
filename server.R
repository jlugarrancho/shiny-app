#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$dispersionPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x <- input$variable_x
    y <- input$variable_y
    
    draw_loess <- input$draw_loess
    draw_lm <- input$draw_lm
    
    x.sort <- sort(iris[, x])
    y.sort <- iris[order(iris[, x]), y]
    
    xlim <- c(max(iris[, x]), min(iris[, x]))
    ylim <- c(max(iris[, y]), min(iris[, y]))
    iris.loess <- loess(y.sort ~ x.sort, degree = 2, span = 2/3)
    
    # draw the dispersion plot
    plot(iris[, x], iris[, y], col = iris$Species, main = "Dispersión iris", 
         xlim = xlim, ylim = ylim, pch = 19, xlab = x, ylab = y)
    
    if(draw_loess == T){
      lines(x.sort, iris.loess[[2]], col = "darkmagenta", lwd = 4, lty = 2)
    }
    if(draw_lm == T){
    abline(lm(y.sort ~ x.sort), col = "aquamarine4", lwd = 4, lty = 2)
    }
    legend("bottomright", legend = c("Setosa", "Versicolor", "Virginica"), 
           col = labels(iris$Species), pch = 20)
    
  })
  
})
