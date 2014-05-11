#plot 2
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",as.is=TRUE)

data1 <- data 
data1$Date1 <- data1$Date
data1$Date <- strptime(data1$Date,"%d/%m/%Y") 

data2 <- data1
data2$DateTime <- paste(data1$Date1,data1$Time)
data2$DateTime <- strptime(data2$DateTime,"%d/%m/%Y %H:%M:%S") 

data2 <- subset(data2 , as.Date(Date) == as.Date("2007-02-01") | as.Date(Date) == as.Date("2007-02-02"))
data2$Global_active_power <- as.character(data2$Global_active_power) # because it's of type factor
data2$Global_active_power <- as.numeric(data2$Global_active_power)

png("plot2.png", width=480, height=480)

plot(data2$DateTime,data2$Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = "")

dev.off()  ## Don't forget to close the PNG device!
