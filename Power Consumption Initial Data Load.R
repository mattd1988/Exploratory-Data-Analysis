if(!file.exists("exdata-data-household_power_consumption.zip")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  file <- unzip(temp)
  unlink(temp)
}
power <- read.table(file, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
subsetpower <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
subsetpower$Global_active_power <- as.numeric(as.character(subsetpower$Global_active_power))
subsetpower$Global_reactive_power <- as.numeric(as.character(subsetpower$Global_reactive_power))
subsetpower$Voltage <- as.numeric(as.character(subsetpower$Voltage))
subsetpower <- transform(subsetpower, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
subsetpower$Sub_metering_1 <- as.numeric(as.character(subsetpower$Sub_metering_1))
subsetpower$Sub_metering_2 <- as.numeric(as.character(subsetpower$Sub_metering_2))
subsetpower$Sub_metering_3 <- as.numeric(as.character(subsetpower$Sub_metering_3))