# ====================================================
# Función: load_packages
# Descripción: Función para instalar y cargar paquetes dinamicamente
# ====================================================


# ============ 📌 NOTAS ============
# La instalación de paquetes solo debe realizarse una vez.
# Sin embargo, la carga siempre se debera hacer al inicio del script donde se vayan a utilizar.
# ==================================
plots_dir  <- here("outputs", "test")
tables_dir  <- here("outputs", "tables")

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
         
         # -------- Para el proceso ----------
         "1" = cargar_paquetes(c("odbc", "DBI", "readr")),
         "2" = cargar_paquetes(c("dplyr", "readr")),
         
         
         # -------- Para functions ----------
         
         "relations" = cargar_paquetes(c("dplyr")),
         'map' = cargar_paquetes(c("dplyr")),
         "main" = cargar_paquetes(c("odbc", "DBI", "dplyr", "readr", "ggplot2")),
         "indicators" = cargar_paquetes(c("rlang")),
         "query_builder" = cargar_paquetes(c("rlang", "dplyr", "purrr", "jsonlite", "gt", "stringr", "dplyr", "tidyr")),
         "EDA" = cargar_paquetes(c("skimr", "dplyr", "survey", "knitr", "tidyverse", "naniar", "patchwork", 
                                   "ggplot2", "DescTools", "clustMixType", "forcats", "scales")),
         "Clustering" = cargar_paquetes(c("dplyr", "ggplot2", "factoextra","sf")),
         
         # Si el parametro es desconocido
         { if (!is.null(step)) message("Paso no reconocido. Solo se cargaron paquetes comunes.") }
  )
}



