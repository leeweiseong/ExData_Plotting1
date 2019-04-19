# Load text file into R
df <- read.table("household_power_consumption.txt" , 
	sep = ";" , 
	header = TRUE , 
	colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric" , "numeric", "numeric"), 
	na.strings = "?" )

# Subset out 1st & 2nd Feb 2007 data
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <-  subset(df, Date == "2007-02-01" | Date == "2007-02-02")

# Combine the Date & Time and convert it to Date/Time classes
DateTime <- paste(as.character(df$Date), df$Time)
DateTime <- strptime(DateTime, "%Y-%m-%d %H:%M:%S")

# Combine the new DateTime column into the table
df <- cbind(df, DateTime)


# Plot the graph
png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))     # Set the layout to 2x2

plot(df$DateTime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(df$DateTime, df$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
points(df$DateTime, df$Sub_metering_2, type = "l", col = "red")
points(df$DateTime, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1, lwd = 1)

plot(df$DateTime, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(df$DateTime, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()