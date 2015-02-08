
fileUrl <- "../household_power_consumption.txt"

if (!file.exists(fileUrl)) {
    stop("Input data file is not available")
}

## Read data
dat <- read.csv(fileUrl, sep = ";", na.strings = "?")
dat$Time <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat <- dat[dat$Date == "2007-02-01" | dat$Date == "2007-02-02", ]

## Set locale to English
Sys.setlocale("LC_TIME", "C")

## Create Plot 
png(filename="plot3.png", width = 480, height = 480)

plot(x = dat$Time, y = dat$Sub_metering_1, type = "n",
     xlab = NA, ylab = "Energy sub metering")
lines(x = dat$Time, y = dat$Sub_metering_1, col = "black")
lines(x = dat$Time, y = dat$Sub_metering_2, col = "red")
lines(x = dat$Time, y = dat$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))

dev.off()
