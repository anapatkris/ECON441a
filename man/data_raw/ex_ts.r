ex_ts<-ts(arima.sim(list(order = c(2,0,2), ar = c(0.7,-0.4),ma=c(0.7,-0.4)), n = 200),start=1950)
save(ex_ts,file='data/ex_ts.rda')
