# ====================================================
# main.R
# Proyecto: ENOE - Ciencia de Datos Aplicada al Mercado Laboral
# Autor: Edder Gerardo Hernández Jiménez
# Descripción: Script maestro que ejecuta el flujo completo del análisis
# ====================================================

# 1. Cargar paquetes necesarios
source("R/01_paquetes.R")

# 2. Importar datos desde SQL Server
source("R/02_importar_datos.R")

# 3. Realizar limpieza y transformación inicial
source("R/03_limpieza_transformacion.R")

# 4. Análisis exploratorio
source("R/04_eda.R")

# 5. Modelos estadísticos (regresión / clustering)
source("R/05_modelos.R")

# 6. Visualización de resultados
source("R/06_visualizaciones.R")

# 7. Exportar outputs o reportes
source("R/07_exportar_resultados.R")
