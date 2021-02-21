# Plot 1

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
png(filename = "plot1.png", width = 480, height = 480)
hist(mydata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
