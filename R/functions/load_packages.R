# IMPORTANTE: La instalación de paquetes solo debe realizarse una vez.
# Sin embargo, la carga (activación) de los paquetes debe hacerse 
# siempre al inicio del script donde se vayan a utilizar.

# =======================================================
#  Función para instalar y cargar paquetes dinamicamente
# ========================================================

cargar_librerias <- function(step = NULL) {
  
  cargar_paquetes <- function(paquetes) {
    invisible(lapply(paquetes, function(pkg) {
      if (!requireNamespace(pkg, quietly = TRUE)) {
        install.packages(pkg, dependencies = TRUE)
      }
      library(pkg, character.only = TRUE)
    }))
  }
  
  # Paquetes comunes
  cargar_paquetes(c("here"))
  
  # Switch para los pasos específicos
  switch(as.character(step),
         # Paquetes para conexión a BD (Script 1)
         "1" = cargar_paquetes(c("odbc", "DBI", "readr")),
         
         # Paquetes para la limpieza de datos (Script 2)
         "2" = cargar_paquetes(c("dplyr", "readr")),
         
         "relations" = cargar_paquetes(c("dplyr")),
         
         "main" = cargar_paquetes(c("odbc", "DBI", "dplyr", "readr", "ggplot2")),
         # Si el parametro es desconocido
         { if (!is.null(step)) message("Paso no reconocido. Solo se cargaron paquetes comunes.") }
  )
}



