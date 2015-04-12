library(lubridate)
df = read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
df$Date <- dmy(df$Date)
dh <- subset(df,Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))
dh$datetime <- dh$Date + hms(dh$Time)
png("plot3.png", width = 480, height = 480)
plot(dh$datetime,dh$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(dh$datetime, dh$Sub_metering_2, col='red')
lines(dh$datetime, dh$Sub_metering_3, col='blue')
legend('topright',legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'),
       lty='solid')
dev.off()
