## Read data into R
base_file <- file("./data/household_power_consumption.txt")
power_consumption <- read.table(text = grep("^[1,2]/2/2007",readLines(base_file), value=TRUE), sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")

## Name and subset power consumption data
names(power_consumption) <- c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2","Sub_metering_3")
sub_power_consumption <- subset(power_consumption, power_consumption$Date=="1/2/2007" | power_consumption$Date =="2/2/2007")

## Transform Date and Time into objects of type Date and POSIXlt
sub_power_consumption$Date <- as.Date(sub_power_consumption$Date, format="%d/%m/%Y")
sub_power_consumption$Time <- strptime(sub_power_consumption$Time, format="%H:%M:%S")
sub_power_consumption[1:1440,"Time"] <- format(sub_power_consumption[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_power_consumption[1441:2880,"Time"] <- format(sub_power_consumption[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## Construct Plot 2

## Open device
if(!file.exists("figures")) dir.create("figures")
png(filename = "./figures/plot2.png", width = 480, height = 480, units="px")

## Plot figure
plot(sub_power_consumption$Time,as.numeric(as.character(sub_power_consumption$Global_active_power)),type="l",xlab="", ylab="Global Active Power (kilowatts)")

## Close device
dev.off()