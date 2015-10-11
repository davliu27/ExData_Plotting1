##Plotting Energy sub metering vs. Time

library(datasets)


#processing data
fileName<-"household_power_consumption.txt"
data<-read.table(fileName,header=T,sep=";", na.strings=c("?",""))
data[,"Date"]<-as.Date(data[,"Date"], "%d/%m/%Y")
subsetData<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
timeTemp<-paste(subsetData[,"Date"], subsetData[,"Time"])
date_time<-strptime(timeTemp, format="%Y-%m-%d %H:%M:%S")

Sub_metering_1<-subsetData[,"Sub_metering_1"]
Sub_metering_2<-subsetData[,"Sub_metering_2"]
Sub_metering_3<-subsetData[,"Sub_metering_3"]

#plotting and creating png file
png("plot3.png",width=480,height=480,type="window")

plot(date_time,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(date_time,Sub_metering_2,col="red1")
lines(date_time,Sub_metering_3,col="blue")
legend("topright",lwd=1,lty=c(1,1,1),col=c("black","blue","red1"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()