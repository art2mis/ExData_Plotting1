# This function gets and prepares the meter data for plotting.  If the data already exists and is ready, these steps are skipped.

getAndPrepareMeterData <- function () 
{
    # Load required libraries
    library(sqldf)
    
    options(digits=3)
    
    # If the data file is not already downloaded, get it
    if (!file.exists("household_power_consumption.txt"))
    {
        print ("Downloading and extracting data...")
        zipFile <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata-data-household_power_consumption.zip")
        dataFile <- unzip("exdata-data-household_power_consumption.zip")
    }
    
    # Load the data for 2007-02-01 and 2007-02-02, if it hasn't already been loaded
    if (!exists(x = "meterData"))
    {
        print ("Loading data into meterData")
        meterData <- read.csv.sql("household_power_consumption.txt"
                          , sql="select * from file where Date in ('1/2/2007','2/2/2007')"
                          , header = TRUE
                          , sep = ";"
                          , colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

        # Add the datetime column
        meterData$datetime <- strptime(paste(meterData$Date, meterData$Time), format="%d/%m/%Y %H:%M:%S")
        
        # Add the Day factor to the meterData
        meterData <- transform(meterData, Day = factor(as.character(meterData$datetime, "%a")))
    }
    meterData
}

