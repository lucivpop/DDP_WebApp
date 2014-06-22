
# BMI Calculator
# 

library(shiny)

shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("BMI Calculator"),
    
    # Sidebar with 1 textbox and 2 sliders for input of name, weight and height
    sidebarPanel(
        h4('Enter your name:'),
        textInput(inputId="name", label = "Name", value="..."),
        h4('Select weight and height:'),
        sliderInput('weight',
                    "Weight in kg:",
                    min = 40,
                    max = 250,
                    value = 70),
        sliderInput('height',
                    "Height in cm:",
                    min = 110,
                    max = 250,
                    value = 175)
    ),
    
    # Show calculated bmi and category of weight
    mainPanel(
        h4(textOutput('name')),      
        h4('your calculated BMI is:'),
        verbatimTextOutput('obmi'),
        h4('your category of weight is:'),
        verbatimTextOutput('ocateg')
    )
))
