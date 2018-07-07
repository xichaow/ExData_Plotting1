plot2<- function(){
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
  png("plot2.png",width = 480,height = 480)
  plot(datetime, data2$Global_active_power, xlab = "",ylab="Global Active Power (kilowatts)",type="l")
  dev.off()
}