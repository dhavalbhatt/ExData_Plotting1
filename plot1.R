data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses=c("Time"="character", "Date" = "character"), stringsAsFactors = FALSE, na.strings=c("NA", "-", "?"))

data$Time <- strptime(data$Time, "%H:%M:%S")

data$Date <- as.Date(data$Date, "%d/ %m/ %Y")

subsetDate <- function(x,y){data[data$Date >= x & data$Date <= y,]}
Date1 <- as.Date("2007-02-01")
Date2 <- as.Date("2007-02-02")
newData <- subsetDate(Date1, Date2)

hist(newData$Global_active_power, col = "red", xlab = "Global Active Power (killowatts)", main = "Global Active Power")

dev.copy(png, file = "plot1.png", width=480, height=480, units ="px")
dev.off()
