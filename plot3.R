#Reading the Electric Power Consumption Data
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",dec=".")

#Extracting a subset data dated Feb 1 and 2 only
power_feb_1_and_2 <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


#Extracting Global_active_power field and making it numeric
Global_Active_Power <- as.numeric(power_feb_1_and_2$Global_active_power)


#Making a Datetime Field by combining Date and Time Fields
Datetime <- strptime(paste(power_feb_1_and_2$Date, power_feb_1_and_2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#Extracting Sub_metering fields and making it numeric 
sub_Metering_1 <- as.numeric(power_feb_1_and_2$Sub_metering_1)
sub_Metering_2 <- as.numeric(power_feb_1_and_2$Sub_metering_2)
sub_Metering_3 <- as.numeric(power_feb_1_and_2$Sub_metering_3)


#Constructing  plot and saving it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot3.png", width=480, height=480)
plot(Datetime, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Datetime, sub_Metering_2, type="l", col="red")
lines(Datetime, sub_Metering_3, type="l", col="blue")


legend("topright", 
       lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
