# Load text file into R
df <- read.table("household_power_consumption.txt" , 
	sep = ";" , 
	header = TRUE , 
	colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric" , "numeric", "numeric"), 
	na.strings = "?" )

# Subset out 1st & 2nd Feb 2007 data
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <-  subset(df, Date == "2007-02-01" | Date == "2007-02-02")

# Plot the graph
png(filename = "plot1.png", width = 480, height = 480)

hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()