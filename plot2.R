data <- read.table(unz("exdata_data_household_power_consumption.zip", filename='household_power_consumption.txt'),sep=";")
data$V1 <- as.Date(as.character(data$V1), format="%d/%m/%Y")
dataf <- data[data$V1 %in% as.Date(c('2007-02-01', '2007-02-02')),]
dataf$V2 <- strptime(paste(dataf$V1, dataf$V2), "%Y-%m-%d %H:%M:%S")
dataf$V3 <- as.numeric(as.character(dataf$V3))
png(filename = "plot2.png", width = 480, height = 480)
plot(dataf$V2, dataf$V3, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

