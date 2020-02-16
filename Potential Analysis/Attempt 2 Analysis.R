# Attempt 2 potan GDP SCC vacc

#Created mcr15 object through file screen in R, with our own factor list as countries 
# doing the same for GDP data







length(mcr15$LOCATION)   #these dont need to be the same as our defined factors are the same
length(GDP15$LOCATION)   #therefore we can just remove our NA factors when making the linear model

GDP15<-select(GDP15, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag Codes", 
                      "FREQUENCY"))
mcr15<-select(mcr15, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag Codes", 
                      "FREQUENCY"))

