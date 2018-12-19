#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Descriptivos"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("variable_x", "Variable X:",
                  c("Largo de Sépalo" = "Sepal.Length",
                    "Ancho de Sépalo" = "Sepal.Width",
                    "Largo de Pétalo" = "Petal.Length",
                    "Ancho de Pétalo" = "Petal.Width"),
                  selected = "Petal.Length"),
      selectInput("variable_y", "Variable Y:",
                  c("Largo de Sépalo" = "Sepal.Length",
                    "Ancho de Sépalo" = "Sepal.Width", 
                    "Largo de Pétalo" = "Petal.Length",
                    "Ancho de Pétalo" = "Petal.Width"),
                  selected = "Petal.Width"),
      checkboxInput("draw_loess", "Dibujar LOESS", value = TRUE),
      checkboxInput("draw_lm", "Dibujar LM", value = TRUE)                   
      #submitButton("Dibujar")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("dispersionPlot")
    )
  )
))
