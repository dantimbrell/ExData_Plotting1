
#import data and subset for the correct dates
data<-read.table("~/Documents/coursera/explor/household_power_consumption.txt", sep = ";", header=TRUE)
used<-subset(data,Date == "1/2/2007" | Date =="2/2/2007")

#convert to right type
used$Global_active_power<-as.numeric(as.character(used$Global_active_power))
used$Date<-strptime(paste(used$Date, used$Time), format = "%d/%m/%Y %H:%M:%S",tz="")
par(mfrow=c(1,1))


#plot
png(filename="plot2.png")
plot(used$Date, used$Global_active_power, type = "l", lwd = 1, xlab="", ylab="Global active power (kilowatts)")
dev.off()