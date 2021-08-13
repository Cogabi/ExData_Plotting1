data <-read.table("household_power_consumption.txt", sep = ";", header = TRUE)
##Subset data for the first 2 days in February 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
##Create a new column datetime by combining Date and Time
data$datetime <- paste(data$Date, data$Time)
##Convert datetime into a Date/Time format
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")
##Convert Global active power into numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
png("plot2.png")
with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()