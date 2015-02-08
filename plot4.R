
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
png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(x = dat$Time, y = dat$Global_active_power, type = "l",
     xlab = NA, ylab = "Global Active Power")

plot(x = dat$Time, y = dat$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(x = dat$Time, y = dat$Sub_metering_1, type = "n",
     xlab = NA, ylab = "Energy sub metering")
lines(x = dat$Time, y = dat$Sub_metering_1, col = "black")
lines(x = dat$Time, y = dat$Sub_metering_2, col = "red")
lines(x = dat$Time, y = dat$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"), bty='n')

plot(x = dat$Time, y = dat$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
