#Exploratory Data Analysis
#Week 1
#Course Project 1
#Plot 3

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

#make Sub_metering data numeric
hpcFeb1and2_2007$Sub_metering_1 <- as.numeric(hpcFeb1and2_2007$Sub_metering_1)
hpcFeb1and2_2007$Sub_metering_2 <- as.numeric(hpcFeb1and2_2007$Sub_metering_2)
hpcFeb1and2_2007$Sub_metering_3 <- as.numeric(hpcFeb1and2_2007$Sub_metering_3)

#create Plot 3
plot(hpcFeb1and2_2007$NewDatetime, hpcFeb1and2_2007$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering",  col = "black")
lines(hpcFeb1and2_2007$NewDatetime, hpcFeb1and2_2007$Sub_metering_2,  col = "red")
lines(hpcFeb1and2_2007$NewDatetime, hpcFeb1and2_2007$Sub_metering_3,  col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), fill = c("black", "red","blue"), cex = .5)

#copy to png file
dev.copy(png, file = "plot3.png")

#turn off png device
dev.off()