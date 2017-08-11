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
