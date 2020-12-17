ex_model<-Arima(ex_ts,order=c(2,0,2))
save(ex_model,file='data/ex_model.rda')
