## Exploratory data analysis assgnment 1

rm(list=ls());

getwd()

## download athe zip file, save it to the working directory

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip")

## unzip the file

unzip("household_power_consumption.zip")

## read the data into R

powerdata=read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactor=F)

class(powerdata$Date)

## convert Data to date format from factor

powerdata$Date=as.Date(powerdata$Date, format="%d/%m/%Y")

class(powerdata$Date)

## extract 2007-02-01 and 2007-02-02 two days data

data=subset(powerdata, Date>="2007-02-01" & Date<="2007-02-02")

class(data$Time)

data$Datetime=as.POSIXct(paste(data$Date, data$Time))

## make the first histgram

class(data$Global_active_power)

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequenct", col="Red")

## Save the histogram to png file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
