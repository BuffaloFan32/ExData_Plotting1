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

#Line graph of three Sub Metering series
png(paste0(path, "plot3.png"), width=480, height=480, units = "px")
plot(type="l", Sub_metering_1 ~ datetime, power2d,
	ylab="Energy sub metering",
	xlab="")
lines(Sub_metering_2 ~ datetime, power2d, col="red")
lines(Sub_metering_3 ~ datetime, power2d, col="blue")
legend("topright", colnames(power2d[8:10]), col=c("black", "red", "blue"), lty=1)
dev.off()

x11()
plot(type="l", Sub_metering_1 ~ datetime, power2d,
	ylab="Energy sub metering",
	xlab="")
lines(Sub_metering_2 ~ datetime, power2d, col="red")
lines(Sub_metering_3 ~ datetime, power2d, col="blue")
legend("topright", colnames(power2d[8:10]), col=c("black", "red", "blue"), lty=1)






