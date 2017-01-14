## Read data into R
base_file <- file("./data/household_power_consumption.txt")
power_consumption <- read.table(text = grep("^[1,2]/2/2007",readLines(base_file) ,value=TRUE), sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")

## Name and subset power consumption data
names(power_consumption) <- c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2","Sub_metering_3")
sub_power_consumption <- subset(power_consumption, power_consumption$Date=="1/2/2007" | power_consumption$Date =="2/2/2007")

## Construct Plot 1

## Open device
if(!file.exists("figures")) dir.create("figures")
png(filename = "./figures/plot1.png", width = 480, height = 480, units="px")

## Plot figure
hist(as.numeric(as.character(sub_power_consumption$Global_active_power)), col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

## Annotate graph
title(main="Global Active Power")

## Close device
dev.off()