source("getAndPrepareMeterData.R")
meterData <- getAndPrepareMeterData()

# Plot a line graph of Global Active Power over time to PNG file plot2.png
png(filename = "plot2.png", width=480, height=480)
par(mar=c(3,4,4,2))
plot(x=meterData$datetime, y=meterData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
dev.off()