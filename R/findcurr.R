#' Find Currency Function
#'
#' @description a function to search for a string in the country names and return with their respective currency names and currency codes
#'
#' @param text a character vector of text to search for in the country names
#'
#' @return a data frame of matched country names with their respective currency codes
#'
#' @examples findcurr('united')
#' @export
findcurr<-function(text){
  a<-data.frame(name=grep(text,currcodes$Entity,value=TRUE,ignore.case = TRUE))
  result<-merge(a,currcodes,by.x='name',by.y='Entity',all.x=TRUE)[,c(1,2,3,6)]

  return(result)
}
