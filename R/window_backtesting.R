#' Moving Window BackTesting Function
#' @description A backtesting function to test ARIMA model on a training time series
#'
#' @param model ARIMA model
#' @param ts time series data
#' @param k number of training data, must be fewer than total data length
#'
#' @return
#'  data as actual data
#'  pred as predict values
#'  mape as mean absolute percentage error
#'
#' @export
#'
#' @examples
#'  window_bactesting(ex_model,ex_ts,k=100)
#'
window_backtesting<-function(model,ts,k){
  n<-length(ts) #number of obs
  k0<-k1<-k #limit train data

  tss<-c()
  mape_d<-c() #blank metrix for saving MAPE

  for (i in 1:(n-k0-1)) {
    trmodel<-Arima(ts[i:k1],model=model) #est arima on train
    pred<-predict(trmodel, n.ahead = 1) #forecast
    pred1<-as.data.frame(as.numeric(pred$pred))
    tss<-rbind(tss,pred1)
    mape_d<-rbind(mape_d,Metrics::mape(ts[(k1+1)],pred$pred))
    k1<-k1+1
  }

  tsss<-ts(tss, start=time(ts)[1]+k0+1)
  mmape<-mean(mape_d)

  result<-list(data=ts,pred=tsss,mape=mmape)

  plot(result$data,main='Actual VS Predict')
  lines(result$pred,col='red',lwd=1)

  return(result)
}
