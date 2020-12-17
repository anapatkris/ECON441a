#' Find Stock Symbol Function
#'
#' @param text text/string to search in stock name
#'
#' @description API wrapper to auto-complete stock names and search for its symbol
#'
#' @return data frame object of all matching stock names and their symbols
#'
#'
#' #' @examples findstock_av('mic')

findstock_av<-function(text){
  api_key_AV <- '1D0CULUFYK3KIO0M'

  #create URL
  URL1 <- paste("https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=",text,"&outputsize=compact&apikey=",api_key_AV, sep = "")
  #get json data
  q_curr <- fromJSON(URL1)
  q_curr2<- q_curr$bestMatches

  return(q_curr2)
}



