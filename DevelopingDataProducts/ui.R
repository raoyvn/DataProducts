library(shiny)
library(datasets)

# Define UI for slider demo application
shinyUI(fluidPage(
    
    #  Application title
    titlePanel("Fuel Consumption"),
    
    # Sidebar with sliders that demonstrate various available
    # options
    sidebarLayout(
        sidebarPanel(
            # Specification of weight in lb/1000
            sliderInput("wt", "Weight (lb/1000):",
                        min=min(mtcars$wt), max=max(mtcars$wt), value=min(mtcars$wt), step=0.1 , animate=TRUE),
            
            # Specification of qsec time
            sliderInput("qsec", "1/4 mile time:",
                        min=min(mtcars$qsec), max=max(mtcars$qsec), value=min(mtcars$qsec), step=0.1, 
                        animate=animationOptions(interval=300, loop=TRUE)
            ),
            
            # Specification for Manual vs Automatic 
            radioButtons("automanual", "Transmission type:",
                         c("Automatic" = 0,
                           "Manual" = 1))
        ),
        
        
        # Show a textout summarizing the mpg 
        # for the selected combination of inputs 
        mainPanel(
            h3("Miles/(US) gallon"),
            h3(textOutput("mpg"))
        )
    )
    
))