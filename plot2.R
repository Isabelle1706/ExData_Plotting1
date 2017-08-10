## plot 2--line gram

plot(data$Global_active_power~data$Datetime, type="l",
    ylab="Global Active Power (Kilowatts)", xlab="" )

## save the plot 2 to png file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off
