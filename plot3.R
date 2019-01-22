setwd("~/Documents/Coursera")

data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?" )
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

sub$TS <- as.POSIXct(paste(sub$Date, sub$Time))

png("plot3.png", height = 480, width = 480)
plot(sub$Sub_metering_1~sub$TS, type = "l", ylab = "Energy sub metering", xlab = "")
lines(sub$TS, sub$Sub_metering_2, col = "red")
lines(sub$TS, sub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd = 2, col=c("black", "red", "blue"))
dev.off()