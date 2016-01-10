#Read Data downloaded
arquivo <- './exR/household_power_consumption.txt'
dados <- read.table(arquivo, header=FALSE, sep=';', skip='1')

#Set colum names
colunas <- readLines(arquivo,1)
colunas <- strsplit(colunas,';',fixed=TRUE)
names(dados) <- colunas[[1]]

#Read only Dates between 1/2/2007 and 2/2/2007 and formating Date and Time
dados2 <- dados[dados$Date %in% c('1/2/2007','2/2/2007'),]

#Formating
dados2$DateTime <- strptime(paste(dados2$Date, dados2$Time), '%d/%m/%Y %H:%M:%S')

#Constructing 
plot(dados2$DateTime, dados2$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
points(dados2$DateTime, dados2$Sub_metering_2, type = 'l', xlab = '', ylab = 'Energy sub metering', col = 'red')
points(dados2$DateTime, dados2$Sub_metering_3, type = 'l', xlab = '', ylab = 'Energy sub metering',col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

#Saving file as PNG 
dev.copy(png, file='plot3.png', height=480, width=480)
dev.off()