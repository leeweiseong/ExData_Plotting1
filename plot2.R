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
png(filename = "plot2.png", width = 480, height = 480)

plot(df$DateTime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()