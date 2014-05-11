#plot 1
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
data1 <- data 
data1$Date <- strptime(data1$Date,"%d/%m/%Y") 
data2 <- data1
data2 <- subset(data2 , as.Date(Date) == as.Date("2007-02-01") | as.Date(Date) == as.Date("2007-02-02"))
data2$Global_active_power <- as.character(data2$Global_active_power) # because it's of type factor
data2$Global_active_power <- as.numeric(data2$Global_active_power)

png("plot1.png", width=480, height=480)

hist(data2$Global_active_power, xlab = "Global active power (kilowatts)", main = "Global active power", col = "orange")

dev.off()  ## Don't forget to close the PNG device!