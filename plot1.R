# load data
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na = "?")
dataSub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# create variables
gap <- dataSub$Global_active_power

# generate histogram using png device
png(filename = "plot1.png", width = 480, height = 480)
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()