plot2 <- function(){
  ## To get data names
  data <- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?" ,nrows=1)
  datanames<- names(data)
  data$Date <- as.Date(data$Date, "%d/%m/%y")
  ## read part of data that contain the dates 2007-02-01 and 2007-02-02.
  data <- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?" ,colClasses=c("character","character",rep("numeric",7)),nrows=4000,skip=66500)
  names(data)<- datanames
  readydata<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
  
  readydata$Date <- strptime(paste(readydata$Date,readydata$Time), "%d/%m/%y %H:%M:%S")
  ##plot data
 # png("plot2.png", width=480, height=480)
  plot(readydata$Date,readydata$Global_active_power,xlab="", ylab="Global Active Power(kilowatts)", type = "l")
  #hist(readydata$Global_active_power,col="red",xlab="Global Active Power (Kilowatts)",main="Global Active Power")
#  dev.off()
}