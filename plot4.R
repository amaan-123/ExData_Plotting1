fileofdata <- "household_power_consumption.txt"
data <- read.table(fileofdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(datasubset)
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(datasubset$Global_active_power)
reactivepower <- as.numeric(datasubset$Global_reactive_power)
voltage <- as.numeric(datasubset$Voltage)
Smeter1 <- as.numeric(datasubset$Sub_metering_1)
Smeter2 <- as.numeric(datasubset$Sub_metering_2)
Smeter3 <- as.numeric(datasubset$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Smeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Smeter2, type="l", col="red")
lines(datetime, Smeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, reactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

