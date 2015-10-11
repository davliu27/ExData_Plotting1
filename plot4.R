##Plotting for different plots

library(datasets)

#processing data
fileName<-"household_power_consumption.txt"
data<-read.table(fileName,header=T,sep=";", na.strings=c("?",""))
data[,"Date"]<-as.Date(data[,"Date"], "%d/%m/%Y")
subsetData<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
timeTemp<-paste(subsetData[,"Date"], subsetData[,"Time"])
date_time<-strptime(timeTemp, format="%Y-%m-%d %H:%M:%S")

global_active_power<-subsetData[,"Global_active_power"]
global_active_power_num<-as.numeric(as.character(global_active_power))

Voltage<-subsetData[,"Voltage"]

Sub_metering_1<-subsetData[,"Sub_metering_1"]
Sub_metering_2<-subsetData[,"Sub_metering_2"]
Sub_metering_3<-subsetData[,"Sub_metering_3"]

Global_reactive_power<-subsetData[,"Global_reactive_power"]

#plotting and creating png file
png("plot4.png",width=480,height=480,type="window")

par(mfrow=c(2,2),ps=12)

plot(date_time,global_active_power_num,type="l",ylab="Global Active Power",xlab="")

plot(date_time,Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(date_time,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(date_time,Sub_metering_2,col="red1")
lines(date_time,Sub_metering_3,col="blue")
legend("topright",lwd=1,lty=c(1,1,1),col=c("black","blue","red1"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

plot(date_time,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()