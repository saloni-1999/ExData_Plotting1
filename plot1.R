setwd("~/Documents/Coursera")

data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?" )
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

sub$TS <- as.POSIXct(paste(sub$Date, sub$Time))

png("plot1.png", height = 480, width = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()