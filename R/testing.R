summary(df_pea$eda)    # Estadísticos básicos de la edad (mínimo, mediana, media, máximo)
hist(df_pea$eda, breaks = 30, col = "skyblue", xlab = "Edad", main = "Histograma de la Edad") 


# --------------------------------------------------------
# Tabulados cruzados entre variables categóricas (ejemplo: sexo vs condición de ocupación)
table(df_pea$sex, df_pea$clase2)

# También cálculo de proporciones por fila/columna para entender relaciones
prop.table(table(df_pea$sex, df_pea$clase2), margin = 1)  # distribución de clase2 dentro de cada sexo

# Gráfico de barras apiladas para visualizar la relación sexo ~ condición de ocupación (ocupado/desocupado)
df_pea %>%
  mutate(sex = factor(sex, labels = c("Hombre", "Mujer")), 
         clase2 = factor(clase2, labels = c("Ocupado", "Desocupado"))) %>%
  ggplot(aes(x = sex, fill = clase2)) + 
  geom_bar(position = "fill") + 
  scale_y_continuous(labels = scales::percent) +
  labs(title = "Proporción de Ocupados/Desocupados por Sexo", x = "Sexo", y = "Proporción dentro del sexo", fill = "Condición")
ggsave(filename = here("R/outputs", "stackedbar_sexo_clase2.png"))


# Correlaciones entre variables numéricas (matriz de correlación y mapa de calor)
numeric_vars <- df_pea %>% select_if(is.numeric) %>% select(-upm, -con)  # selecciona variables numéricas relevantes (excluyendo identificadores)
cor_matrix <- cor(numeric_vars, use = "pairwise.complete.obs")
# Visualización de matriz de correlación como heatmap
corr_df <- as.data.frame(as.table(cor_matrix))
names(corr_df) <- c("Var1", "Var2", "Correlation")
ggplot(corr_df, aes(x = Var1, y = Var2, fill = Correlation)) + 
  geom_tile() + 
  scale_fill_distiller(palette = "RdBu", limits = c(-1, 1)) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Mapa de calor de correlación", x = NULL, y = NULL)
ggsave(filenam
       