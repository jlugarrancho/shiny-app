# git changes
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/  
#

library(shiny)

# Define server logic
shinyServer(function(input, output) {
   
  output$dispersionPlot <- renderPlot({
    
    # generate the models
    x <- input$variable_x
    y <- input$variable_y
    pred_value <- input$size_x
    draw_loess <- input$draw_loess
    draw_lm <- input$draw_lm
    
    x.sort <- sort(iris[, x])
    y.sort <- iris[order(iris[, x]), y]
    
    xlim <- c(min(iris[, x]), max(iris[, x]))
    ylim <- c(min(iris[, y]), max(iris[, y]))
    iris.loess <- loess(y.sort ~ x.sort, degree = 2, span = 2/3)
    iris.lm <- lm(y.sort ~ x.sort)
   
    model1pred <- reactive({
      predict(iris.loess, newdata = data.frame(x.sort = pred_value))
    })
    
    model2pred <- reactive({
      predict(iris.lm, newdata = data.frame(x.sort = pred_value))
    })
    
    # draw the dispersion plot and models
    plot(iris[, x], iris[, y], col = iris$Species, main = "Dispersión iris", 
         xlim = xlim, ylim = ylim, pch = 19, xlab = x, ylab = y)
    
    if(draw_loess == T){
      lines(x.sort, iris.loess[[2]], col = "darkmagenta", lwd = 4, lty = 2)
      points(pred_value, model1pred(), pch = 19, col = "darkmagenta", cex = 2.5)
    }
    if(draw_lm == T){
      abline(lm(y.sort ~ x.sort), col = "aquamarine4", lwd = 4, lty = 2)
      points(pred_value, model2pred(), pch = 19, col = "aquamarine4", cex = 2.5)
    }
    
    legend("bottomright", legend = c("Setosa", "Versicolor", "Virginica"), 
           col = labels(iris$Species), pch = 20)
    # Text output   
    output$pred1 <- renderText({ 
      model1pred()
    })
    output$pred2 <- renderText({ 
      model2pred()
    })
    
  })
  
})


