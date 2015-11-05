# Read data for plotting from prepared CSV file
powerdata <- read.csv("powerdata.csv", header=T, sep=",", stringsAsFactors=F)
# DateTime needs to be formatted appropriately
powerdata$DateTime <-strptime(powerdata$DateTime, "%Y-%m-%d %T")
attach(powerdata)
# Plot a histoframm
#png("plot1.png")
dev.new()
hist(Global_active_power, col="Red", main="Global Active Power",xlab="Global Active Power (kiloWatts)")
# Plot a line chart
dev.new()
plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kiloWatts)")
# Plot Sub metering chart with legend
dev.new()
plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DateTime, Sub_metering_2, type="l", col="red")
lines(DateTime, Sub_metering_3, type="l", col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
# Plot 4-windows chart
dev.new()
par(mfrow=c(2,2))
plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kiloWatts)")
plot(DateTime, Voltage, type="l", ylab="Voltage")
plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DateTime, Sub_metering_2, type="l", col="red")
lines(DateTime, Sub_metering_3, type="l", col="blue")
plot(DateTime, Global_reactive_power, type="l")
detach(powerdata)
rm("powerdata")
