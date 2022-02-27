#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

        data("diamonds")
        output$distPlot <- renderPlot({
                ## Filter data using inputs
                info <- diamonds %>% filter(cut == input$cut,
                                                color == input$color,
                                                clarity == input$clarity)
                ## Plot diamond carat and price
                p <- ggplot(data = info, aes(x = carat, y = price)) +
                        theme_bw() +
                        geom_point() +
                        geom_smooth(method = "lm") +
                        labs(title = "Diamond Prices (in US dollars)",
                             xlab = "Carat", ylab = "Price")
                p
                
        }, height = 500)
        
        output$predict <- renderPrint({
                ## Filter data using inputs
                info <- diamonds %>% filter(cut == input$cut,
                                            color == input$color,
                                            clarity == input$clarity)
                fit <- lm(price~carat,data=info)
                unname(predict(fit, data.frame(carat = input$lm)))})
})
