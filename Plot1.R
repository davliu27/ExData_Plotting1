## Plotting Histogram of Global Active Power (kilowatts)
library(datasets)

#processing data
fileName<-"household_power_consumption.txt"
data<-read.table(fileName,header=T,sep=";")
data[,"Date"]<-as.Date(data[,"Date"], "%d/%m/%Y")
subsetData<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
global_active_power<-subsetData[,"Global_active_power"]
global_active_power_num<-as.numeric(as.character(global_active_power))

#plotting and creating png file
hist(global_active_power_num, main="Global Active Power",col="red1",xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()