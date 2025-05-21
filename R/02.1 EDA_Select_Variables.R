# ===================================================
#       I. PREPARACIÓN Y LIMPIEZA DE DATOS
# ===================================================

#---------------------
#Preselección de variables (28)
variables_preseleccionadas <- c("eda5c", "sex", "e_con", "clase1", "clase2", "rama_est1", "rama_est2", "pre_asa", 
                                "ing7c", "dur_est", "seg_soc", "ambito1", "ambito2", "emp_ppal", "tip_con", "sub_o", 
                                "busqueda", "pos_ocu", "t_loc_tri", "ent", "cd_a", 
                                "tipo", "mes_cal", "n_hog", "h_mud", "n_ren")

# No aplican porque son vairables numericas:          r_def, c_res, per, fac_tri, eda, ingocup, hrsocup, v_sel
# No aplica porque es una variable ordinal (Orden):   niv_ins

# --------------------------------------------------------------------------
# 1. Clonar el dataframe a uno nuevo 'df_poc', con el filtro de 'p15ym.pea' (filtro nivel row)
# 2. Filtrar el dataframe con las variables preseleccionadas y extras
# 3. Mapear los valores correctos (catalogos y diccionarios) para las variables preseleccionadas
# --------------------------------------------------------------------------
df_poc <- apply_indicator(df, "p15ym.pea.oc", 323)
df_poc <- df_poc %>%
  select(all_of(variables_preseleccionadas), "fac_tri", "eda", "ingocup", "hrsocup", "v_sel", "niv_ins", 
         "r_def", "c_res", "per", "salario", "anios_esc")
df_poc <- Mapping_Rows(df_poc,"sdmgf", variables_preseleccionadas)
