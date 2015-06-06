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
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2)) # Plot a grid of 2x2

## Plot global active power
plot(subset$DateTime, subset$Global_active_power, type = "l", ylab = "Global Active Power",xlab = "", main = "")

## Plot voltage
plot(subset$DateTime, subset$Voltage, type = "l", ylab = "Voltage",xlab = "datetime", main = "")

## Plot Sub_metering
plot(subset$DateTime, subset$Sub_metering_1, type = "l", ylab = "Energy sub metering",xlab = "", main = "")
lines(subset$DateTime, subset$Sub_metering_2, col="red")
lines(subset$DateTime, subset$Sub_metering_3, col="blue")
legend("topright", lty = 1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

## Plot global reactive power
plot(subset$DateTime, subset$Global_reactive_power, type = "l", xlab = "datetime",ylab = "Global_reactive_power", main = "")

dev.off()
