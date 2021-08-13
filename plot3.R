data <-read.table("household_power_consumption.txt", sep = ";", header = TRUE)
##Subset data for the first 2 days in February 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
##Create a new column datetime by combining Date and Time
data$datetime <- paste(data$Date, data$Time)
##Convert datetime into a Date/Time format
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")
##Convert Global active power into numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
png("plot3.png")
with(data, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")) 
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty =1, col = c("black","red","blue"))
dev.off()