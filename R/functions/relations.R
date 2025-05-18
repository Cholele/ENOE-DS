# ====================================================
# Función: relations
# Descripción: Permite crear un dataframe en base al modelo relacional de la ENOE
# ====================================================

# === Cargar paquetes necesarios para relaciones ===
source(here::here("R/functions", "load_packages.R"))
cargar_librerias("relations")

# === Generador completo de df ENOE unificado ===
create_enoe_df <- function(vivienda, hogar, sdmgf, coe1, coe2) {
  
  # === Llaves oficiales según documentación INEGI ===
  claves <- list(
    vivienda = c("cd_a", "ent", "con", "v_sel", "tipo", "mes_cal"),
    hogar    = c("cd_a", "ent", "con", "v_sel", "tipo", "mes_cal", "n_hog", "h_mud"),
    sdmgf    = c("cd_a", "ent", "con", "v_sel", "tipo", "mes_cal", "n_hog", "h_mud", "n_ren")
  )
  
  # Paso 1: unir hogar con vivienda
  vh <- dplyr::left_join(hogar, vivienda, by = claves$vivienda, suffix = c("", "_viv"))
  
  # Paso 2: unir sdmgf con vh
  vhs <- dplyr::left_join(sdmgf, vh, by = claves$hogar, suffix = c("", "_hog"))
  
  # Paso 3: unir coe1 con vhs
  #vhsc <- dplyr::left_join(coe1, vhs, by = claves$sdmgf, suffix = c("", "_coe1"))
  vhsc <- dplyr::left_join(vhs, coe1, by = claves$sdmgf, suffix = c("", "_coe1"))
  
  # Paso 4: unir coe2 con vhsc
  #df <- dplyr::left_join(coe2, vhsc, by = claves$sdmgf, suffix = c("", "_coe2"))
  df <- dplyr::left_join(vhsc, coe2, by = claves$sdmgf, suffix = c("", "_coe2"))
  
  return(df)
}


