library(shiny)


shinyUI(fluidPage(
    titlePanel(" System for Unit Conversion_Muskaan"),
    sidebarLayout(
        sidebarPanel(
            selectInput("a1","Convert from-",
                        c("Pound","Kilogram","Fahrenheit","Celsius"),
                        selected = "Pound"),
            selectInput("a2","Convert to-",
                        c("Pound","Kilogram","Fahrenheit","Celsius"),
                        selected = "Kilogram"),
            numericInput("val1","Numeric value to convert",value=1)
        ),
        mainPanel(
            h4("Works only for Pound/Kilogram & Fahrenheit/Celsius"),
            h4(textOutput("text1"))
        ))
))