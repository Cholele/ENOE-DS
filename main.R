# ====================================================
# main.R
# Proyecto: ENOE - Ciencia de Datos Aplicada al Mercado Laboral Mexicano
# Autor: Edder Gerardo Hernández Jiménez
# Descripción: Script maestro que ejecuta el flujo completo del análisis
# ====================================================


# ============ 📌 NOTAS ============
# Este proyecto utiliza un archivo `.Renviron` para almacenar variables de entorno privadas,
# como credenciales de acceso a bases de datos (servidor, usuario, contraseña).
# Asegúrate de definirlas antes de ejecutar cualquier script que requiera conexión.

# La función `source()` permite ejecutar otro script línea por línea, 
# lo que habilita el uso de funciones cargadas externamente, como `cargar_librerias()`.

# La función `here::here()` genera rutas relativas robustas,
# siempre tomando como punto de referencia la raíz del proyecto (donde se ubica `ENOE.Rproj`),
# sin importar desde qué subcarpeta se ejecute el script (por ejemplo: `R/`, `rmarkdown/`, etc.).
# ==================================

# === 📦 Cargar scripts de funciones y procesamiento ===
source(here::here("R", "01.load_data.R"))
source(here::here("R/functions", "relations.R"))
source(here::here("R/functions", "mapping.R"))        #Ojo falta para mapeos donde son +2 columns
source(here::here("R/functions", "query_builder.R"))


# ======== 1️⃣ Cargar datos base =========
tbls        <- get_enoe_tables()        # <---- Tablas de BD SQL
dictionaries <- get_dictionaries()      # <---- Diccionarios en (data/dictionaries)
catalogs     <- get_catalogs()          # <---- Catalogs en (data/catalogs)
indicators <- get_indicators()          # <---- Diccionarios en (data/)


# === 2️⃣ Construir dataframe integrado a partir de las 5 tablas ===
df <- create_enoe_df(
  tbls$vivienda,
  tbls$hogar,
  tbls$sdmgf,
  tbls$coe1,
  tbls$coe2
)


df<- apply_indicator(df,"p15ym", 323)






rm(list = setdiff(ls(), c("tbls", "catalogs", "dictionaries", "df", "indicators", "tbl_indicators_counts")))

exportToCsv(df)
exportToCsv <- function(data){
  write.csv(data, here::here("outputs", "test.csv"), row.names = FALSE, fileEncoding = "UTF-8")
}




