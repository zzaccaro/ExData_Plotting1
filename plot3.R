# load data
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na = "?")
dataSub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# format datetimes, create variables
datetime <- strptime(paste(dataSub$Date, dataSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
s1 <- dataSub$Sub_metering_1
s2 <- dataSub$Sub_metering_2
s3 <- dataSub$Sub_metering_3

# generate line graph w/ legend using png device
png(filename = "plot3.png", width = 480, height = 480)
plot(datetime, s1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, s2, type = "l", col = "red")
lines(datetime, s3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()