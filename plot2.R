#this R script creates the second plot of Exploratory Data Analysis assigment


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

#histogram of first plot
with (data, 
     plot( strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"),
           Global_active_power,
           xlab="date",
           ylab="Global Active Power (kilowatts)",
           type="l"
         )
)
#we save our graph to png graphics file
dev.copy(png,'plot2.png')
dev.off()
