# Dataset from https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
# Run script in same directory as uncompressed dataset

# Read data from 2007-02-01 and 2007-02-02
pc <- readLines(pipe('grep -E "^2/2/2007|^1/2/2007" "household_power_consumption.txt"'));
pc <- read.csv(text=pc, sep=';', header=F);
names(pc) <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
pc$date <- as.Date(strptime(pc$date, "%d/%m/%Y"));
pc$time <- as.POSIXct(strptime(paste(pc$date,pc$time), "%Y-%m-%d %H:%M:%S"))

# Plot 2 is Global Active Power vs Time
png(filename="plot2.png", width=480, height=480, units="px")
plot(pc$time, pc$global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n")
lines(pc$time, pc$global_active_power)
dev.off()