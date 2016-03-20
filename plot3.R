data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses=c("Time"="character", "Date" = "character"), stringsAsFactors = FALSE, na.strings=c("NA", "-", "?"))

# data$Time <- strptime(data$Time, "%H:%M:%S")

data$Date <- as.Date(data$Date, "%d/ %m/ %Y")

data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")


subsetDate <- function(x,y){data[data$Date >= x & data$Date <= y,]}
Date1 <- as.Date("2007-02-01")
Date2 <- as.Date("2007-02-02")
newData <- subsetDate(Date1, Date2)

newData$Date <- weekdays(as.Date(newData$Date))

png("plot3.png", width = 480, height = 480, units = "px")
with(newData, {
    plot(Time, Sub_metering_1, type="n", ylab="Energy Sub metering")
    lines(Time, Sub_metering_1)
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
    legend("topright",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=c(1, 1, 1),
           col=c("black", "red", "blue")
    )
})
dev.off()

