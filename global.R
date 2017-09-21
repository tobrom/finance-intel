###Plot function

createPlot <- function(data, months, fast, slow, signal, type, ticker) {
  
  t <- chartTheme('black')
  t$bg.col <- '#272b30'
  t$area <- '#272b30'
  t$BBands$fill <- '#272b30' 
  t$up.col <- 'green'
  t$dn.col <- 'red'
  
   chartSeries(data, 
              subset = paste("last", months, "months"), 
              type = "candlesticks", 
              name = ticker,
              plot = TRUE,
              theme = t,
              TA = c(addVo(), addBBands()))
  
  addMACD(fast = fast, slow = slow, signal = signal, type = type) 
  
}