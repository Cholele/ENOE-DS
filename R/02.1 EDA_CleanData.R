# === Cargar paquetes necesarios ===
source(here::here("R/functions", "load_packages.R"))
cargar_librerias("EDA")

# ===================================================
#       I. PREPARACIÓN Y LIMPIEZA DE DATOS
# ===================================================

#---------------------
#Preselección de variables (28)
variables_preseleccionadas <- c("eda5c", "sex", "e_con", "clase1", "clase2", "rama_est1", "rama_est2", "pre_asa", 
                                "ing7c", "dur_est", "seg_soc", "ambito1", "ambito2", "emp_ppal", "tip_con", "sub_o", 
                                "busqueda", "pos_ocu", "d_ant_lab", "d_cexp_est", "t_loc_tri", "ent", "cd_a", 
                                "tipo", "mes_cal", "n_hog", "h_mud", "n_ren")

# No aplican porque son vairables numericas:          r_def, c_res, per, fac_tri, eda, ingocup, hrsocup, v_sel
# No aplica porque es una variable ordinal (Orden):   niv_ins

# --------------------------------------------------------------------------
# 1. Clonar el dataframe a uno nuevo 'df_pea', con el filtro de 'p15ym.pea' (filtro nivel row)
# 2. Filtrar el dataframe con las variables preseleccionadas y extras
# 3. Mapear los valores correctos (catalogos y diccionarios) para las variables preseleccionadas
# --------------------------------------------------------------------------
df_pea <- apply_indicator(df, "p15ym.pea", 323)
df_pea <- df_pea %>%
  select(all_of(variables_preseleccionadas), "fac_tri", "eda", "ingocup", "hrsocup", "v_sel", "niv_ins", "r_def", "c_res", "per")
df_pea <- Mapping_Rows(df_pea,"sdmgf", variables_preseleccionadas)

# Identificar el número de variables por tipo 
table(sapply(df_pea, class))

#Exploración del conjunto de datos:
glimpse(df_pea)

# Resumen estadístico de variables numéricas relevantes (media, mediana, etc.) OJOOOOOOOOOOOO
summary(df_pea)


# IMPORTANTE!!!!!!
# Convertir columnas de caracteres a factor (si quedaron como character) para variables categóricas
# Es importante aclarar que NO se esta regresando a valores de tipo integer, por ejemplo, la variable 'sex' se 
# esta pasando de:"Hombre" (texto plano, tipo character) a "Hombre" como un nivel de un factor 
# con niveles "Hombre" y "Mujer". No cambia el contenido visible de los datos, pero sí su tipo.
# lo cual mejora mucho cómo R trata esas columnas en gráficos y modelos.
df_pea <- df_pea %>%
  mutate(across(where(is.character), as.factor))

# Reviamos y confirmamos el cambio de tipo de variable
table(sapply(df_pea, class))




rm(list = setdiff(ls(), c("df", "df_pea","indicators")))


