# load data
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na = "?")
dataSub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# format datetimes, create variables
datetime <- strptime(paste(dataSub$Date, dataSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- dataSub$Global_active_power

# generate line graph using png device
png(filename = "plot2.png", width = 480, height = 480)
plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()