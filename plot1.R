# Read data for plotting from prepared CSV file
powerdata <- read.csv("powerdata.csv", header=T, sep=",", stringsAsFactors=F)
# DateTime needs to be formatted appropriately
powerdata$DateTime <-strptime(powerdata$DateTime, "%Y-%m-%d %T")
attach(powerdata)
# Plot a histoframm
png("plot1.png")
hist(Global_active_power, col="Red", main="Global Active Power",xlab="Global Active Power (kiloWatts)")
dev.off()
detach(powerdata)
rm("powerdata")
