#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(bslib)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        # Application theme
        theme = bs_theme(version = 4, bootswatch = "lumen"),

        # Sidebar with a slider input for number of bins
        sidebarLayout(
                sidebarPanel(
                h4("Diamond properties"),
                tags$div(class = "form-group",
                        tags$label("Clarity"),
                        tags$small("A measurement of how clear the diamond is
                                   (I1 (worst), IF (best))", 
                                    class = "form-text text-muted"),
                        selectInput("clarity", NULL, (sort(
                        unique(diamonds$clarity), decreasing = T))),
                ),
                
                tags$div(class = "form-group",
                        tags$label("Cut"),
                        tags$small("Quality of the cut (Fair, Good, Very Good, 
                                   Premium, Ideal))", 
                                   class = "form-text text-muted"),
                        selectInput("cut", NULL, (sort(unique(diamonds$cut),
                        decreasing = T)))
                ),
                
                tags$div(class = "form-group",
                        tags$label("Color"),
                        tags$small("Diamond colour, from D (best) to J 
                                    (worst)", 
                                    class = "form-text text-muted"),
                        selectInput("color", NULL, (sort(
                                unique(diamonds$color))))
                ),
                
                tags$label(" Carat"),
                tags$small("Select carat size for price prediction", 
                           class = "form-text text-muted"),
                br(),
                sliderInput("lm", NULL,
                        min = min(diamonds$carat), max = max(diamonds$carat),
                        value = max(diamonds$carat) / 2, step = 0.1),
                h5("Predicted Price"), 
                verbatimTextOutput("predict"),
                # submitButton("Predict", icon("refresh")),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
