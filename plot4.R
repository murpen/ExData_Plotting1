library(lubridate)
df = read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
df$Date <- dmy(df$Date)
dh <- subset(df,Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))
dh$datetime <- dh$Date + hms(dh$Time)
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
## plot 1
plot(dh$datetime, dh$Global_active_power, ylab='Global Active Power', xlab='', type='l')
## plot 2
plot(dh$datetime,dh$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(dh$datetime, dh$Sub_metering_2, col='red')
lines(dh$datetime, dh$Sub_metering_3, col='blue')
legend('topright',legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'),
       lty='solid', bty='n')
## plot 3
plot(dh$datetime, dh$Voltage, xlab='datetime', ylab='Voltage', type='l')
## plot 4
plot(dh$datetime, dh$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='l')
dev.off()
