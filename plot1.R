#Read Data downloaded
arquivo <- './exR/household_power_consumption.txt'
dados <- read.table(arquivo, header=FALSE, sep=';', skip='1')

#Set colum names
colunas <- readLines(arquivo,1)
colunas <- strsplit(colunas,';',fixed=TRUE)
names(dados) <- colunas[[1]]


#Read only Dates between 1/2/2007 and 2/2/2007 and formating Date and Time
dados$DateTime <- strptime(paste(dados$Date, dados$Time), '%d/%m/%Y %H:%M:%S')
dados2 <- dados[dados$Date %in% c(1/2/2007,2/2/2007)]

#Convert Factor in a Number. First its necessary to convert to an character and them to number
dados3 <- as.numeric(as.character(dados2$Global_active_power))

#Constructing
hist(dados3, ylab='Frequency', xlab='Global Active Power (Killowats)', main='Global Active Power', col='red')

#Saving file as PNG 
dev.copy(png, file='plot1.png', height=480, width=480)
dev.off()
