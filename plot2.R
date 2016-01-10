#Read Data downloaded
arquivo <- './exR/household_power_consumption.txt'
dados <- read.table(arquivo, header=FALSE, sep=';', skip='1')

#Set colum names
colunas <- readLines(arquivo,1)
colunas <- strsplit(colunas,';',fixed=TRUE)
names(dados) <- colunas[[1]]

#Read only Dates between 1/2/2007 and 2/2/2007 and formating Date and Time
dados2 <- dados[dados$Date %in% c('1/2/2007','2/2/2007'),]


#Constructing 
dados2$DateTime <- strptime(paste(dados2$Date, dados2$Time), '%d/%m/%Y %H:%M:%S')
#This converts the Factor into a Number, first its necessary to convert to a character and them to a number
GlobalActivePower <- as.numeric(as.character(dados2$Global_active_power))
plot(dados2$DateTime, GlobalActivePower, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')

#Saving file as PNG 
dev.copy(png, file='plot2.png', height=480, width=480)
dev.off()