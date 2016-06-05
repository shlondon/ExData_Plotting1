
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

#Crea Plot 2
#Create Plot 2
#Crea plot 2

bdfeb <- bd1[bd1$Date=="1/2/2007" | bd1$Date=="2/2/2007",]

#En el eje x, en el idioma español jue es igual a Thu, vie es igual a Fri, y
#sáb es igual a Sat

#On the x axis, in the Spanish language,
#jue equals Thu, vie equals Fri, sáb and Sat equals
plot(bdfeb$Time1 , bdfeb$Global_active_power, type = "l",
     ylab = "Global Active Power (Kilowatts)",
     xlab = "")

#Crea una copia de Plot 2 en formato png
#Create a copy of Plot 2 in png format
dev.copy(png, file = "plot2.png")
dev.off()