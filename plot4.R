source("getAndPrepareMeterData.R")
meterData <- getAndPrepareMeterData()

# Plot four metering graphs to PNG file plot4.png
png(filename = "plot4.png", width=480, height=480)
par(mar=c(4,4,2,2))
par(mfrow = c(2,2))
with(meterData, {
    plot(x=datetime, y=Global_active_power, type="l", xlab="", ylab="Global Active Power")
    
    plot(x=datetime, y=Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    plot(x=datetime, y=Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
    lines(x=datetime, y=Sub_metering_2, col="red")
    lines(x=datetime, y=Sub_metering_3, col="blue")
    legend("topright", lty=1, bty="n", col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(datetime, Global_reactive_power, type="l")
})

dev.off()