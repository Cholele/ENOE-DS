# ====================================================
# Función: query_builder
# Descripción: Función para realizar consultas dinamicamente con el uso de indicadores
# ====================================================
source(here::here("R/functions", "load_packages.R"))
cargar_librerias('query_builder')

#Mapear la '$expr' de cada indicador
get_expr <- function(path) {
  path_parts <- strsplit(path, "\\.")[[1]]
  node <- indicators
  for (part in path_parts) {
    if (!is.null(node[[part]])) {
      node <- node[[part]]
    } else {
      stop(paste("Ruta no válida:", path))
    }
  }
  if (!is.null(node$expr)) {
    return(node$expr)
  } else {
    stop(paste("No se encontró 'expr' en la ruta:", path))
  }
}
apply_indicator <- function(df, path = NULL, trimestre = NULL, filtros_extra = NULL) {
  
  # Filtro base obligatorio
  if (path == "pt") {
    df_filtrado <- df  # sin filtro base, se define como todo el df
  } else {
    df_filtrado <- df %>%
      filter(r_def == 0, c_res %in% c(1, 3), eda >= 15, eda <= 98)
  }

  # Filtro por trimestre
  if (!is.null(trimestre)) {
    df_filtrado <- df_filtrado %>% filter(per == trimestre)
  }
  
  # Filtro por indicador (desde JSON)
  if (!is.null(path)) {
    expr_text <- get_expr(path)
    df_filtrado <- df_filtrado %>% filter(!!parse_expr(expr_text))
  }
  
  # Filtros extra como strings
  if (!is.null(filtros_extra) && length(filtros_extra) > 0) {
    exprs <- lapply(filtros_extra, parse_expr)
    df_filtrado <- df_filtrado %>% filter(!!!exprs)
  }
  
  return(df_filtrado)
}
count_ponderado <- function(df, path, trimestre = NULL, peso = "fac_tri", filtros_extra = NULL) {
  df_filtrado <- apply_indicator(df, path = path, trimestre = trimestre, filtros_extra = filtros_extra)
  
  if (!peso %in% names(df_filtrado)) {
    stop(paste("La columna de ponderador", peso, "no existe en el dataframe."))
  }
  
  sum(df_filtrado[[peso]], na.rm = TRUE)
}
count_ponderado_grouped <- function(df, path, group_by, trimestre = NULL, peso = "fac_tri", filtros_extra = NULL) {
  # Aplicar filtros con función centralizada
  df_filtrado <- apply_indicator(
    df,
    path = path,
    trimestre = trimestre,
    filtros_extra = filtros_extra  # aquí van como strings
  )
  
  # Validar columna de ponderador
  if (!peso %in% names(df_filtrado)) {
    stop(paste("La columna de ponderador", peso, "no existe en el dataframe."))
  }
  
  # Validar y convertir `group_by` a símbolos
  if (is.character(group_by)) {
    group_syms <- rlang::syms(group_by)
  } else {
    stop("El argumento 'group_by' debe ser una cadena o vector de nombres de columnas.")
  }
  
  # Agrupar y sumar ponderador
  df_resultado <- df_filtrado %>%
    dplyr::group_by(!!!group_syms) %>%
    dplyr::summarise(total_ponderado = sum(.data[[peso]], na.rm = TRUE), .groups = "drop")
  
  return(df_resultado)
}

get_all_indicator_paths(indicators)
# Get counts of all the indicators
get_all_indicator_paths <- function(indicators, current_path = "") {
  paths <- list()
  
  for (name in names(indicators)) {
    node <- indicators[[name]]
    new_path <- if (current_path == "") name else paste(current_path, name, sep = ".")
    
    if (!is.null(node$expr)) {
      paths[[length(paths) + 1]] <- list(path = new_path, description = node$description %||% NA)
    }
    
    # Si el nodo tiene más subnodos, seguir recorriendo
    subnodes <- node[setdiff(names(node), c("expr", "description"))]
    if (length(subnodes) > 0) {
      sub_paths <- get_all_indicator_paths(subnodes, new_path)
      paths <- c(paths, sub_paths)
    }
  }
  
  return(paths)
}
generate_counts_table <- function(df, indicators, trimestre = NULL, peso = "fac_tri", filtros_extra = NULL) {
  paths_info <- get_all_indicator_paths(indicators)
  
  results <- purrr::map_dfr(paths_info, function(info) {
    count <- tryCatch({
      count_ponderado(df, path = info$path, trimestre = trimestre, peso = peso, filtros_extra = filtros_extra)
    }, error = function(e) NA_real_)
    
    tibble::tibble(
      #path = info$path,
      description = info$description,
      total_ponderado = count
    )
  })
  
  return(results)
}

# Print table as INEGI tabulations
get_inegi_table <- function() {
  
  if (!exists("tbl_indicators_counts")) {
    stop("No se encuentra el dataframe tbl_indicators_counts en el ambiente global")
  }
  
  tabla_procesada <- tbl_indicators_counts %>%
    mutate(
      nivel = case_when(
        # Detectar cualquier nivel numérico (ej: 1., 2.1., 3.1.1., etc.)
        stringr::str_detect(description, "^\\d+(\\.\\d+)*\\.\\s") ~ {
          numbering_part <- stringr::str_extract(description, "^\\d+(\\.\\d+)*")
          stringr::str_count(numbering_part, "\\.")  # Nivel = número de puntos
        },
        TRUE ~ NA_integer_
      ),
      # Agrupar por el primer nivel (ej: 1., 2., etc.)
      grupo = cumsum(!is.na(nivel) & nivel == 0)
    ) %>%
    group_by(grupo) %>%
    mutate(
      # Asignar niveles a filas sin numeración: nivel anterior + 1
      nivel = ifelse(is.na(nivel), max(nivel, na.rm = TRUE) + 1L, nivel),
      sangria = nivel * 25  # 25px por nivel para mejor escalado
    ) %>%
    ungroup() %>%
    select(-nivel, -grupo)
  
  aplicar_sangria <- function(texto, sangria) {
    sprintf("<div style='padding-left:%spx'>%s</div>", sangria, texto)
  }
  
  tabla_procesada %>%
    gt() %>%
    cols_hide(sangria) %>%
    text_transform(
      locations = cells_body(columns = description),
      fn = function(x) {
        purrr::map2_chr(
          x, 
          tabla_procesada$sangria,
          ~ aplicar_sangria(
            stringr::str_remove(.x, "^\\s*"),  # Limpiar espacios iniciales
            .y
          )
        )
      }
    ) %>%
    # Resto de formateo (igual que antes)
    tab_header(
      title = "Indicadores estratégicos del mercado laboral mexciano (3° Trimestre 2023)",
      subtitle = "Organizados jerárquicamente según la estructura del INEGI"
    ) %>%
    fmt_number(columns = total_ponderado, decimals = 0, sep_mark = ",") %>%
    cols_label(
      description = "Indicador",
      total_ponderado = "Total"
    ) %>%
    tab_options(
      table.font.names = "Arial",
      column_labels.font.weight = "bold",
      table_body.hlines.color = "transparent"
    ) %>%
    tab_style(
      style = cell_text(weight = "bold"),
      locations = cells_body(
        columns = description,
        rows = stringr::str_detect(description, "^\\d+\\.\\s")
      )
    )
}







