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
