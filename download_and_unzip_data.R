## Extracting and downloading source data

if(!file.exists("./data")) dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/household_power_consumption.zip")

## Unzipping household_power_consumption.zip to /data directory

unzip(zipfile = "./data/household_power_consumption.zip", exdir = "./data")