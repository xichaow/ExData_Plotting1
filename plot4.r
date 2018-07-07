plot4<- function(){
  #read data
  data1 <- read.table("./household_power_consumption.txt",stringsAsFactors = FALSE,head=TRUE,sep = ";")
  
  #Process data type
  data1$Date <- as.Date(data1$Date,format="%d/%m/%Y")
  
  #subset data to two days
  data2 <- subset(data1,Date=="2007-02-01"|Date=="2007-02-02")
  
  #Combine date and time
  datetime <- strptime(paste(data2$Date,data2$Time,sep = " "),"%Y-%m-%d %H:%M:%S")
  
  #Process data type
  data2$Global_active_power <- as.numeric(data2$Global_active_power)
  
  #Create image
  png("plot4.png",width = 480,height = 480)
  par(mfrow=c(2,2))
  plot(datetime, data2$Global_active_power, xlab = "",ylab="Global Active Power",type="l")
  plot(datetime, data2$Voltage, ylab="Voltage",xlab = "datetime", type="l")
  plot(datetime, data2$Sub_metering_1, xlab = "",ylab="Energy sub metering",type="l")
  lines(datetime,data2$Sub_metering_2,type = "l",col="red")
  lines(datetime,data2$Sub_metering_3,type = "l",col="blue")
  legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1,lwd = 2,col=c("black", "red", "blue"))
  plot(datetime, data2$Global_reactive_power, ylab="Global_reactive_power",xlab = "datetime", type="l")
  dev.off()
}