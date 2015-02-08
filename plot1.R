
fileUrl <- "../household_power_consumption.txt"

if (!file.exists(fileUrl)) {
    stop("Input data file is not available")
}

## Read data
dat <- read.csv(fileUrl, sep = ";", na.strings = "?")
dat$Time <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02", ]

## Create Plot 
png(filename="plot1.png", width = 480, height = 480)

hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()
