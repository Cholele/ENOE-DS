
#Instalación de paqueteria 
install.packages("RODBC")
install.packages("odbc")

#Ativar paqueteria
library(RODBC)
library(odbc)

#OJO Uso de .Renviron para almacenar variables de entorno privadas
file.edit(".Renviron")

#Creamos la conexión a nuestra base de datos
#Uso de Sys.getenv() para leer variables de entorno almacenadas fuera del script (.Renviron)
con <- dbConnect(odbc::odbc(),
                 Driver   = "ODBC Driver 17 for SQL Server",
                 Server   = Sys.getenv("SQL_SERVER"),
                 Database = Sys.getenv("SQL_DATABASE"),
                 UID      = Sys.getenv("SQL_UID"),
                 PWD      = Sys.getenv("SQL_PWD"))

#Almacenamos nuestras tablas a través de una consulta SQL
vivienda           <- dbGetQuery(con, "SELECT * FROM vivienda")
hogar              <- dbGetQuery(con, "SELECT * FROM hogar")
sdmgf              <- dbGetQuery(con, "SELECT * FROM sdmgf")
coe1               <- dbGetQuery(con, "SELECT * FROM coe1")
coe2               <- dbGetQuery(con, "SELECT * FROM coe2")

#Visualizamos la información
View(vivienda)
View(hogar)
View(sdmgf)
View(coe1)
View(coe2)

usethis::use_git()




