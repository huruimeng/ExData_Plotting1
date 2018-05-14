#load data
sourcedata<-read.csv("./household_power_consumption.txt",header =TRUE,
                     sep=";",stringsAsFactor=FALSE, na.strings = "?",dec=".")
#convert data 
sourcedata$Date <- as.Date(sourcedata$Date, format = "%d/%m/%Y")

#subset the data
data<-subset(sourcedata, sourcedata$Date >= "2007-02-01" & sourcedata$Date <= "2007-02-02")

##Combine Date + Time into new column
data$TS <- as.POSIXct(paste(data$Date, data$Time, seperator = " "))

##Output Plot to 480 x 480 png
png("plot4.png", height = 480, width = 480)
#set the plot
par(mfrow = c(2, 2))
#1
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
#2
plot(data$Global_active_power~data$TS,type="l",ylab = "Global Active Power (kilowatts)", xlab = "")
#3
plot(data$Sub_metering_1~data$TS, type = "l", ylab = "Energy sub metering", xlab = "")
##lines(data_load_subset$TS, data_load_subset$Sub_metering_1)
lines(data$TS, data$Sub_metering_2, col = "red")
lines(data$TS, data$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2, col=c("black", "red", "blue"))
#4
plot(data$Global_reactive_power~data$TS, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

#close the plot
dev.off()