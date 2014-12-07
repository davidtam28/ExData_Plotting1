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
png(filename = "plot3.png", width = 480, height = 480)


df <- data.frame( time = dataf$V2, Sub_metering_1 = dataf$V7,
                 Sub_metering_2 = dataf$V8,
                 Sub_metering_3 = dataf$V9)

df <- melt(df ,  id = 'time', variable_name = 'series')

plot3 <- ggplot(df, aes(time,value)) + geom_line(aes(colour = series))
plot3 <- plot3 + scale_color_manual(values=c("black", "red", "blue"))
plot3 <- plot3 + theme(panel.background = element_rect(fill = 'white', colour = 'BLACK'))
plot3 <- plot3 + theme(
                  plot.background = element_blank()
                  ,panel.grid.major = element_blank()
                  ,panel.grid.minor = element_blank()
                  ,panel.border = element_blank()
                  ,legend.position = c(1,1)
                  , legend.justification = c(1,1)
                )
plot3 <- plot3 + theme(legend.title=element_blank())
plot3 <- plot3 + theme(axis.title.x=element_blank())
plot3 <- plot3 + ylab("Energy sub metering")
plot3 <- plot3 + scale_x_datetime(labels = date_format("%a"), breaks = date_breaks("day"))
plot3
dev.off()

