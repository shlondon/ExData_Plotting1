#Configurar el directorio de trabajo donde se encuentran los datos
#Set the working directory where the data is located

#Leer la base de datos
#Read the database
bd1 <- read.table("data directory", 
                  header = T, nrows = 2075259,
                  comment.char = "",
                  sep = ";",
                  na.strings = "?")

#Crea base de datos con la información para un periodo de 2 dias en Febrero, 2007
#Create database with information for a period of 2 days in February, 2007
bdfeb <- bd1[bd1$Date=="1/2/2007" | bd1$Date=="2/2/2007",]

#Crea una nueva variable tipo POSIXlt que integra la información
#de la variable Date con la variable Time

#Create a new POSIXlt variable (Time1) that integrates information 
#from the variable Date with Time Variable
bdfeb$Time1 <- paste(bdfeb$Date, bdfeb$Time)
bdfeb$Time1 <- strptime(bdfeb$Time1, "%d/%m/%Y %H:%M:%S")

#Modificate the language, to spanish to english, this step is necesary because
#i need values in x axis with English language
language <- "English"
Sys.setlocale("LC_TIME", language)

#Crea Plot 3
#Create Plot 3

#initialize plot graphic
png('plot4.png')

#Split graphic device into 4
par(mfrow=c(2,2))

#Plot row 1, col 1
plot(bdfeb$Time1 , bdfeb$Global_active_power, type = "l",
     ylab = "Global Active Power (Kilowatts)",
     xlab = "")

#Plot row 1, col 2
plot(bdfeb$Time1 , bdfeb$Voltage, type = "l",
     ylab = "Voltage",
     xlab = "datatime")

#Plot row 2, col 1
plot(bdfeb$Time1, bdfeb$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "")
lines(bdfeb$Time1, bdfeb$Sub_metering_2, type = "l", col="red")
lines(bdfeb$Time1, bdfeb$Sub_metering_3, type = "l", col="blue")
legend("topright",lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n",
       cex = 1)

#Plot row 2, col 2
plot(bdfeb$Time1 , bdfeb$Global_reactive_power, type = "l",
     ylab = "Global_reactive_power",
     xlab = "datatime")

#close graphics device, saving the png
dev.off()

