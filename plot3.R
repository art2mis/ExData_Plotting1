source("getAndPrepareMeterData.R")
meterData <- getAndPrepareMeterData()

# Plot a line graph of Sub Metering over time to PNG file plot3.png
png(filename = "plot3.png", width=480, height=480)
par(mar=c(3,4,4,2))
with(meterData, {
    plot(x=datetime, y=Sub_metering_1, type="l", ylab="Energy sub metering", col="black")
    lines(x=datetime, y=Sub_metering_2, col="red")
    lines(x=datetime, y=Sub_metering_3, col="blue")
})
legend("topright", lty=1, col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()