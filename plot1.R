plot1<- function(){
  #read data
  data1 <- read.table("./household_power_consumption.txt",stringsAsFactors = FALSE,head=TRUE,sep = ";")
  
  #Process data type
  data1$Date <- as.Date(data1$Date,format="%d/%m/%Y")
  
  #subset data to two days
  data2 <- subset(data1,Date=="2007-02-01"|Date=="2007-02-02")
  
  #Process data type
  data2$Global_active_power <- as.numeric(data2$Global_active_power)
  
  #Create image
  png("plot1.png",width = 480,height = 480)
  hist(data2$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
  dev.off()
}