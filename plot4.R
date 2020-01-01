library(lubridate)

#Clear variables
rm(list = ls())

#Download and unzip files
urll<-"https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
destfile<-paste0(getwd(),"/","exploratoryweek1.zip")
download.file(urll,destfile)
unzip("exploratoryweek1.zip",exdir = getwd(), list = FALSE, overwrite = TRUE)
path<-"./"

#Read the power data
power<-read.table(paste0(path, "household_power_consumption.txt"), header=TRUE, sep=';', stringsAsFactors=F)
#power[,"Date"]<-as.Date(power[,"Date"], format="%d/%m/%Y")
power2d<-power[which(power[,"Date"]=="1/2/2007"),]
power2d<-rbind(power2d, power[which(power[,"Date"]=="2/2/2007"),])
power2d[,"Global_active_power"]<-as.numeric(power2d[,"Global_active_power"])

#Combine date and time columns
datetime <- with(power2d, dmy(Date) + hms(Time))
power2d<-cbind(datetime, power2d)

#Create graphic with four graphs in it
png(paste0(path, "plot4.png"), width=480, height=480, units = "px")
par(mfrow=c(2, 2))
#Put the Global Active Power plot in the graphic
plot(type="l", Global_active_power ~ datetime, power2d,
	ylab="Global Active Power",
	xlab="")

#Put the Global Active Power plot in the graphic
plot(type="l", Voltage ~ datetime, power2d)

#Put the Sub metering plot in the graphic
plot(type="l", Sub_metering_1 ~ datetime, power2d,
	ylab="Energy sub metering",
	xlab="")
lines(Sub_metering_2 ~ datetime, power2d, col="red")
lines(Sub_metering_3 ~ datetime, power2d, col="blue")
legend("topright", colnames(power2d[8:10]), box.col = 0, col=c("black", "red", "blue"), lty=1)

#Put the Global Reactive Power plot in the graphic
plot(type="l", Global_reactive_power~ datetime, power2d)
dev.off()

x11()
par(mfrow=c(2, 2))
#Put the Global Active Power plot in the graphic
plot(type="l", Global_active_power ~ datetime, power2d,
	ylab="Global Active Power",
	xlab="")

#Put the Global Active Power plot in the graphic
plot(type="l", Voltage ~ datetime, power2d)

#Put the Sub metering plot in the graphic
plot(type="l", Sub_metering_1 ~ datetime, power2d,
	ylab="Energy sub metering",
	xlab="")
lines(Sub_metering_2 ~ datetime, power2d, col="red")
lines(Sub_metering_3 ~ datetime, power2d, col="blue")
legend("topright", colnames(power2d[8:10]), box.col = 0, col=c("black", "red", "blue"), lty=1)

#Put the Global Reactive Power plot in the graphic
plot(type="l", Global_reactive_power~ datetime, power2d)






