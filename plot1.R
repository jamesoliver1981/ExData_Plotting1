#plot1
#read in the data

data<-read.csv("household_power_consumption.txt", colClasses = "character",sep=";")
#create the combined date time and convert to time
data$Date<- as.Date(data$Date, format="%d/%m/%Y")

#subset to the dates you are looking at
data2<-subset(data,data$Date=="2007-02-01" |data$Date=="2007-02-02")

#convert data to numeric - suppress warnings?
data2$Global_active_power <- as.numeric((data2$Global_active_power))

#create variable and do plot on variable
x<- data2$Global_active_power
png("plot1.png")
hist(x, xlab = "Global Active Power (kilowatts)",main="Global Active Power", 
     col="Red")
dev.off()
