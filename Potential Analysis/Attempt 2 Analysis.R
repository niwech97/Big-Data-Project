# Attempt 2 potan GDP SCC vacc



#Created mcr15 object through file screen in R, with our own factor list as countries
# doing the same for GDP data
table(GDP15$LOCATION)
table(MCR15$LOCATION)

factor(GDP15.cleanedfinally$LOCATION)


length(MCR15$LOCATION) #these dont need to be the same as our defined factors are the same
length(GDP15$LOCATION)   #therefore we can just remove our NA factors when making the linear model

GDP15<-select(GDP15, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag Codes",
                      "FREQUENCY"))
GDP15.time<-as.factor(GDP15$TIME)


GDP15.cleanedfinally<-na.omit(GDP15)
GDP15.cleanedfinally

MCR15<-select(MCR15, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag Codes",
                      "FREQUENCY"))
MCR15.time<-as.factor(MCR15$TIME)

MCR15.cleanedfinally<-na.omit(MCR15)

MCR15.cleanedfinally

write.csv(MCR15.cleanedfinally,file=paste(path.clean,"Measles Child Vaccine Rates 15-18cleaned finally.csv",sep="/"))

write.csv(GDP15.cleanedfinally,file=paste(path.clean,"GDP by country 15-18cleanedfinally.csv",sep="/"))


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




#------MORE CLEANING-------DEL
# SO, because we are looking at 2015-2018, there should be 4 values per COUNTRY
# in each data set
# however, this was not the case
# So, we removed all countries from further analysis that did not have a value for
# each Year
# this included: (sadly)
# AUS, CHN, IND, IDN, ZAF, COL, FRA, DEU, LUX, CHE, TUR, ISR




#-------- loop trials begin!-----
#Create a loop with goals of:
# run a linear model(regression) of child vaccine rates and GDP15
# save results in relevant analysis folder
# save graph in maybe relevant graphics folder
# ----------test for ONE COUNTRY----------
# start with one country and do lm for one Year
# AUT in 2015
# explanatory variable = GDP, response = vaccine rate

#we need to create an amalgamate dataset with 3 columns
# First column will be a combo year and country EXAMPLE(AUT15)
# Second column will be child vax rates Example (89)
# Third column will be GDP Example (40000000)

#rs stands for results storage!


# rs<-rep(NA, length(dataset))
# i <- 1
for(i in 1:length(dataset))
model.t<-lm(dataset$childvax[i]~dataset$GDP[i])
sr[i]<-model.t$coefficients[1]
pdf(paste(dataset$country[i],dataset$year[i],".pdf",sep=""))
plot(model.t, main = "dataset$country[i]/dataset$year[i]", las = 1,
pch = 16, xlab = "GDP", ylab = "Child Vaccination Rate"), dev.off()

#}




#---------attempt to merge sets-----------
