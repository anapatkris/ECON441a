#' Get Stock Price Function (MS)
#'
#' @description An API wrapper to extract historical daily price of a stock symbol from marketstack.com
#'
#' @param symbol (character) Stock symbol in the stock market
#'
#' @return Return data frame object with historical daily stock prices
#'
#' @examples getstockprice_ms('AAPL')
#' @export

getstockprice_ms<-function(symbol){
  api_key_MS <- '62ef28a57f2f1270624bcb96b59e592f'
  stock <- symbol
  URL <- paste("http://api.marketstack.com/v1/eod?access_key=",api_key_MS,
                "&symbols=",stock, sep="")
  q_stock <- fromJSON(URL)

  x <- unlist(q_stock[2],FALSE)
  df <- data.frame(x)
  df<- df[,c(length(df), 1:length(df)-1)]
  col_names<- gsub("^.*\\.","",names(df))
  names(df)<-col_names
  df[,1]<- substr(df[,1],1,10)

  return(df)
}
