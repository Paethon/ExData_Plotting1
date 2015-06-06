## Load the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, as.is = TRUE, na.strings = "?")
## Combine date and time
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
## Drop the now obsolete sperate date and time column
data$Date <- NULL
data$Time <- NULL
## Subset data to wanted time period
startDate <- as.POSIXlt("2007-02-01 00:00:00")
endDate <- as.POSIXlt("2007-02-02 23:59:59")
subset <- subset(data, data$DateTime >= startDate & data$DateTime <= endDate)
## Create png file with plot
png(filename = "plot2.png", width = 480, height = 480)
plot(subset$DateTime, subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)",xlab = "", main = "")
dev.off()
