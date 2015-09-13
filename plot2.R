
#plot 2
data<-read.csv("household_power_consumption.txt", colClasses = "character",sep=";")
#create the combined date time and convert to time
data$DateTime <-paste(data$Date,data$Time)
data$DateTime<- as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S")
data$Date<- as.Date(data$Date, format="%d/%m/%Y")

#subset to the dates you are looking at
data2<-subset(data,data$Date=="2007-02-01" |data$Date=="2007-02-02")

#convert data to numeric - suppress warnings?
data2$Global_active_power <- as.numeric((data2$Global_active_power))

#create plot type l - no x lab y lab = Global, main = 
png("plot2.png")
plot(data2$DateTime,data2$Global_active_power,type="l",
     xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()
