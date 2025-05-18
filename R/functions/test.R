# ====================================================
# Función: load_packages
# Descripción: Función para instalar y cargar paquetes dinamicamente
# ====================================================

# ====================================================
# EJEMPLOS DE FUNCTION 'query_builder.R'
# ====================================================
source(here::here("R/functions", "query_builder.R"))

# --------------------------------------------------------------------------
# Calcular la suma ponderada de la población objetivo del INEGI 
# según los criterios definidos por el INEGI para el 3° trimestre de 2023.
# --------------------------------------------------------------------------
count_ponderado(
  df,                                   # Dataframe unificado con las cinco tablas de la ENOE
  path = "p15ym",                       # Indicador: población objetivo (criterios universales)
  trimestre = 323,                      # Periodo: 3er trimestre de 2023
)

# --------------------------------------------------------------------------
# Calcular la suma ponderada de las mujeres no economicamente activas (pnea)
# según los criterios definidos por el INEGI para el 3° trimestre de 2023.
# --------------------------------------------------------------------------
count_ponderado(
  df,                                   # Dataframe unificado con las cinco tablas de la ENOE
  path = "p15ym.pnea",             # Indicador: población ocupada con jornada de 35-48h 
  trimestre = 323,                      # Periodo: 3er trimestre de 2023
  filtros_extra = c("sex == 2")         # Filtro adicional: solo hombres (sex == 1)
)

# --------------------------------------------------------------------------
# Calcular la suma ponderada de la población ocupada 
# que trabaja entre 35 y 48 horas a la semana, exclusivamente para hombres,
# según los criterios definidos por el INEGI para el 3° trimestre de 2023.
# --------------------------------------------------------------------------
count_ponderado(
  df,                                   # Dataframe unificado con las cinco tablas de la ENOE
  path = "po.durjt.35-48h",             # Indicador: población ocupada con jornada de 35-48h 
  trimestre = 323,                      # Periodo: 3er trimestre de 2023
  filtros_extra = c("sex == 1")         # Filtro adicional: solo hombres (sex == 1)
)



# --------------------------------------------------------------------------
# Calcular la suma ponderada de todos los indicadores
# de todos los subconjuntos existentes
# según los criterios definidos por el INEGI para el 3° trimestre de 2023.
# --------------------------------------------------------------------------
tbl_indicators_counts <- generate_counts_table(df, indicators, trimestre = 323)


# --------------------------------------------------------------------------
# Obtener tabla de totales de TODOS los indicadores establecidos por el INEGI.
# --------------------------------------------------------------------------
get_inegi_table()



#Exportar dataframe --> .csv
exportToCsv <- function(data){
  write.csv(data, here::here("outputs", "test.csv"), row.names = FALSE, fileEncoding = "UTF-8")
}
