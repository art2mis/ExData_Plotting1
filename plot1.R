source("getAndPrepareMeterData.R")
meterData <- getAndPrepareMeterData()

# Plot a histogram of Global Active Power frequency to PNG file plot1.png
png(filename = "plot1.png", width=480, height=480)
hist(x=meterData$Global_active_power, freq = TRUE, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()