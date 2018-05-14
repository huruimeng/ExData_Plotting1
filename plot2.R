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
png("plot2.png", height = 480, width = 480)
#set the plot
plot(data$Global_active_power~data$TS,type="l",ylab = "Global Active Power (kilowatts)", xlab = "")
#close the plot
dev.off()