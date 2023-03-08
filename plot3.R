fileofdata <- "household_power_consumption.txt"
data <- read.table(fileofdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(datasubset)
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(datasubset$Global_active_power)
Smeter1 <- as.numeric(datasubset$Sub_metering_1)
Smeter2 <- as.numeric(datasubset$Sub_metering_2)
Smeter3 <- as.numeric(datasubset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, Smeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Smeter2, type="l", col="red")
lines(datetime, Smeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

