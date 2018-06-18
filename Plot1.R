#Load Data

data <- read.csv("C:/Users/BParisi/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

#Create a dataset with only dates 2007-02-10 and 2007-02-02

data2 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

plot1 <- hist(as.numeric(data2$Global_active_power), col= "green", main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
png("plot1.png")