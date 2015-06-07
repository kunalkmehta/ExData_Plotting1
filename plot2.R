plot2<- function (){
#install and load 'lubridate' for date time conversion
install.packages("lubridate")
library("lubridate")

filename<-"household_power_consumption.txt"

## Begin----->Read File and Create Subset##
PowerConsumptionFile <- read.table(filename, sep = ";", header = TRUE, na.string="?")
DateData <- subset(PowerConsumptionFile, PowerConsumptionFile$Date == "1/2/2007" 
                   | PowerConsumptionFile$Date == "2/2/2007")
## End----->Read File and Create Subset##

#change class to 'date'
DateData$Date <- as.Date(DateData$Date , "%d/%m/%Y")

#create a Date and Time Column by using 2 variables within the file
DateData <- cbind( DateData, "dateandtime" = paste(DateData$Date, DateData$Time, sep = " "))

#change the dateandtime class to POSIXct to plot as a continous time dimension
DateData$dateandtime <-ymd_hms(DateData$dateandtime)

## Begin----->Create png##

png(filename = "plot2.png", width = 480, height = 480, type = "cairo")

#plot within png
plot(x <- DateData$dateandtime,y <- as.numeric(as.character(DateData$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
## End----->Create png##

}