library(dplyr)

# Función genérica para verificar unicidad de una combinación de claves
verificar_clave_unica <- function(df, claves, nombre_tabla) {
  mensaje <- paste("🧪 Verificando unicidad de la clave en tabla:", nombre_tabla)
  cat(mensaje, "\n")
  
  df %>%
    count(across(all_of(claves))) %>%
    filter(n > 1) %>%
    { 
      if (nrow(.) == 0) {
        cat("✅ Clave única confirmada en", nombre_tabla, "\n\n")
      } else {
        cat("❌ Duplicados encontrados en", nombre_tabla, "- Total duplicados:", nrow(.), "\n")
        print(head(.))
        cat("\n")
      }
    }
}

# Llaves oficiales por tabla
clave_vivienda <- c("CD_A", "ENT", "CON", "V_SEL", "TIPO", "MES_CAL")
clave_hogar    <- c("CD_A", "ENT", "CON", "V_SEL", "N_HOG", "H_MUD", "TIPO", "MES_CAL")
clave_sdmgf    <- c("CD_A", "ENT", "CON", "V_SEL", "N_HOG", "H_MUD", "N_REN", "TIPO", "MES_CAL")
clave_coe      <- c("CD_A", "ENT", "CON", "V_SEL", "N_HOG", "H_MUD", "N_REN", "TIPO", "MES_CAL")

# Verificaciones
verificar_clave_unica(vivienda, clave_vivienda, "vivienda")
verificar_clave_unica(hogar, clave_hogar, "hogar")
verificar_clave_unica(sdmgf, clave_sdmgf, "sdmgf")
verificar_clave_unica(coe1, clave_coe, "coe1")
verificar_clave_unica(coe2, clave_coe, "coe2")
