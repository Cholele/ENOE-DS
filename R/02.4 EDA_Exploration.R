# === Cargar paquetes necesarios ===
source(here::here("R/functions", "load_packages.R"))
cargar_librerias("EDA")

rm(list = setdiff(ls(), c("df", "df_poc")))

# ===================================================
#       EXPLORACIÓN DEL CONJUNTO DE DATOS
# ===================================================

# Identificar el número de variables por tipo 
table(sapply(df_poc, class))

#Exploración del conjunto de datos:
glimpse(df_poc)

# Resumen estadístico de variables numéricas relevantes (media, mediana, etc.) 
summary(df_poc)

# Función para graficar y guardar
graficar_categoricas <- function(df, columnas, output_dir = plots_dir) {
  for (col in columnas) {
    
    # Frecuencias
    data <- df %>%
      filter(!is.na(.data[[col]])) %>%
      count(!!sym(col)) %>%
      arrange(desc(n)) %>%
      mutate(
        prop = n / sum(n),
        label = paste0(round(prop * 100, 1), "%"),
        cat = fct_infreq(as.factor(!!sym(col)))
      )
    
    # Gráfico de barras horizontal
    bar_plot <- ggplot(data, aes(x = cat, y = n)) +
      geom_bar(stat = "identity", fill = "#0073C2FF") +
      coord_flip() +
      geom_text(aes(label = n), hjust = -0.1, size = 3.5) +
      theme_minimal() +
      labs(
        title = paste("Distribución de:", col),
        x = NULL, y = "Frecuencia"
      ) +
      theme(
        plot.title = element_text(face = "bold", size = 14),
        axis.text = element_text(size = 10)
      )
    
    # Gráfico de pastel (si aplica)
    if (nrow(data) <= 10) {
      pie_plot <- ggplot(data, aes(x = "", y = prop, fill = cat)) +
        geom_bar(stat = "identity", width = 1) +
        coord_polar("y") +
        theme_void() +
        labs(
          title = paste("Proporción de:", col),
          fill = NULL
        ) +
        geom_text(aes(label = label), position = position_stack(vjust = 0.5)) +
        theme(plot.title = element_text(face = "bold", size = 14))
    } else {
      pie_plot <- NULL
    }
    
    # Guardar gráficos
    ggsave(filename = file.path(output_dir, paste0(col, "_barplot.png")), plot = bar_plot, width = 8, height = 5)
    if (!is.null(pie_plot)) {
      ggsave(filename = file.path(output_dir, paste0(col, "_piechart.png")), plot = pie_plot, width = 6, height = 6)
    }
    
    # Mostrar en consola
    print(bar_plot)
    if (!is.null(pie_plot)) print(pie_plot)
  }
}

# Variables categóricas que se desean graficas
cat_vars <- c("sex", "eda", "eda5c" ,"e_con", "pre_asa", 
              "ing7c", "dur_est", "seg_soc", "emp_ppal", "tip_con",
              "busqueda", "pos_ocu", "ent", "cd_a")

# Ejecutar función
graficar_categoricas(df_poc, columnas = cat_vars)



