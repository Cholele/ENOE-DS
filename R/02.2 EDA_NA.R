# === Cargar paquetes necesarios ===
source(here::here("R/functions", "load_packages.R"))
cargar_librerias("EDA")

# Establecer un tema gráfico global para ggplot2 (para visualizaciones atractivas)
theme_set(theme_minimal())

# =================================================================
#       II. ANÁLISIS Y TRATAMIENTO DE VALORES FALTANTES (NA)
# =================================================================

# Resumen de valores faltantes por variable (conteo y porcentaje)
na_counts <- colSums(is.na(df_pea))
na_percent <- round(100 * na_counts / nrow(df_pea), 2)
missing_summary <- data.frame(Variable = names(na_counts), NAs = na_counts, Perc_NA = na_percent)
missing_summary <- missing_summary %>% arrange(desc(Perc_NA))
print(missing_summary)  # Imprimir resumen de NAs por variable

# Graficar NAs por variable
p <- ggplot(missing_summary, aes(x = Perc_NA, y = reorder(Variable, Perc_NA))) +
  geom_point(color = "steelblue", size = 3) +
  labs(title = "%N/A por variable",
       x = "% de valores faltantes",
       y = "Variables") +
  scale_x_continuous(labels = scales::percent_format(accuracy = 1), limits = c(0, NA)) +
  theme_minimal() 
ggsave(filename = paste0("outputs/plots/boxplot_", var, ".png"), plot = p, width = 4, height = 6)

