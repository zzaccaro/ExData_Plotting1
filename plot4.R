# load data
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na = "?")
dataSub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# format datetimes, create variables
datetime <- strptime(paste(dataSub$Date, dataSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- dataSub$Global_active_power
grp <- dataSub$Global_reactive_power
voltage <- dataSub$Voltage
s1 <- dataSub$Sub_metering_1
s2 <- dataSub$Sub_metering_2
s3 <- dataSub$Sub_metering_3

# generate 2x2 base for graphs using png device
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

#top left
plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power")

#top right
plot(datetime, voltage, type = "l", ylab = "Voltage")

#bottom left
plot(datetime, s1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, s2, type = "l", col = "red")
lines(datetime, s3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "n")

#bottom right
plot(datetime, grp, type = "l", ylab = "Global_reactive_power")

dev.off()