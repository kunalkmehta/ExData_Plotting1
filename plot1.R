######## Plot 1 Function Start ########
plot1<- function (){
  
  filename<-"household_power_consumption.txt"
  
  ## Begin----->Read File and Create Subset##
  PowerConsumptionFile <- read.table(filename, sep = ";", header = TRUE, na.string="?")
  DateData <- subset(PowerConsumptionFile, PowerConsumptionFile$Date == "1/2/2007" 
                     | PowerConsumptionFile$Date == "2/2/2007")
  ## End----->Read File and Create Subset##
  
  
  #change class to 'date'
  DateData$Date <- as.Date(DateData$Date , "%d/%m/%Y")
  
  ## Begin----->Create png##
  png(filename = "plot1.png", width = 480, height = 480, type = "cairo")
 
  #Create histogram within png
  hist(as.numeric(as.character(DateData$Global_active_power)), 
      xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
      main = "Global Active Power", col = 2)
 
  dev.off() 
  ## End----->Create png##
  
}
######## Plot 1 Function Ends ########