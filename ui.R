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
                  c("Sepal Lenght" = "Sepal.Length",
                    "Sepal Width" = "Sepal.Width",
                    "Petal Length" = "Petal.Length",
                    "Petal Width" = "Petal.Width"),
                  selected = "Petal.Length"),
      selectInput("variable_y", "Y Variable:",
                  c("Petal Length" = "Sepal.Length",
                    "Petal Width" = "Sepal.Width", 
                    "Sepal Length" = "Petal.Length",
                    "Sepal Width" = "Petal.Width"),
                  selected = "Petal.Width"),
      sliderInput("size_x", "Select the size of X Variable", 0, 7.9, 4),
      checkboxInput("draw_loess", "Draw LOESS", value = TRUE),
      checkboxInput("draw_lm", "Draw LM", value = TRUE)                   
      #submitButton("Dibujar")
    ),
    
    # Show a plot with the models
    mainPanel(
       # plotOutput("dispersionPlot"),
       # h3("Predicted size from LOESS model:"), 
       # textOutput("pred1"),
       # h3("Predicted size from LM model:"),
       # textOutput("pred2")
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("dispersionPlot"), 
                                   h3("Predicted size from LOESS model:"),
                                   textOutput("pred1"),
                                   h3("Predicted size from LM model:"),
                                   textOutput("pred2")),
                  tabPanel("Documentation", h3("APP DOCUMENTATION"),
                                            h4("X Variable"),
                                            p("Here you can select the X variable from iris dataset for create a model."),
                                            h4("Y Variable"),
                                            p("Here you can select the Y variable from iris dataset for create a model."),
                                            h4("Select the size of X Variable"),
                                            p("Here you can select the value o X Variable from iris dataset to obtain a prediction."),
                                            h4("Draw LOESS"),
                                            p("If you want to draw the loess model, click here."),
                                            h4("Draw LM"),
                                            p("If you want to draw the linear model, click here."))
      )                                     
    )
  )
))

tabsetPanel(type = "tabs",
            tabPanel("Plot", plotOutput("plot")),
            tabPanel("Summary", verbatimTextOutput("summary")),
            tabPanel("Table", tableOutput("table"))
)
