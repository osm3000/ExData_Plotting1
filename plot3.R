#plot 3
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",as.is=TRUE)

data1 <- data 
data1$Date1 <- data1$Date
data1$Date <- strptime(data1$Date,"%d/%m/%Y") 

data2 <- data1
data2$DateTime <- paste(data1$Date1,data1$Time)
data2$DateTime <- strptime(data2$DateTime,"%d/%m/%Y %H:%M:%S") 

data2 <- subset(data2 , as.Date(Date) == as.Date("2007-02-01") | as.Date(Date) == as.Date("2007-02-02"))

data2$Sub_metering_1 <- as.character(data2$Sub_metering_1) # because it's of type factor
data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)

data2$Sub_metering_2 <- as.character(data2$Sub_metering_2) # because it's of type factor
data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)

data2$Sub_metering_3 <- as.character(data2$Sub_metering_3) # because it's of type factor
data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(data2$DateTime,data2$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data2$DateTime,data2$Sub_metering_2, col = "red")
lines(data2$DateTime,data2$Sub_metering_3, col = "blue")
legend("topright",lty  = 1,col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()  ## Don't forget to close the PNG device!
