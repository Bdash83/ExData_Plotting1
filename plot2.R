##########################################################################################################
#
# Description:
#   plot2.r - Read the power consumption file and create plot2.png
#
# Author:
#   [1] Biswajeeban Dash, BD, +917328054605
#
# History:
#   [1]2016-06-26 - Initial Version
#
# Files URL:
#   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
##########################################################################################################


# Clean up workspace
rm(list=ls())

# set working directory where you want to download the datasets
setwd("C:/Users/bdash/Desktop/Coursera/R")

# download the file and put the file in the data folder
if(!file.exists("./ExData_Project1")){dir.create("./ExData_Project1")}

# Since there will be 3 more plots to follow in separate codes, download the file only once
if (!file.exists("./ExData_Project1/household_power_consumption.txt"))
{
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl,destfile="./ExData_Project1/power_consumption.zip")
    unzip(zipfile="./ExData_Project1/power_consumption.zip",exdir="./ExData_Project1")
}

# set the working directory to new path
setwd("C:/Users/bdash/Desktop/Coursera/R/ExData_Project1")

# read the file keeping in mind that ? aare missing values
powerData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# subset powerData to use only dates 2007-02-01 and 2007-02-02
powerData <- subset(powerData,Date == "1/2/2007" | Date == "2/2/2007")

# add Date/Time class variable by converting Date and Time
powerData$DateTime <- strptime(paste(as.character(powerData$Date),as.character(powerData$Time)),"%d/%m/%Y %H:%M:%S")

# open png device
png("plot2.png",width=480,height=480,units="px")

# plot data
plot(powerData$DateTime,powerData$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)",type = "l")

# Turn off device
dev.off()
