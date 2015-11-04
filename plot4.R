# Read data for plotting from prepared CSV file
powerdata <- read.csv("powerdata.csv", header=T, sep=",", stringsAsFactors=F)
# DateTime needs to be formatted appropriately
powerdata$DateTime <-strptime(powerdata$DateTime, "%Y-%m-%d %T")
attach(powerdata)
# Plot 4-windows chart
png("plot4.png")
par(mfrow=c(2,2))
plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kiloWatts)")
plot(DateTime, Voltage, type="l", ylab="Voltage")
plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DateTime, Sub_metering_2, type="l", col="red")
lines(DateTime, Sub_metering_3, type="l", col="blue")
plot(DateTime, Global_reactive_power, type="l")
dev.off()
detach(powerdata)
rm("powerdata")
