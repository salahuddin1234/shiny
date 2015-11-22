library(shiny)
library(e1071)
library(caret)

shinyServer(function(input, output, session) {
    
        f<- mtcars
        fitter <- reactive({

            con <- gzfile("model.rds")
            r=readRDS(con)
            
            fi=unserialize(r)
            test<-read.csv("pml-testing.csv")
        
            filter = grepl("belt|arm|dumbell", names(train))
            test = test[, filter]
            cols.without.na = colSums(is.na(test)) == 0
            test = test[, cols.without.na]
            
            
        
            
            fit = predict(fi, test)
            fit = as.factor(fit)
        
        
        return(fit)
    })
    output$Evaluation <- renderText ({
        fitter()
    })
    
        }


)
