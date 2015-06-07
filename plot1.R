# plot 1 - 7/6/2015

if(!require("data.table")) install.packages("data.table")
library(data.table)

#set the working directory if neccessary
#setwd("C:/Etudes/stats")

datafile<-"household_power_consumption.txt"

###retrieve the variable names 
ColName<-names(fread(datafile,nrows=0,header=T,na.strings="?",colClasses="chararcter"))
###Read the data (from 2007-02-01 to 2007-02-02)
DT<-fread(datafile,nrows=2880,skip=66637,header=F,na.strings="?")
###re-allocate the variable names
setnames(DT,ColName)

###Open PNG device, create 'plot1.png' 
png(file = "plot1.png",width = 480, height = 480, units = "px")
### Make the histogram
hist(DT$Global_active_power, main = "Global Active Power", col = "Red", xlab = "Global Active Power (kilowatts)")
### Close the PNG device!
dev.off() 
