setwd("~/Documents/Coursera")

data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?" )
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

sub$TS <- as.POSIXct(paste(sub$Date, sub$Time))

png("plot4.png", height = 480, width = 480)
par(mfrow=c(2,2))
plot(sub$Global_active_power~sub$TS, type = "l", ylab = "Global Active Power", xlab = "")
plot(sub$Voltage~sub$TS, type = "l", ylab = "Voltage", xlab = "datetime")
plot(sub$Sub_metering_1~sub$TS, type = "l", ylab = "Energy sub metering", xlab = "")
lines(sub$TS, sub$Sub_metering_2, col = "red")
lines(sub$TS, sub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"), bty="n")
plot(sub$Global_reactive_power~sub$TS, type = "l", ylab = "Global_reactive_power", xlab = "datetime")  
dev.off()