test.total <- merge(GDP15, MCR15, by=c("LOCATION", "TIME"))
head(test.total)
plot(test.total$Value.y~test.total$Value.x)

abline(lm(test.total$Value.y~test.total$Value.x))

dataset <- test.total

unique.years<- unique(dataset$TIME)

# in case of A

#####------ALMOST FUNCTIONING LOOP--------#########
for(i in 1:length(dataset$X)){
  for(ctr in 1:length(unique.years)){
    if(dataset$TIME[i] == unique.years[ctr]){
      graph.temp<-subset(dataset,subset = TIME==unique.years[ctr])
      pdf(file=paste(path.fingraph,"/",dataset$TIME[i],".pdf",sep=""))
      plot(graph.temp$Value.y,graph.temp$Value.x,main=unique.years[ctr],xlab="%of Children Vaccinated",ylab= "GDP in USD")}
    dev.off()
  }}

output.file.names<- unique.years}
if(file.exists(output.file.names[i]) == FALSE)
  write.csv(paste(path.clean,"/",output.file.names[ctr],".csv",sep=""))
}
#  }
?file.exists


