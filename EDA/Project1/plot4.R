#Libraries we might need:
library('lubridate')

# Unzip the file in the folder & read the data (check amount of time taken)
# While reading the data, ensure that '?' is treated as a NA
file<-unzip("exdata-data-household_power_consumption.zip")
system.time(data<-read.table(file,header=T,sep=";",as.is=F,na.strings=c("",NA,"?"),stringsAsFactors=F))

#checking the size of the file: ~ 126MB
object.size(data)

#Formating the Date column to 'Date' and only selecting rows that are 1st -2nd Feb '2007.
#Also concatinating the date and time and removing the time column.

data$Date<-dmy(data$Date)
data<-data[data$Date==ymd("20070201") | data$Date==ymd("20070202"),]
data$Date<-paste(data$Date,data$Time)
data$Date<-strptime(data$Date,"%Y-%m-%d %H:%M:%S")
data$Time<-NULL

#creating the graphs:
png("plot4.png",width=480,height=480,units='px')
par(mfrow=c(2,2))

with(data,plot(Date,Global_active_power,xlab="",ylab="Global Active Power",type="n"))
with(data,lines(Date,Global_active_power))

with(data,plot(Date,Voltage,xlab="datetime",ylab="Voltage",type="n"))
with(data,lines(Date,Voltage))

with(data,plot(Date,Sub_metering_1,xlab="",ylab="Energy sub metering",type='n'))
with(data,{
  lines(Date,Sub_metering_1)
  lines(Date,Sub_metering_2,col="red")
  lines(Date,Sub_metering_3,col="blue")
  })
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.col="white",pt.cex=1)

with(data,plot(Date,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n"))
with(data,lines(Date,Global_reactive_power))

dev.off()


