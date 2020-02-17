#analysis attempt 3

#Libraries-------

library(dplyr)




m<-read.csv(file=paste(path.rd,"/","Measles_ALL.csv",sep=""))


m<-select(m, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag.Codes",
                           "FREQUENCY"))

