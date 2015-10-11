##Plotting Global Active Power vs. Time

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

#plotting and creating png file
plot(date_time,global_active_power_num,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png, file="plot2.png")
dev.off()