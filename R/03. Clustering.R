# =========================================
# K-MEANS PARA POBLACIÓN OCUPADA (df_poc)
# =========================================
rm(list = setdiff(ls(), c("df", "df_poc")))
source(here::here("R/functions", "load_packages.R"))
cargar_librerias("Clustering")


# ----------------------------------------
# 1. LIMPIEZA DE DATOS
# ----------------------------------------

#  Paso 1: Revisión de años de escolaridad
# - '99' significa "no especificado" y debe eliminarse
# - '0' es válido: representa "sin escolaridad"

df_poc <- df_poc %>%
  mutate(anios_esc = na_if(anios_esc, 99)) %>%  # convierte 99 en NA
  filter(!is.na(anios_esc))                     # elimina esos casos

# ----------------------------------------
# 2. SELECCIÓN Y ESCALADO DE VARIABLES
# ----------------------------------------
# Variables seleccionadas
# NOTA: No se escalan ni `indice_precariedad` ni variables categóricas

vars_kmeans <- c("eda_w", "ingocup_w", "hrsocup", "anios_esc", "indice_precariedad")

# Escalando solo las variables numéricas continuas
df_kmeans <- df_poc %>%
  select(all_of(vars_kmeans)) %>%
  mutate(across(c(eda_w, ingocup_w, hrsocup, anios_esc), scale))

# ----------------------------------------
# 3. SELECCIÓN DE NÚMERO DE CLÚSTERS
# ----------------------------------------
set.seed(123)
sample_df <- df_kmeans %>% sample_n(5000)  

# Metodo del Codo (WSS)
fviz_nbclust(sample_df, kmeans, method = "wss") +
  ggtitle("Método del Codo (muestra)")

# ----------------------------------------
# 4. APLICACIÓN DE K-MEANS (NIVEL 1)
# ----------------------------------------

set.seed(123)  # para reproducibilidad
k <- 4          # De acuerdo al resultado de la grafica (4 fue lo que nos mostro la grafica)

km_result <- kmeans(df_kmeans, centers = k, nstart = 25)

# Agregar clúster al df original
df_poc$cluster_k1 <- factor(km_result$cluster)

# ----------------------------------------
# 5. ANÁLISIS DESCRIPTIVO DE CLÚSTERS
# ----------------------------------------

df_poc %>%
  group_by(cluster_k1) %>%
  summarise(
    n = n(),
    edad_prom = mean(eda_w),
    ingreso_prom = mean(ingocup_w),
    hrs_prom = mean(hrsocup),
    esc_prom = mean(anios_esc),
    precariedad_prom = mean(indice_precariedad)
  ) %>%
  print()

# ----------------------------------------
# 6. VISUALIZACIÓN DE CLÚSTERS
# ----------------------------------------

fviz_cluster(km_result, data = df_kmeans,
             geom = "point", ellipse.type = "norm",
             palette = "jco", ggtheme = theme_minimal(),
             main = "Visualización de Clústers - Nivel 1")

# ----------------------------------------
# 7. SUBCLUSTER (NIVEL 2) DENTRO DE UN GRUPO ESPECÍFICO
# ----------------------------------------

# 🎯 Ejemplo: analizar solo el clúster más precarizado (supongamos cluster_k1 == 3)

grupo_precario <- df_poc %>% filter(cluster_k1 == 3)

df_kmeans_sub <- grupo_precario %>%
  select(all_of(vars_kmeans)) %>%
  mutate(across(c(eda_w, ingocup_w, hrsocup, anios_esc), scale))

# 📊 Determinar nuevo K para subgrupo
fviz_nbclust(df_kmeans_sub, kmeans, method = "wss") +
  ggtitle("Método del Codo para Subgrupo Precario")

# ❗ Supón que decides usar K = 2 para subgrupos
km_sub <- kmeans(df_kmeans_sub, centers = 2, nstart = 25)

# Agregar subcluster al dataframe original
grupo_precario$subcluster <- factor(km_sub$cluster)

# ----------------------------------------
# 8. ANÁLISIS DE SUBCLUSTERS
# ----------------------------------------

grupo_precario %>%
  group_by(subcluster) %>%
  summarise(
    n = n(),
    edad_prom = mean(eda_w),
    ingreso_prom = mean(ingocup_w),
    hrs_prom = mean(hrsocup),
    esc_prom = mean(anios_esc),
    precariedad_prom = mean(indice_precariedad)
  ) %>%
  print()

# ----------------------------------------
# FIN DEL SCRIPT
# ----------------------------------------

# Puedes ahora exportar `df_poc` y `grupo_precario` con los clusters
# para análisis posteriores, visualizaciones o informes dinámicos.
