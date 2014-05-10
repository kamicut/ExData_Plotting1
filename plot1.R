# Dataset from https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
# Run script in same directory as uncompressed dataset

# Read data from 2007-02-01 and 2007-02-02
pc <- readLines(pipe('grep -E "^2/2/2007|^1/2/2007" "household_power_consumption.txt"'));
pc <- read.csv(text=pc, sep=';', header=F);
names(pc) <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
pc$date <- as.Date(strptime(pc$date, "%d/%m/%Y"));
pc$time <- as.POSIXct(strptime(paste(pc$date,pc$time), "%Y-%m-%d %H:%M:%S"))

# Plot 1 is histogram of Global Active Power
png(filename="plot1.png", width=480, height=480, units="px")
hist(pc$global_active_power, col='red', xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()