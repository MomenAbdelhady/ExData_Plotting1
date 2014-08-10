plot1 <- function(){
  
  ## To get data names
  data <- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?" ,nrows=1)
  datanames<- names(data)
  
  ## read part of data that contain the dates 2007-02-01 and 2007-02-02.
  data <- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?" ,nrows=4000,skip=66500)
  names(data)<- datanames
  readydata<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
  
  hist(readydata$Global_active_power,col="red",xlab="Global Active Power (Kilowatts)",main="Global Active Power")

}
