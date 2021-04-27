data <- read.csv("~/R/ExData_Plotting1/data/household_power_consumption.txt", header=TRUE, sep=";")

data[,1] <- as.Date(data[,1], format='%d/%m/%Y')

for (i in 3:9){
data[,i] <- as.numeric(data[,i])
}

data$weekday <- weekdays(data$Date)

str(data)

hist(data$Global_active_power, xlab = "Global Active Power (killowatts)", ylab = "Frequency", col = "red", main = "Global Active Power", xlim = c(0,7),xaxt="n", yaxt="y")
axis(side=1, at=c(0, 2, 4, 6))
axis(side=2, at=c(0, 400, 1000, 1200))
