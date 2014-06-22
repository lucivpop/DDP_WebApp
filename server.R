
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

# function to calculate bmi
bmiCalculator <- function(weight, height) {
    weight/((height/100)^2)
}

shinyServer(
    function(input, output) {
        # set name  
        output$name<-renderText({input$name})
        
        # use reactive to calculate bmi only once per set of values
        x<-reactive({round(bmiCalculator(input$weight,input$height),2)})
        
        # set return value for output of bmi and category
        output$obmi<-renderPrint({x()}) 
        output$ocateg<-renderPrint({
            if (x()<18.5) "Underweight"
            else if (x()<25) "Normal weight"
            else if (x()<30) "Overweight"
            else if (x()>=30) "Obesity"
        })
    })
