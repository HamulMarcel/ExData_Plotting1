#########################################################################################################################################
#Projet ExData_Plotting1 - Plot 3
#########################################################################################################################################

# input data
data <- read.csv("~/R/data/household_power_consumption.txt", header=TRUE, sep=";")

#Explorer data part 1
dim(data)

str(data)

#Cleaning data
data$Date.Time <- paste(data$Date, data$Time, sep = " ")
data$Date.Time <- strptime(data$Date.Time, format = "%d/%m/%Y %H:%M:%OS")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, !is.na(data[,3]))

for (i in 3:9){
  data[,i] <- as.numeric(as.character(data[,i]))
}

#Filter data
data1 <- subset(data, Date == "2007-2-1" | Date == "2007-2-2")

#Plot3
png(file = "plot3.png", width=480, height=480)

plot(data1$Date.Time, data1$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="")
lines(data1$Date.Time, data1$Sub_metering_2, type = "l", col = "red")
lines(data1$Date.Time, data1$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()


