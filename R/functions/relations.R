# === Cargar paquetes necesarios para relaciones ===
source(here::here("R/functions", "load_packages.R"))
cargar_librerias("relations")

# === Generador completo de df ENOE unificado ===
create_enoe_df <- function(vivienda, hogar, sdmgf, coe1, coe2) {
  
  # === Llaves oficiales según documentación INEGI ===
  claves <- list(
    vivienda = c("CD_A", "ENT", "CON", "V_SEL", "TIPO", "MES_CAL"),
    hogar    = c("CD_A", "ENT", "CON", "V_SEL", "TIPO", "MES_CAL", "N_HOG", "H_MUD"),
    sdmgf    = c("CD_A", "ENT", "CON", "V_SEL", "TIPO", "MES_CAL", "N_HOG", "H_MUD", "N_REN")
  )
  
  # Paso 1: unir hogar con vivienda
  vh <- dplyr::left_join(hogar, vivienda, by = claves$vivienda, suffix = c("", "_viv"))
  
  # Paso 2: unir sdmgf con vh
  vhs <- dplyr::left_join(sdmgf, vh, by = claves$hogar, suffix = c("", "_hog"))
  
  # Paso 3: unir coe1 con vhs
  vhsc <- dplyr::left_join(coe1, vhs, by = claves$sdmgf, suffix = c("", "_coe1"))
  
  # Paso 4: unir coe2 con vhsc
  df <- dplyr::left_join(coe2, vhsc, by = claves$sdmgf, suffix = c("", "_coe2"))
  
  return(df)
}


