#Exploratory Data Analysis
#Week 1
#Course Project 1
#Plot 4

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

#make data numeric that needs to be numeric
hpcFeb1and2_2007$Sub_metering_1 <- as.numeric(hpcFeb1and2_2007$Sub_metering_1)
hpcFeb1and2_2007$Sub_metering_2 <- as.numeric(hpcFeb1and2_2007$Sub_metering_2)
hpcFeb1and2_2007$Sub_metering_3 <- as.numeric(hpcFeb1and2_2007$Sub_metering_3)
hpcFeb1and2_2007$Global_active_power <- as.numeric(hpcFeb1and2_2007$Global_active_power)
hpcFeb1and2_2007$Voltage <- as.numeric(hpcFeb1and2_2007$Voltage)
hpcFeb1and2_2007$Global_reactive_power <- as.numeric(hpcFeb1and2_2007$Global_reactive_power)

#make final product

#4 figures 2 rows and 2 columns
par(mfrow = c(2,2), mar=c(4,4,1,1))
plot(hpcFeb1and2_2007$NewDatetime, hpcFeb1and2_2007$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(hpcFeb1and2_2007$NewDatetime, hpcFeb1and2_2007$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(hpcFeb1and2_2007$NewDatetime, hpcFeb1and2_2007$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering",  col = "black")
lines(hpcFeb1and2_2007$NewDatetime, hpcFeb1and2_2007$Sub_metering_2,  col = "red")
lines(hpcFeb1and2_2007$NewDatetime, hpcFeb1and2_2007$Sub_metering_3,  col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), fill = c("black", "red","blue"), cex = .5)
plot(hpcFeb1and2_2007$NewDatetime, hpcFeb1and2_2007$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#copy to png file
dev.copy(png, file = "plot4.png")

#turn off png device
dev.off()

