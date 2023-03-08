fileofdata <- "household_power_consumption.txt"
data <- read.table(fileofdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(datasubset)
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(datasubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")


