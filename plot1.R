#########################################################################################################################################
#Projet ExData_Plotting1 - Plot 1
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


#Plot1
png(file = "plot1.png", width=480, height=480)

hist(data1$Global_active_power, col = "red", xlab = "Global Active Power (killowatts)", main = "Global Active Power")

dev.off()
