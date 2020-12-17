#' Get Stock Price Function (AV)
#'
#' @description An API wrapper to extract historical daily price of a stock symbol from www.alphavantage.co
#'
#' @param symbol (character) Stock symbol in the stock market
#'
#' @return Return data frame object with historical daily stock prices
#'
#' @examples getstockprice_av('AAPL')
#' @export

getstockprice_av<-function(symbol){
  api_key_AV <- '1D0CULUFYK3KIO0M'

  #create URL
  URL1 <- paste("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=",text,"&outputsize=compact&apikey=",api_key_AV, sep = "")
  #get json data
  q_curr <- fromJSON(URL1)
  q2<-q_curr$`Time Series (Daily)`

  #formatting into data frame
  df<-data.frame(date=names(q2),
                 open=unlist(q2)[seq(1,96,length=20)],
                 high=unlist(q2)[seq(2,97,length=20)],
                 low=unlist(q2)[seq(3,98,length=20)],
                 close=unlist(q2)[seq(4,99,length=20)],
                 vol=unlist(q2)[seq(5,100,length=20)])

  return(df)
}
