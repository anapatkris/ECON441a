#' Get Exchange Rate Function
#'
#' @description API wrapper to extract exchange rate data from www.alphavantage.co
#'
#' @param to_curr (character) currency code of the buying currency
#' @param from_curr (character) currency code of the selling currency
#'
#' @return data.frame object of daily exchange rate  historic stock price
#'
#' @examples getexchrate_av('GBP','USD')
#' @export

getexchrate_av<-function(to_curr,from_curr='USD'){
  api_key_AV <- '1D0CULUFYK3KIO0M'

  #create URL
  URL1 <- paste("https://www.alphavantage.co/query?function=FX_DAILY&from_symbol=",from_curr,
                "&to_symbol=",to_curr,"&outputsize=compact&apikey=",api_key_AV, sep = "")
  #get json data
  q_curr <- fromJSON(URL1)

  #formatting into data frame
  x<-q_curr$`Time Series FX (Daily)`
  date_col<-names(x)
  data_col<-matrix(unlist(x),ncol=4)
  df<-data.frame(date_col,data_col)
  col_names <- gsub(".* ",".",names(unlist(unlist(x[1]))))
  names(df)<-c('date',col_names)

  return(df)
}
