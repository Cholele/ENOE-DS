# 📊 ENOE-DS: Análisis del Mercado Laboral Mexicano con Ciencia de Datos
El presente proyecto aplica técnicas de ciencia de datos (EDA, análisis de regresión y clustering) para analizar los datos de la Encuesta Nacional de Ocupación y Empleo (ENOE) del INEGI.

**Autor:** Edder Gerardo Hernández Jiménez  
**Proyecto académico de investigación** ANÁLISIS DEL MERCADO LABORAL EN MEXICO: EXPLORACIÓN DE PATRONES Y SEGMENTOS DE POBLACIÓN MEDIANTE TÉCNICAS DEL DATA SCIENCE.
**Período de análisis:** III y IV trimestre de 2023  
**Datos fuente:** Encuesta Nacional de Ocupación y Empleo (ENOE) - INEGI

---

## 🎯 Objetivo General

Identificar patrones y segmentos de población que enfrentan dificultades en el mercado laboral mexicano mediante técnicas de ciencia de datos aplicadas a los datos de la ENOE.

---

## 📌 Contexto

La ciencia de datos proporciona herramientas fundamentales para el análisis de grandes volúmenes de información pública, como los microdatos de la ENOE. No obstante, su aplicación efectiva en regiones con menor especialización, como Chiapas, continúa siendo limitada. Este proyecto tiene como objetivo aplicar metodologías de ciencia de datos al estudio del mercado laboral mexicano, evidenciar el potencial de este enfoque, contribuir a cerrar la brecha entre la oferta educativa y la demanda laboral en el área, y servir como base para futuras investigaciones aplicadas que utilicen la ENOE como fuente primaria de análisis.

---

## 📚 Metodología

- **Enfoque:** Híbrido (revisión documental + análisis cuantitativo).
- **Técnicas aplicadas en R:**
  - Limpieza y transformación de datos
  - Análisis exploratorio de datos (EDA)
  - Modelos de regresión
  - Segmentación con clustering
- **Infraestructura:**
  - Base de datos normalizada en SQL Server
  - Scripts modulares en R
  - Diccionarios y catálogos precargados

---

## 📁 Estructura del Repositorio 

```text
ENOE-DS/
├── R/                        # Scripts de carga, funciones y análisis
│   ├── 01.load_data.R          # Carga de datos base (tablas, catalogos y diccionarios)
│   └── functions/
│       ├── load_packages.R       # Carga modular de paquetes
│       ├── relations.R           # Define relaciones entre tablas ENOE
├── SQL/                      # Scripts SQL para modelado y consultas
│   ├── ENOE_DB.sql           # Script de creación de DB ENOE y plantilla para carga masiva de registros (.csv)
│   ├── Tablas.xlsx           # Información técnica del DB ENOE: nombres de variables, tipos de datos y longitud
├── data/                     # Datos organizados por etapa
│   ├── raw/                    # Microdatos originales del INEGI
│   ├── processed/              # Datos limpios listos para análisis
│   ├── dictionaries/           # Diccionarios por tabla (e.g., coe1.csv)
│   └── catalogs/               # Catálogos por tabla en subcarpetas (e.g., coe1/*.csv)
├── doc/                      # Documentación técnica y contextual
├── outputs/                  # Visualizaciones, resultados y modelos
├── rmarkdown/                # Reportes dinámicos y reproducibles
├── ENOE.Rproj                # Archivo del proyecto RStudio
├── main.R                    # Script maestro de ejecución del flujo completo
├── .Renviron                 # Variables de entorno (conexión a SQL Server)
└── README.md                 # Descripción y guía del proyecto

```
---
> ### 📌 **Notas Importantes**
>
> Los archivos del directorio `data/raw/` (microdatos originales del INEGI) **no están versionados en GitHub** debido a su tamaño.
> Estos archivos estan comprimidos  en formato **`.rar`**, por lo que deben **descomprimirse localmente** antes de su uso.
>
> Una vez extraídos, pueden ser:
> - 🗃️ **Cargados masivamente a SQL Server**, siguiendo la estructura y las instrucciones especificadas en `SQL/ENOE_DB.sql`.
>   Este script incluye la creación del esquema relacional completo y ejemplos de carga con `BULK INSERT`.
> - 📊 **cargados directamente en R**, desde los archivos `.csv`, según las necesidades del análisis.
>
> ⚠️ Este proyecto trabaja **específicamente con los trimestres III y IV del año 2023**.  
>
> Si deseas replicar el análisis con distintos periodos, deberás obtener los datos desde el siguiente sitio oficial:
> 👉 [Microdatos - ENOE](https://www.inegi.org.mx/programas/enoe/15ymas/#microdatos)
>
> Este repositorio sigue principios de **reproducibilidad** y **buenas prácticas** en el análisis de datos públicos.

---

## ⚙️ Configuración del entorno

Este proyecto utiliza variables de entorno para almacenar credenciales sensibles, necesarias para establecer la conexión con SQL Server.

Para configurarlas:

1. Selecciona el archivo `.Renviron.example` y renómbralo como `.Renviron`.
2. Edita su contenido con tus propias credenciales:

        SQL_SERVER=tu_servidor
        SQL_DATABASE=tu_base_de_datos
        SQL_UID=tu_usuario
        SQL_PWD=tu_contraseña
💡 **Importante:**  
Si editas el archivo `.Renviron` desde RStudio, los cambios **no se aplicarán de inmediato**.  
Debes reiniciar la sesión de R para que las nuevas variables de entorno se carguen correctamente.  
Puedes hacerlo manualmente cerrando y abriendo RStudio, o ejecutando el siguiente comando dentro de R:
>.rs.restartR()

---

## 🛠 Requerimientos técnicos

- R (versión ≥ 4.2)
- Paquetes:
  - `RODBC`, `tidyverse`, `cluster`, `ggplot2`, `dplyr`, `DBI`, `odbc`, entre otros.
- SQL Server 2019 o superior
- RStudio (opcional pero recomendado)
---

## 📄 Créditos

- [INEGI](https://www.inegi.org.mx/default.html) 
- [Encuesta Nacional de Ocupación y Empleo (ENOE)](https://www.inegi.org.mx/programas/enoe/15ymas/) 



