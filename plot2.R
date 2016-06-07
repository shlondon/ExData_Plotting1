
#Configurar el directorio de trabajo donde se encuentran los datos
#Set the working directory where the data is located

#Leer la base de datos
#Read the database
bd1 <- read.table("data directory", 
                  header = T, nrows = 2075259,
                  comment.char = "",
                  sep = ";",
                  na.strings = "?")

#Crea Plot 2
#Create Plot 2

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

#Plot
plot(bdfeb$Time1 , bdfeb$Global_active_power, type = "l",
     ylab = "Global Active Power (Kilowatts)",
     xlab = "")

#Crea una copia de Plot 2 en formato png
#Create a copy of Plot 2 in png format
dev.copy(png, file = "plot2.png")
dev.off()
