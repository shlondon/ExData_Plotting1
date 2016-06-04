
#Configurar el directorio de trabajo donde se encuentran los datos
#Set the working directory where the data is located
setwd("C:/Users/USUARIO/ExData_Plotting1")

#Leer la base de datos
#Read the database
bd1 <- read.table("data directory", 
                  header = T, nrows = 2075259,
                  comment.char = "",
                  sep = ";",
                  na.strings = "?")

#Crea Plot 1
#Create Plot 1
hist(bd1$Global_active_power,
     col = "green",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

#Crea una copia de Plot 1 en formato png
#Create a copy of Plot 1 in png format
dev.copy(png, file = "plot1.png")
dev.off()
