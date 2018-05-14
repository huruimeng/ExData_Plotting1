#load data
sourcedata<-read.csv("./household_power_consumption.txt",header =TRUE,
                     sep=";",stringsAsFactor=FALSE, na.strings = "?",dec=".")
#convert data 
sourcedata$Date <- as.Date(sourcedata$Date, format = "%d/%m/%Y")
#subset the data
data<-subset(sourcedata, sourcedata$Date >= "2007-02-01" & sourcedata$Date <= "2007-02-02")

##Output Plot to 480 x 480 png
png("plot1.png", height = 480, width = 480)
#set the plot
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
#close the plot
dev.off()