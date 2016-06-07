
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

#Crea Plot 2
#Create Plot 2

#Crea base de datos con la información para un periodo de 2 dias en Febrero, 2007
#Create database with information for a period of 2 days in February, 2007
bdfeb <- bd1[bd1$Date=="1/2/2007" | bd1$Date=="2/2/2007",]

#Create a new POSIXlt variable (Time1) that integrates information 
#from the variable Date with Time Variable
bdfeb$Time1 <- paste(bdfeb$Date, bdfeb$Time)
bdfeb$Time1 <- strptime(bdfeb$Time1, "%d/%m/%Y %H:%M:%S")

#En el eje x, en el idioma español jue es igual a Thu, vie es igual a Fri, y
#sáb es igual a Sat

#Modificate the language, to spanish to english
language <- "English"
Sys.setlocale("LC_TIME", language)

#On the x axis, in the Spanish language,
#jue equals Thu, vie equals Fri, sáb and Sat equals
plot(bdfeb$Time1 , bdfeb$Global_active_power, type = "l",
     ylab = "Global Active Power (Kilowatts)",
     xlab = "")

#Crea una copia de Plot 2 en formato png
#Create a copy of Plot 2 in png format
dev.copy(png, file = "plot2.png")
dev.off()
