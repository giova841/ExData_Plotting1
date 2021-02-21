# Plot 4

# Load libraries
library("lubridate")

# Get and clean data
mydata<-read.csv("data/household_power_consumption.txt",header=TRUE,sep=";")
date_time<-paste(mydata$Date,mydata$Time)
Date_Time<-parse_date_time(date_time,orders = "dmyHMS")
mydata<-cbind(mydata,Date_Time)

# Subset data
mydata<-subset(mydata,Global_active_power!="?")
mydata<-subset(mydata,Global_reactive_power!="?")
mydata<-subset(mydata,Voltage!="?")
mydata<-subset(mydata,Global_intensity!="?")
mydata<-subset(mydata,Sub_metering_1!="?")
mydata<-subset(mydata,Sub_metering_2!="?")
mydata<-subset(mydata,Sub_metering_3!="?")
class(mydata$Global_active_power)="numeric"
class(mydata$Global_reactive_power)="numeric"
class(mydata$Global_intensity)="numeric"
class(mydata$Voltage)="numeric"
class(mydata$Sub_metering_1)="numeric"
class(mydata$Sub_metering_2)="numeric"
class(mydata$Sub_metering_3)="numeric"


# Subset data
mydata<-subset(mydata,Date_Time>=as.Date("2007-02-01"))
mydata<-subset(mydata,Date_Time<as.Date("2007-02-03"))

# Make plot
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

# 1/4
with(mydata,plot(Date_Time,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
# 2/4
with(mydata,plot(Date_Time,Voltage,type="l",ylab="Voltage",xlab="datetime"))
# 3/4
plot(mydata$Date_Time,mydata$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(mydata$Date_Time,mydata$Sub_metering_2,type="l",col="red")
lines(mydata$Date_Time,mydata$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")
# 4/4
with(mydata,plot(Date_Time,Global_reactive_power,type="l",xlab="datetime"))

dev.off()

