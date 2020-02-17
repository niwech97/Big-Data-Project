#analysis attempt 3

#Libraries-------

library(dplyr)



#Starting with a new csv with just Vaccine rates
m<-read.csv(file=paste(path.rd,"/","Measles_ALL.csv",sep=""))

#Cleaning the data by removing the columns we don't care about
m<-select(m, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag.Codes",
                           "FREQUENCY"))
