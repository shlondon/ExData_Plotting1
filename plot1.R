
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

#Crea Plot 1
#Create Plot 1
hist(bdfeb$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

#Crea una copia de Plot 1 en formato png
#Create a copy of Plot 1 in png format
dev.copy(png, file = "plot1.png")
dev.off()
