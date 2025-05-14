#Buscar columnas dentro de un dataframa
names(df_test)[grepl("EDA", names(df_test))]

#Exportar dataframe --> .csv
write.csv(df_test, here::here("outputs", "df_test2.csv"), row.names = FALSE, fileEncoding = "UTF-8")

