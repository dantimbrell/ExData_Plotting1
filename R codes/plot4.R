#import data and subset for the correct dates.
data<-read.table("~/Documents/coursera/explor/household_power_consumption.txt", sep = ";", header=TRUE)
used<-subset(data,Date == "1/2/2007" | Date =="2/2/2007")



used$Global_active_power<-as.numeric(as.character(used$Global_active_power))
used$Sub_metering_1<-as.numeric(as.character(used$Sub_metering_1))
used$Sub_metering_2<-as.numeric(as.character(used$Sub_metering_2))
used$Sub_metering_3<-as.numeric(as.character(used$Sub_metering_3))
used$Voltage<-as.numeric(as.character(used$Voltage))
used$Global_reactive_power<-as.numeric(as.character(used$Global_reactive_power))
used$Date<-strptime(paste(used$Date, used$Time), format = "%d/%m/%Y %H:%M:%S",tz="")

#plot all 4

png(filename="plot4.png")
par(mfrow=c(2,2))
plot(used$Date, used$Global_active_power, type = "l", lwd = 1, xlab="", ylab="Global Active Power")

plot(used$Date, used$Voltage, type = "l", lwd = 1, xlab="datetime", ylab="Voltage")

plot(used$Date, used$Sub_metering_1, type = "l", lwd = 1, xlab="", ylab="Energy sub metering")
lines(used$Date, used$Sub_metering_2, col = "red")
lines(used$Date, used$Sub_metering_3, col = "blue")
legend(x = 'topright',legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty =1, cex=0.6)

plot(used$Date, used$Global_reactive_power, type = "l", lwd = 1, xlab="datetime", ylab="Global_reactive_power")
dev.off()
