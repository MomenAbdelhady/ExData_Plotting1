plot3 <- function(){
  Sys.setlocale("LC_TIME", "English")
  
  ## To get data names
  data <- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?" ,nrows=1)
  datanames<- names(data)
  
  ## read part of data that contain the dates 2007-02-01 and 2007-02-02.
  data <- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?" ,colClasses=c("character","character",rep("numeric",7)),nrows=4000,skip=66500)
  names(data)<- datanames
  readydata<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
  data$Date <- as.Date(data$Date , "%d/%m/%y")
  Dates <- strptime(paste(readydata$Date,readydata$Time),tz = "GMT",  "%d/%m/%Y %H:%M:%S")
  ##plot data
  png("plot3.png", width=480, height=480)
  plot(Dates,readydata$Sub_metering_1    ,xlab="", ylab="Energy sub metering", type = "n")
  lines(Dates,readydata$Sub_metering_1    ,xlab="", ylab="Energy sub metering")
  lines(Dates,readydata$Sub_metering_2    ,xlab="", ylab="Energy sub metering",col="red")
  lines(Dates,readydata$Sub_metering_3    ,xlab="", ylab="Energy sub metering",col="blue")
  legend("topright" ,lty="solid", col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}