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
  titlePanel("Iris - Models"),
  
  # Sidebar  
  sidebarLayout(
    sidebarPanel(
      selectInput("variable_x", "X Variable:",
                  c("Largo de Sépalo" = "Sepal.Length",
                    "Ancho de Sépalo" = "Sepal.Width",
                    "Largo de Pétalo" = "Petal.Length",
                    "Ancho de Pétalo" = "Petal.Width"),
                  selected = "Petal.Length"),
      selectInput("variable_y", "Y Variable:",
                  c("Largo de Sépalo" = "Sepal.Length",
                    "Ancho de Sépalo" = "Sepal.Width", 
                    "Largo de Pétalo" = "Petal.Length",
                    "Ancho de Pétalo" = "Petal.Width"),
                  selected = "Petal.Width"),
      sliderInput("size_x", "Select the size of x variable", 0, 7.9, 4),
      checkboxInput("draw_loess", "Draw LOESS", value = TRUE),
      checkboxInput("draw_lm", "Draw LM", value = TRUE)                   
      #submitButton("Dibujar")
    ),
    
    # Show a plot with the models
    mainPanel(
       plotOutput("dispersionPlot"),
       h3("Predicted size from LOESS model:"), 
       textOutput("pred1"),
       h3("Predicted size from LM model:"),
       textOutput("pred2")
    )
  )
))
