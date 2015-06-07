plot3<- function (){
#install and load 'lubridate' for date time conversion
install.packages("lubridate")
library("lubridate")


filename<-"household_power_consumption.txt"

## Begin----->Read File and Create Subset##
PowerConsumptionFile <- read.table(filename, sep = ";", header = TRUE, na.string="?")
DateData <- subset(PowerConsumptionFile, PowerConsumptionFile$Date == "1/2/2007" 
                   | PowerConsumptionFile$Date == "2/2/2007")
## End----->Read File and Create Subset##

#change classes of the columns
DateData<- ChangeClass(DateData)

#create a Date and Time Column by using 2 variables within the file
DateData <- cbind( DateData, "dateandtime" = paste(DateData$Date, DateData$Time, sep = " "))

#change the dateandtime class to POSIXct to plot as a continous time dimension
DateData$dateandtime <-ymd_hms(DateData$dateandtime)


## Begin----->Create png##
png(filename = "plot3.png", width = 480, height = 480, type = "cairo")

#plot within png for submetering 1
with(DateData, plot(y = Sub_metering_1,x = dateandtime, type = "l", xlab ="", 
                 col = "gray2", ylab = "Energy sub metering"))
#plot within png for submetering 2
with(DateData, lines(y = Sub_metering_2,x = dateandtime, type = "l", 
                  col = "red"))
#plot within png for submetering 3
with(DateData, lines(y = Sub_metering_3,x = dateandtime, type = "l", 
                col = "blue"))
#Creating Legend
legend("topright", lty = 1,cex = 1, col = c("gray2", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
## End----->Create png##

}


########## Class to change classes of the columns and returning the data frame #########
ChangeClass<- function (data){
  
  Data$Date <- as.Date(Data$Date , "%d/%m/%Y")
  Data$Sub_metering_1 <- as.numeric(as.character(Data$Sub_metering_1))
  Data$Sub_metering_2 <- as.numeric(as.character(Data$Sub_metering_2))
  Data$Sub_metering_3 <- as.numeric(as.character(Data$Sub_metering_3))
  return (data); # Returning data frame
}