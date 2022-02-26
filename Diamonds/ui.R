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
        theme = bs_theme(version = 4, bootswatch = "sandstone"),

        # Application title
        titlePanel("Diamond prices"),

        # Sidebar with a slider input for number of bins
        sidebarLayout(
                sidebarPanel(
                        h5("Select diamond properties"),
                        selectInput("clarity", "Clarity", (sort( 
                                unique(diamonds$clarity), decreasing = T))),
                        selectInput("cut", "Cut", (sort(unique(diamonds$cut),
                                                decreasing = T))),
                        selectInput("color", "Color", (sort( 
                                unique(diamonds$color)))),
                        submitButton("Update plot", icon("refresh"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
