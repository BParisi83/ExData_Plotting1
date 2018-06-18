#Load Data

data <- read.csv("C:/Users/BParisi/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

#Create a dataset with only dates 2007-02-10 and 2007-02-02

data2 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

xaxis <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Sub_metering_1 <-  as.numeric(data2$Sub_metering_1)
Sub_metering_2 <-  as.numeric(data2$Sub_metering_2)
Sub_metering_3 <- as.numeric(data2$Sub_metering_3)

png("plot4.png")
par(mfrow = c(2,2))

plot(xaxis, as.numeric(data2$Global_active_power), type="l", xlab= "", ylab ="Global Active Power",cex=0.2)

plot(xaxis, as.numeric(data2$Voltage), type="l", xlab= "", ylab ="Voltage")


plot(xaxis, Sub_metering_1,type="l", xlab="", ylab="Engery Submetering")
lines(xaxis, Sub_metering_2, type="l", col ="red")
lines(xaxis, Sub_metering_3,type="l", col ="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

plot(xaxis,as.numeric(data2$Global_reactive_power), type = "l", ylab = "Global Reactive Power (kilowatts)")

dev.off()
