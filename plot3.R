# plot 3 - 7/6/2015

if(!require("data.table")) install.packages("data.table")
library(data.table)
Sys.setlocale("LC_TIME", "English")

#set the working directory if neccessary
#setwd("C:/Etudes/stats")

datafile<-"household_power_consumption.txt"

###retrieve the variable names 
ColName<-names(fread(datafile,nrows=0,header=T,na.strings="?",colClasses="chararcter"))
###Read the data (from 2007-02-01 to 2007-02-02)
DT<-fread(datafile,nrows=2880,skip=66637,header=F,na.strings="?")
###reallocate the variable names
setnames(DT,ColName)
### Add a new variable converting Date/Time variables in Date/Time class  
DT[,NewDate:= {tmp <-(paste(Date, Time)); as.POSIXct(strptime(tmp, "%d/%m/%Y %H:%M:%S"))}]

###Open PNG device, create 'plot3.png' 
png(file = "plot3.png",width = 480, height = 480, units = "px")
### Make the plot
plot(DT$NewDate, DT$Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type = "n")
lines(DT$NewDate, DT$Sub_metering_1, col = "black")
lines(DT$NewDate, DT$Sub_metering_2, col = "red")
lines(DT$NewDate, DT$Sub_metering_3, col = "blue")
legend("topright", lty=1, text.width = strwidth("Sub_metering_1") , col = c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
### Close the PNG device!
dev.off() 


