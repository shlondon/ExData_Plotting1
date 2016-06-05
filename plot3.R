
#Configurar el directorio de trabajo donde se encuentran los datos
#Set the working directory where the data is located

#Leer la base de datos
#Read the database
bd1 <- read.table("data directory", 
                  header = T, nrows = 2075259,
                  comment.char = "",
                  sep = ";",
                  na.strings = "?")

#Crea una nueva variable tipo POSIXlt que integra la información
#de la variable Date con la variable Time

#Create a new POSIXlt variable (Time1) that integrates information 
#from the variable Date with Time Variable
bd1$Time1 <- paste(bd1$Date, bd1$Time)
bd1$Time1 <- strptime(bd1$Time1, "%d/%m/%Y %H:%M:%S")

#Another way to do it, without changing the whole computer time is using 
#the setenv command like this : Sys.setenv(TZ='GMT')

#Crea Plot 3
#Create Plot 3

#Crea base de datos con la información para un periodo de 2 dias en Febrero, 2007
#Create database with information for a period of 2 days in February, 2007
bdfeb <- bd1[bd1$Date=="1/2/2007" | bd1$Date=="2/2/2007",]

#En el eje x, en el idioma español jue es igual a Thu, vie es igual a Fri, y
#sáb es igual a Sat

#On the x axis, in the Spanish language,
#jue equals Thu, vie equals Fri, sáb and Sat equals
plot(bdfeb$Time1, bdfeb$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "")
lines(bdfeb$Time1, bdfeb$Sub_metering_2, type = "l", col="red")
lines(bdfeb$Time1, bdfeb$Sub_metering_3, type = "l", col="blue")
legend("topright",lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.6)

#Crea una copia de Plot 3 en formato png
#Create a copy of Plot 3 in png format
dev.copy(png, file = "plot3.png")
dev.off()