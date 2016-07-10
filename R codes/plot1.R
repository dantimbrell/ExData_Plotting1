#import data and subset for the correct dates
data<-read.table("~/Documents/coursera/explor/household_power_consumption.txt", sep = ";", header=TRUE)
used<-subset(data,Date == "1/2/2007" | Date =="2/2/2007")
par(mfrow=c(1,1))
#convert factor to numeric
used$Global_active_power<-as.numeric(as.character(used$Global_active_power))

png(filename= "plot1.png")
#plot
hist(used$Global_active_power, col = "red", xlab = "Global active Power (kilowatts)", main = "Global active power")
dev.off()