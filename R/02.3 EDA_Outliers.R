# === Cargar paquetes necesarios ===
source(here::here("R/functions", "load_packages.R"))
cargar_librerias("EDA")

# Establecer un tema gráfico global para ggplot2 (para visualizaciones atractivas)
theme_set(theme_minimal())

# ===========================================================================
#       III. DETECCIÓN Y TRATAMIENTO DE OUTLIERS EN VARIABLES NUMERICAS
# ===========================================================================

# Identificar las variables numéricas a evaluar outliers (variables continuas relevantes para análisis)
numeric_vars <- c("eda_w", "ingocup_w")

# Nota: 
# - "eda" (edad) es discreta pero la consideramos continua para detectar edades atípicas.
# - "ingocup" (ingreso mensual) suele estar sesgada a la derecha con posibles valores extremos (ej. ingresos muy altos).
# - "hrsocup" (horas trabajadas) puede tener outliers si se reportan horas extraordinarias inusualmente altas.


# =================================================================
# 1. Visualización inicial univariada para cada variable numérica
# =================================================================
# ---- 1.1 Histogramas ----
for (var in numeric_vars) {
  p <- ggplot(df_poc, aes(x = .data[[var]])) +
    geom_histogram(bins = 30, fill = "steelblue", color = "white") +
    labs(title = paste("Histograma de", var),
         x = var, y = "Frecuencia") +
    theme_minimal()
  
  print(p)  # Mostrar en RStudio
  ggsave(
    filename = here::here("outputs", "plots", paste0("hist_", var, ".png")),
    plot = p,
    width = 6, height = 4
  )
}

# ---- 1.2 Boxplots (gráfico de bigotes) ----
for (var in numeric_vars) {
  p <- ggplot(df_poc, aes(y = .data[[var]])) +
    geom_boxplot(outlier.color = "red", fill = "lightblue") +
    labs(title = paste("Boxplot de", var),
         y = var) +
    theme_minimal()
  
  print(p)  # Mostrar en RStudio
  ggsave(
    filename = here::here("outputs", "plots", paste0("boxplot_", var, ".png")),
    plot = p,
    width = 4, height = 6
  )
}



# ==================================================
# 2. Detección de outliers usando el método IQR
# ==================================================
outlier_summary <- data.frame(
  Variable      = character(),
  Q1            = numeric(),
  Q3            = numeric(),
  IQR           = numeric(),
  Limite_inferior = numeric(),
  Limite_superior = numeric(),
  Num_outliers  = integer(),
  stringsAsFactors = FALSE
)

# Calcular estadísticos y outliers por variable
for (var in numeric_vars) {
  values <- df_poc[[var]]
  
  # Calcular Q1, Q3 y IQR
  Q1_val <- quantile(values, 0.25, na.rm = TRUE)
  Q3_val <- quantile(values, 0.75, na.rm = TRUE)
  IQR_val <- Q3_val - Q1_val
  
  # Calcular límites inferior y superior para outliers
  lim_inf <- Q1_val - 1.5 * IQR_val
  lim_sup <- Q3_val + 1.5 * IQR_val
  
  # Contar valores atípicos (menores que lim_inf o mayores que lim_sup)
  num_outliers <- sum(values < lim_inf | values > lim_sup, na.rm = TRUE)
  
  # Agregar fila a la tabla resumen
  outlier_summary <- rbind(outlier_summary, data.frame(
    Variable        = var,
    Q1              = as.numeric(Q1_val),
    Q3              = as.numeric(Q3_val),
    IQR             = as.numeric(IQR_val),
    Limite_inferior = as.numeric(lim_inf),
    Limite_superior = as.numeric(lim_sup),
    Num_outliers    = num_outliers,
    stringsAsFactors = FALSE
  ))
}

# Mostrar tabla resumen en consola
print(outlier_summary)



# ==================================================
#      EXTRA: Calcular precariedad
# ==================================================
# Es una bandera lógica que determina explotación laboral, en base a si una persona:
# Trabaja más de 48 horas a la semana (hrsocup > 48)
# Gana menos de un salario mínimo mensual (con base en su ingreso y la zona salarial)
df_poc$ma48me1sm <- ifelse(
  df_poc$hrsocup > 48 & df_poc$ingocup < df_poc$salario,
  "Si",
  "No"
)

df_poc$indice_precariedad <- rowSums(data.frame(
  exceso_jornada = df_poc$hrsocup > 48,                                        #Estándar internacional según la OIT
  informalidad   = df_poc$emp_ppal == "Empleo informal",
  sin_prestaciones = df_poc$pre_asa == "Sin prestaciones",
  sin_seguridad_social = df_poc$seg_soc == "Sin acceso",
  contrato_inseguro = df_poc$tip_con %in% c(
    "Temporal", "Contrato de tipo no especificado", "Sin contrato escrito"
  ),
  subocupado    = df_poc$sub_o == "Si es subocupado",
  busca_adicional = df_poc$busqueda == "Con condición de búsqueda de un trabajo adicional para tener dos empleos",
  sobrexplotado = df_poc$ma48me1sm == "Si"
), na.rm = TRUE)

df_precariedad_freq <- as.data.frame(table(df_poc$indice_precariedad))
colnames(df_precariedad_freq) <- c("indice_precariedad", "n")

#Histograma del indice de precaridad
ggplot(df_precariedad_freq, aes(x = indice_precariedad, y = n)) +
  geom_bar(stat = "identity", fill = "darkred") +
  geom_text(aes(label = n), vjust = -0.3, color = "black", size = 3.5) +
  labs(title = "Distribución del índice de precariedad laboral",
       x = "Índice de precariedad (0–8)",
       y = "Número de personas") +
  theme_minimal()

# Interrogante ¿cuántas de esas personas tienen precariedad alta (índice ≥ 4)?
#Confirmación extra (tabla cruzada)
df_poc %>%
  filter(hrsocup > 78.5) %>%
  group_by(indice_precariedad) %>%
  summarise(n = n()) %>%
  mutate(pct = round(n / sum(n) * 100, 1))

# Crear tabla formateada
tabla_outliers_precariedad <- df_poc %>%
  filter(hrsocup > 78.5) %>%
  count(indice_precariedad) %>%
  mutate(pct = round(100 * n / sum(n), 1)) %>%
  rename(
    `Índice de precariedad` = indice_precariedad,
    `Número de personas` = n,
    `Porcentaje (%)` = pct
  )


#------ Variable edad
# Winsorizar edad superior a 84 (como límite superior IQR))
#Reemplaza todo valor menor a 15 por 15
#Reemplaza todo valor mayor a 84 por 84
#Deja los demás valores igual
df_poc$eda_w <- pmin(pmax(df_poc$eda, 15), 84)

#------ Variable Ingresos
# Winsorizar (hasta 22,500 como límite superior IQR)
df_poc$ingocup_w <- pmin(df_poc$ingocup, 22500)


rm(list = setdiff(ls(), c("df", "df_poc","indicators")))

# Guardar tabla resumen de outliers a CSV
write.csv(outlier_summary, file = file.path(tables_dir, "outlier_summary.csv"), row.names = FALSE)
