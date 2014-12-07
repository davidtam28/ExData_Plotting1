data <- read.table(unz("exdata_data_household_power_consumption.zip", filename='household_power_consumption.txt'),sep=";")
data$V1 <- as.Date(as.character(data$V1), format="%d/%m/%Y")
dataf <- data[data$V1 %in% as.Date(c('2007-02-01', '2007-02-02')),]
dataf$V2 <- strptime(paste(dataf$V1, dataf$V2), "%Y-%m-%d %H:%M:%S")
dataf$V3 <- as.numeric(as.character(dataf$V3))
dataf$V4 <- as.numeric(as.character(dataf$V4))
dataf$V5 <- as.numeric(as.character(dataf$V5))
dataf$V6 <- as.numeric(as.character(dataf$V6))
dataf$V7 <- as.numeric(as.character(dataf$V7))
dataf$V8 <- as.numeric(as.character(dataf$V8))
dataf$V9 <- as.numeric(as.character(dataf$V9))

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(dataf$V2, dataf$V3, type="l", xlab="", ylab="Global Active Power")

plot(dataf$V2, dataf$V5, type="l", xlab="datetime", ylab="Voltage")

plot(dataf$V2, dataf$V7, type="l", xlab="", ylab="Energy Sub metering", col="black")
lines(dataf$V2, dataf$V8, type="l", xlab="", col="red")
lines(dataf$V2, dataf$V9, type="l", xlab="", col="blue")
legend("topright", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),
       col = c("black", "red", "blue"), lwd=1, bty = "n")


plot(dataf$V2, dataf$V4, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
