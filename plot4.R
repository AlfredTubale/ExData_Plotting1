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

#Extracting Global_Reactive_Power field and making it numeric
Global_Reactive_Power <- as.numeric(power_feb_1_and_2$Global_reactive_power)

#Extracting Voltage field and making it numeric
Voltage <- as.numeric(power_feb_1_and_2$Voltage)


#Constructing  plot and saving it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#Plot 1 (Topleft)
plot(Datetime, Global_Active_Power, type="l", xlab="", ylab="Global Active Power")

#Plot 2( Topright)
plot(Datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot 3 (Bottomleft)
plot(Datetime, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Datetime, sub_Metering_2, type="l", col="red")
lines(Datetime, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=c(1,1), bty="n",cex=0.75)

#Plot 4 (Bottomright)
plot(Datetime, Global_Reactive_Power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
