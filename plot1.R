#Exploratory Data Analysis
#Week 1
#Course Project 1
#Plot 1

#load dplyr
library("dplyr")

#Load Data
hpc <- read.csv("C:/Users/A42512/Documents/1-1/Training/Data Science Foundations using R Specialization/Part 4 - Exploratory Data Analysis/household_power_consumption.txt", sep=";")

#convert Date to Date Data Type
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

#subset the data to only Feb 1-2 of 2007
hpcFeb1and2_2007 <- filter(hpc, hpc$Date == "2007-02-01" | hpc$Date == '2007-02-02' )

#create Plot 1
hist(as.numeric(hpcFeb1and2_2007$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" , ylab = "Frequency")

#copy to png file
dev.copy(png, file = "plot1.png")

#turn off png device
dev.off()