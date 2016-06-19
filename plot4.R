#this R script creates the 4th plot of Exploratory Data Analysis assigment


# we set the working path in which we have the data
myPath <- getwd()
pathWithData <-
    file.path(myPath, "ExData_Plotting1") #path where I have the data 
dataFile <-
    file.path(pathWithData, "household_power_consumption.txt")
#we read the data from  data file in our path
#we only read the data from 2007-02-01 and 2007-02-02 so we jump to that position in the file and read all data from these days
data <-read.table(dataFile,
                  skip = 66637,
                  nrow = 2880,
                  sep = ";")
#we read colunm names
namesList <- sapply(read.table(dataFile, nrow = 1, sep = ";"), as.character)

names(data)<-namesList

#we add a new column with date and time as a new Date object
data$dateTime<-with(data,strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

#we are going to combine 4 plots in a matrix 2x2

par(mfcol=c(2,2))
par(mar=c(4,4,1,1))

# plot 1
with (data, 
     plot( dateTime,
           Global_active_power,
           xlab="",
           ylab="Global Active Power",
           type="l" )
)

#plot 2
with (data, 
      plot( dateTime,
            Sub_metering_1,
            xlab="",
            ylab="Energy sub metering",
            type="l" )
)
#we add more points 
with(data, points(dateTime, Sub_metering_2, type = "l",col="red"))
with(data, points(dateTime, Sub_metering_3, type = "l",col="blue"))

legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#plot 3
with (data, 
      plot( dateTime,
            Voltage,
            xlab="date time",
            ylab="Voltage",
            type="l" )
)
#plot 4
with (data, 
      plot( dateTime,
            Global_reactive_power,
            xlab="date time",
            ylab="Global Reactive Power",
            type="l" )
)



#we save our graph to png graphics file
dev.copy(png,'plot4.png')
dev.off()
