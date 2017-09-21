library(shiny)
library(ggplot2)
library(quantmod)

symbols <- na.exclude(read.csv("tickers.csv"))

shinyServer(function(input, output) {
  
    rawData <- reactive({
    
      input$update
    
        isolate({
      
          getSymbols(paste(symbols$Ticker[match(input$tickers, symbols$Name)]), 
                    src = "google", 
                    auto.assign = FALSE)
      
    })    
    
  })
        
        ticker <- reactive({
          
          input$update
          
          isolate({
            
            paste(symbols$Ticker[match(input$tickers, symbols$Name)])
            
          })     
        
        
  })
  
    output$plot1 <- renderPlot({
    
    createPlot(data = rawData(), 
               months = input$months, 
               type = input$type,
               fast = input$short,
               slow = input$long,
               signal = input$signal,
               ticker = ticker()) 
  })

})