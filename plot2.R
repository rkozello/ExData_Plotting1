# Read data for plotting from prepared CSV file
powerdata <- read.csv("powerdata.csv", header=T, sep=",", stringsAsFactors=F)
# DateTime needs to be formatted appropriately
powerdata$DateTime <-strptime(powerdata$DateTime, "%Y-%m-%d %T")
attach(powerdata)
# Plot a line chart
png("plot2.png")
plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kiloWatts)")
dev.off()
detach(powerdata)
rm("powerdata")
