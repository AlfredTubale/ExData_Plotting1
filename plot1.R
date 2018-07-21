#Reading the Electric Power Consumption Data
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",dec=".")

#Extracting a subset data dated Feb 1 and 2 only
power_feb_1_and_2 <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


#Extracting Global_active_power field and making it numeric
Global_Active_Power <- as.numeric(power_feb_1_and_2$Global_active_power)


#Constructing Histogram plot and saving it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot1.png", width=480, height=480)
hist(Global_Active_Power,
     col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")

dev.off()

