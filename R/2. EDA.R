#Instalación de paqueterias
install.packages("skimr")
install.packages("dplyr")
install.packages("survey")
install.packages("readxl")
install.packages("ggplot2")
install.packages("knitr")
install.packages("tidyverse")
install.packages("readr") 


#Ativar paqueterias
library(skimr)
library(survey)
library(readxl)
library(knitr)
library(RODBC)
library(tidyverse)
library(readr)

#Creación de la conexión a nuestra base de datos
conexion <- odbcConnect("conexionR",uid = "sa", pwd = "reach1650")


#Almacenamiento de las tablas a través de una consulta SQL
Vivienda         <- sqlQuery(conexion, "SELECT * FROM Vivienda")
Hogar            <- sqlQuery(conexion, "SELECT * FROM Hogar")
Sdmgf            <- sqlQuery(conexion, "SELECT * FROM Sociodemográfico")
COE1             <- sqlQuery(conexion, "SELECT * FROM COE1")
COE2             <- sqlQuery(conexion, "SELECT * FROM COE2")


#Exploración del conjunto de datos:
glimpse(Vivienda)
glimpse(Hogar)
glimpse(Sdmgf)
glimpse(COE1)
glimpse(COE2)



# Agrupar y contar el número de variables por tipo 
var_vivienda <- sapply(Vivienda, class)
var_hogar <- sapply(Hogar, class)
var_sdmgf <- sapply(Sdmgf, class)
var_coe1 <- sapply(COE1, class)
var_coe2 <- sapply(COE2, class)

table(var_vivienda)
table(var_hogar)
table(var_sdmgf)
table(var_coe2)
table(var_coe2)




print(var_sdmgf[var_sdmgf != "integer"])
CS_P21_DES    CS_P23_DES     ING_X_HRS 
"character"   "character"    "numeric"


# Define la ruta de los archivos
base_path <- "P:/Downloads/Tesis/R y SQL/R/Catalogos/VIVIENDA/"

# Supongamos que tu DataFrame se llama df
for (column_name in colnames(Vivienda)) {
  # Construye el nombre del archivo CSV
  file_path <- paste0(base_path, column_name, ".csv")
  
  # Verifica si el archivo existe
  if (file.exists(file_path)) {
    # Lee el archivo CSV
    catalog <- read_csv(file_path)
    
    # Asumiendo que el catálogo tiene columnas 'clave' y 'valor'
    key_column <- "Clave"  # Cambia esto si el nombre es diferente
    value_column <- "Valor" # Cambia esto si el nombre es diferente
    
    # Crea un vector de clave-valor
    key_value_map <- setNames(catalog[[value_column]], catalog[[key_column]])
    
    # Reemplaza los valores en la columna del DataFrame
    Vivienda[[column_name]] <- key_value_map[as.character(Vivienda[[column_name]])]
  }
}



rm(columns_non_integer)




