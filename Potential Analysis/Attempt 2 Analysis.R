# Attempt 2 potan GDP SCC vacc



#Created mcr15 object through file screen in R, with our own factor list as countries
# doing the same for GDP data





length(MCR15$LOCATION) #these dont need to be the same as our defined factors are the same
length(GDP15$LOCATION)   #therefore we can just remove our NA factors when making the linear model

GDP15<-select(GDP15, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag Codes",
                      "FREQUENCY"))
GDP15.time<-as.factor(GDP15$TIME)

MCR15<-select(MCR15, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag Codes",
                      "FREQUENCY"))
MCR15.time<-as.factor(MCR15$TIME)


write.csv(MCR15,file=paste(path.clean,"Measles Child Vaccine Rates 15-18.csv",sep="/"))

write.csv(GDP15,file=paste(path.clean,"GDP by country 15-18.csv",sep="/"))
#Now we have each data set cleaned and with the proper countries in a
#new .csv in our clean data folder


#-------------basic plot time------
# ---------GDP---------------------
# to make initial GDP

plot(GDP15.time,GDP15$Value, xlab= "Year", ylab="GDP in USD",
     main= "GDP of 57 Countries")
#got the graph we want
#time to make a file

pdf(file = paste(path.maybefigs, "GDP of 57 Countries.pdf", sep = "/"),
    width = 6, height = 4)
plot(GDP15.time,GDP15$Value, xlab= "Year", ylab="GDP in USD",
     main= "GDP of 57 Countries")
dev.off()



# -----vaccines-------------------
plot(MCR15.time, MCR15$Value, xlab = "Time",
     ylab = "Child Vaccination Rates",
     main = "Global Measles Child Vaccination Rates",
     pch = 16, las = 1)
#got the graph we want
#time to make a file


pdf(file=paste(path.maybefigs,"Child Measles Vax Rate of 57 Countries.pdf",sep="/"))
plot(MCR15.time, MCR15$Value, xlab = "Time",
ylab = "Child Vaccination Rates",
main = "Global Measles Child Vaccination Rates",
pch = 16, las = 1)
dev.off()



#-------- loop trials begin!-----
