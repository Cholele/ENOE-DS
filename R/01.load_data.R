# === Cargar paquetes necesarios ===
source(here::here("R/functions", "load_packages.R"))
cargar_librerias(1)

# === Función que carga y devuelve una lista con las tablas ===
get_enoe_tables <- function() {
  
  # Conexión a la base de datos
  con <- DBI::dbConnect(odbc::odbc(),
                        Driver   = "ODBC Driver 17 for SQL Server",
                        Server   = Sys.getenv("SQL_SERVER"),
                        Database = Sys.getenv("SQL_DATABASE"),
                        UID      = Sys.getenv("SQL_UID"),
                        PWD      = Sys.getenv("SQL_PWD"))
  
  # Cargar tablas de SQL
  tablas <- list(
    vivienda = dbGetQuery(con, "SELECT * FROM vivienda"),
    hogar    = dbGetQuery(con, "SELECT * FROM hogar"),
    sdmgf    = dbGetQuery(con, "SELECT * FROM sdmgf"),
    coe1     = dbGetQuery(con, "SELECT * FROM coe1"),
    coe2     = dbGetQuery(con, "SELECT * FROM coe2")
  )
  
  #Cerrar la conexión a la Base de Datos
  DBI::dbDisconnect(con)
  return(tablas)
}

# === Función que carga y devuelve una lista con los dictionaries ===
get_dictionaries <- function() {
  # Ruta de los diccionarios
  dict_path <- here::here("data", "dictionaries")
  
  # Lista de nombres base (sin extensión)
  tbls_names <- c("vivienda", "hogar", "sdmgf", "coe1", "coe2")
  
  # Función que lee un .CSV y corrige posibles errores de codificación
  leer_catalogo <- function(filepath) {
    
    # 1. Leer como texto plano primero
    lines <- readLines(filepath, encoding = "UTF-8", warn = FALSE)
    
    # 2. Detectar encoding real
    if (any(grepl("Ã", lines))) {
      lines <- iconv(lines, from = "latin1", to = "UTF-8")
    }
    
    # 3. Leer el data frame
    df <- readr::read_csv(I(lines), show_col_types = FALSE)
    
    return(df)
  }
  
  # Crea una lista nombrada 
  diccionarios <- lapply(tbls_names, function(nombre) {
    # Construye la ruta completa al archivo .csv
    archivo <- file.path(dict_path, paste0(nombre, ".csv"))
    
    # Llama a la función para leerlo y devolverlo como data.frame
    leer_catalogo(archivo)
  })
  
  #Asigna nombres a los elementos de la lista 
  names(diccionarios) <- tbls_names
  
  return(diccionarios)
}

# === Función que carga y devuelve una lista con los catalogos ===
get_catalogs <- function() {
  cat_path <- here::here("data", "catalogs")
  
  # 1. Obtener las carpetas dentro de 'catalogs' (una por tabla)
  tablas <- list.dirs(cat_path, full.names = FALSE, recursive = FALSE)
  
  # 2. Leer todos los .csv dentro de cada subcarpeta y armar estructura anidada
  catalogs <- setNames(
    lapply(tablas, function(tabla) {
      folder <- file.path(cat_path, tabla)
      archivos <- list.files(folder, pattern = "\\.csv$", full.names = TRUE)
      
      # Leer cada archivo csv y usar su nombre base como nombre del subelemento
      setNames(
        lapply(archivos, function(file) {
          # Leer texto y corregir codificación si es necesario
          lines <- readLines(file, encoding = "UTF-8", warn = FALSE)
          if (any(grepl("Ã", lines))) {
            lines <- iconv(lines, from = "latin1", to = "UTF-8")
          }
          readr::read_csv(I(lines), show_col_types = FALSE)
        }),
        tools::file_path_sans_ext(basename(archivos))  # nombres sin extensión
      )
    }),
    tablas
  )
  
  return(catalogs)
}


# === Ejemplos de Uso ===

  #tbls <-get_enoe_tables()
  #dictionaries <-get_dictionaries()
  #catalogs <-get_catalogs()
  
  # Ver nombres de los catálogos disponibles para 'sdmgf'
  #names(catalogs$sdmgf)
  
  # Mostrar el catálogo 'niv_ins' de 'sdmgf'
  #head(catalogs$sdmgf$niv_ins)
  
  # Ver estructura del catálogo 'ciud' de 'coe1'
  #str(catalogs$coe1$cd_a)




