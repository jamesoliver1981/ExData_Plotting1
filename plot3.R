data<-read.csv("household_power_consumption.txt", colClasses = "character",sep=";")
#create the combined date time and convert to time
data$DateTime <-paste(data$Date,data$Time)
data$DateTime<- as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S")
data$Date<- as.Date(data$Date, format="%d/%m/%Y")

#subset to the dates you are looking at
data2<-subset(data,data$Date=="2007-02-01" |data$Date=="2007-02-02")

#convert data to numeric - suppress warnings?
data2$Sub_metering_1 <- as.numeric((data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric((data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric((data2$Sub_metering_3))

x<- data2$Sub_metering_1
y<- data2$Sub_metering_2
z <-data2$Sub_metering_3

png("plot3.png")
plot(data2$DateTime,x,xlab="",ylab="Energy sub metering",type="n")
 points(data2$DateTime,x,col="black",type="l")
 points(data2$DateTime,y,col="red",type="l")
 points(data2$DateTime,z,col="blue",type="l")
legend("topright", lty = 1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.8)
dev.off()
