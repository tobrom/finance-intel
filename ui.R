library(shiny)
library(ggplot2)

symbols <- na.exclude(read.csv("tickers.csv"))

shinyUI(fluidPage(
  
  theme = "w3.css",
  
  titlePanel("Time Series Analysis"),

         sidebarLayout(
           
           sidebarPanel(
             
             helpText("This applications is a tool to analyse all the securities
                      currently included in the S&P 500 index. In addition to
                      the share price and volume, Bollinger Bands and Moving Averages
                      are calculated."),
           
             hr(),
             
             selectInput("tickers", "Ticker:", choices = symbols$Name),
             
             actionButton("update", "Uppdate Ticker"),
             
             hr(),
             
             sliderInput("months", "Select Months to Show:",
                         min = 1, max = 36,
                         value = 5),
             
             radioButtons("type", "Moving Average Method:",
                          c("Simple" = "SMA",
                            "Exponential" = "EMA")),
             
             sliderInput("short", "Short (Days):",
                         min = 3, max = 15,
                         value = 12),
             
             sliderInput("long", "Long (Days):",
                         min = 16, max = 50,
                         value = 26),
             
             sliderInput("signal", "Signal (Days):",
                         min = 5, max = 10,
                         value = 9)
             
             ),
           
           mainPanel(
             
             plotOutput("plot1", height = "700px")
          
              )
            )
          )
        )
