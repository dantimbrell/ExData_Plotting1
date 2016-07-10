#import data and subset for the correct dates
data<-read.table("~/Documents/coursera/explor/household_power_consumption.txt", sep = ";", header=TRUE)
used<-subset(data,Date == "1/2/2007" | Date =="2/2/2007")



used$Global_active_power<-as.numeric(as.character(used$Global_active_power))
used$Sub_metering_1<-as.numeric(as.character(used$Sub_metering_1))
used$Sub_metering_2<-as.numeric(as.character(used$Sub_metering_2))
used$Sub_metering_3<-as.numeric(as.character(used$Sub_metering_3))


used$Date<-strptime(paste(used$Date, used$Time), format = "%d/%m/%Y %H:%M:%S",tz="")


png(filename = "plot3.png")
plot(used$Date, used$Sub_metering_1, type = "l", lwd = 1, xlab="", ylab="Energy sub metering")
lines(used$Date, used$Sub_metering_2, col = "red")
lines(used$Date, used$Sub_metering_3, col = "blue")
legend(x = 'topright',legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty =1)
dev.off()