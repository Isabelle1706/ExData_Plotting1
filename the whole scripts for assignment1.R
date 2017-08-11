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

## make the first histogram

class(data$Global_active_power)

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequenct", col="Red")

## Save the histogram to png file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


## plot 2--line gram

plot(data$Global_active_power~data$Datetime, type="l",
    ylab="Global Active Power (Kilowatts)", xlab="" )

## save the plot 2 to png file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

## plot 3--multiple lines with lengend

with(data, {plot(data$Sub_metering_1~data$Datetime, type="l",
                 ylab="Energy sub metering", xlab="")
            lines(data$Sub_metering_2~data$Datetime, col="Red")
            lines(data$Sub_metering_3~data$Datetime, col="Blue")
        
})
legend("topright", col=c("Black", "Red", "Blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## save the plot 3 to png file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

## plot 4--multiple plots in a row and in a column

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data, {plot(Global_active_power~Datetime, type="l",
                 ylab="Global Active Power (Kilowatts)", xlab="" )
        
        plot(Voltage~Datetime, type="l",
             ylab="Voltage", xlab="Datetime")
        
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime, col="Red")
        lines(Sub_metering_3~Datetime, col="Blue")
        legend("topright", col=c("Black", "Red", "Blue"), lty=1, lwd=2,
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       
        plot(Global_reactive_power~Datetime, type="l",
            ylab="Global_reactive_power" , xlab="Datetime")
        
        })

## save plot 4 to png file

dev.copy(png, file="plot4.png", height=480,width=480)
dev.off()
