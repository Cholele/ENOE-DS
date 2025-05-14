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

# === 1️⃣ Cargar datos base: tablas, diccionarios y catálogos ===
tbls        <- get_enoe_tables()
dictionaries <- get_dictionaries()
catalogs     <- get_catalogs()

# === 2️⃣ Construir dataframe integrado a partir de las 5 tablas ===
df <- create_enoe_df(
  tbls$vivienda,
  tbls$hogar,
  tbls$sdmgf,
  tbls$coe1,
  tbls$coe2
)



