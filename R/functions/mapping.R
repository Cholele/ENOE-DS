# ====================================================
# Función: mapping
# Descripción: Función para instalar y cargar paquetes dinamicamente
# ====================================================

source(here::here("R/functions", "load_packages.R"))
cargar_librerias('map')

# ---------------------------
# Función para mapear valores de claves en columnas con dictionaries
# ---------------------------
Mapping_Columns <- function(tbl_name, cols) {
  tbl <- tbls[[tbl_name]]
  dict <- dictionaries[[tbl_name]]
  
  # Crear vector nombrado con el mapeo clave-valor
  mapping <- setNames(dict$NOMBRE_CAMPO, dict$NEMÓNICO)
  
  # Obtener nombres actuales de columnas
  current_cols <- colnames(tbl)
  
  # Identificar columnas válidas para mapear
  valid_cols <- intersect(cols, current_cols)
  
  # Aplicar mapeo solo a columnas seleccionadas
  new_cols <- ifelse(current_cols %in% valid_cols,
                     coalesce(mapping[current_cols], current_cols),
                     current_cols)
  
  # Asignar nuevos nombres
  colnames(tbl) <- new_cols
  
  return(tbl)
}

# ---------------------------
# Función para mapear valores de claves en filas (una columna) con catalogs
# ---------------------------
Mapping_Rows <- function(tbl_name, cols) {
  tbl <- tbls[[tbl_name]]
  table_catalog <- catalogs[[tbl_name]]
  
  # Verificar que el catálogo existe
  if (is.null(table_catalog)) {
    stop(paste("No existe catálogo para la tabla", tbl_name))
  }
  
  # Iterar sobre las columnas especificadas
  for (col in cols) {
    # Obtener el catálogo específico para esta columna
    col_catalog <- table_catalog[[col]]
    
    # Verificar si existe el catálogo para la columna
    if (!is.null(col_catalog)) {
      # Crear vector nombrado para el mapeo
      mapping <- setNames(col_catalog$DESCRIP, col_catalog$CVE)
      
      # Aplicar el mapeo usando recode de dplyr
      tbl[[col]] <- dplyr::recode(tbl[[col]], !!!mapping)
    } else {
      warning(paste("No se encontró catálogo para la columna", col, "en", tabl_name))
    }
  }
  
  return(tbl)
}


# ---------------------------
#           EJEMPLOS
# ---------------------------

# --------- Columnas --------
# Renombrar solo columnas específicas
# tblSdmgf_col_clase2_rename <- Mapping_Columns("sdmgf", c("clase1", "clase2"))

# Renombrar todas las columnas de una tabla
# tblSdmgf_columns_rename <- Mapping_Columns("sdmgf",cols = colnames(tbls$sdmgf))


# --------- Columnas --------
# Renombrar todas las filas de una columna de una tabla
# tblVivienda_rows_ciudad_rename <- Mapping_Rows("vivienda", c("cd_a"))

# Renombrar todas las filas de la todas las columnas de una tabla
# tblVivienda_rows_rename <- Mapping_Rows("vivienda", colnames(tbls$vivienda))
