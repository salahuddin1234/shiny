library(shiny)
shinyUI(
    fluidPage(
        sidebarPanel(
            
            
            selectInput("Response", "SVM Model", choices=c("mpg", "disp"))
            
            
        )
        ,
        mainPanel(
        tableOutput("Evaluation")
        )
        
        )
)