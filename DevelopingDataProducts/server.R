library(shiny)
library(datasets)

# 1. we will use the mtcars dataset 
# 2. AIC in backward direction to arrive at the best model 
fit <- step(lm(mpg~.,data=mtcars),direction="backward")

# Define server logic required to plot various variables against
# mpg
shinyServer(function(input, output) {
    # on observation of the above model fit , we know 
    # that am,wt and qsec are the most relavent 
    # predictor variables 
    
    # doing the computation in reactive mode 
    # to update textOutput i.e mpg with updates
    wt <- reactive({ as.numeric(input$wt) })
    qsec <- reactive({ as.numeric(input$qsec) })
    am <- reactive({ as.numeric(input$automanual) })
    mpg <- reactive( { coef(fit)["wt"]*wt() + coef(fit)["qsec"]*qsec()+ coef(fit)["am"]*am() +  coef(fit)["(Intercept)"] } )
    output$mpg <- renderText(mpg())
    
})
