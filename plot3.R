# Read data for plotting from prepared CSV file
powerdata <- read.csv("powerdata.csv", header=T, sep=",", stringsAsFactors=F)
# DateTime needs to be formatted appropriately
powerdata$DateTime <-strptime(powerdata$DateTime, "%Y-%m-%d %T")
attach(powerdata)
# Plot Sub metering chart with legend
png("plot3.png")
plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DateTime, Sub_metering_2, type="l", col="red")
lines(DateTime, Sub_metering_3, type="l", col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
detach(powerdata)
rm("powerdata")
