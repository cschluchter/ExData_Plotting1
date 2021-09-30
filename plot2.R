#Exploratory Data Analysis
#Week 1
#Course Project 1
#Plot 2

#load dplyr
library("dplyr")

#Load Data
hpc <- read.csv("C:/Users/A42512/Documents/1-1/Training/Data Science Foundations using R Specialization/Part 4 - Exploratory Data Analysis/household_power_consumption.txt", sep=";")

#create Datetime column
hpc$Datetime <- paste(hpc$Date, hpc$Time)
hpc$NewDatetime <- as.POSIXct(hpc$Datetime, format = "%d/%m/%Y %H:%M:%S")

#convert Date to Date Data Type
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

#subset the data to only Feb 1-2 of 2007
hpcFeb1and2_2007 <- filter(hpc, hpc$Date == "2007-02-01" | hpc$Date == '2007-02-02' )

#make Global_active_power numeric
hpcFeb1and2_2007$Global_active_power <- as.numeric(hpcFeb1and2_2007$Global_active_power)

#create plot 2
plot(hpcFeb1and2_2007$NewDatetime, hpcFeb1and2_2007$Global_active_power, type = "l",  xlab = "", ylab ="Global Active Power (kilowatts)")

#copy to png file
dev.copy(png, file = "plot2.png")

#turn off png device
dev.off()