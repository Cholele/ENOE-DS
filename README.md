# 📊 ENOE-DS: Análisis del Mercado Laboral Mexicano con Ciencia de Datos
Este proyecto aplica técnicas de ciencia de datos (EDA, análisis de regresión y clustering) para analizar los datos de la Encuesta Nacional de Ocupación y Empleo (ENOE) del INEGI.

**Autor:** Edder Gerardo Hernández Jiménez  
**Proyecto académico de investigación**  ANÁLISIS DEL MERCADO LABORAL EN MEXICO: EXPLORACIÓN DE PATRONES Y SEGMENTOS DE POBLACIÓN MEDIANTE TÉCNICAS DEL DATA SCIENCE.
**Período de análisis:** III y IV trimestre de 2023  
**Datos fuente:** Encuesta Nacional de Ocupación y Empleo (ENOE) - INEGI

---

## 🎯 Objetivo General

Identificar patrones y segmentos de población que enfrentan dificultades en el mercado laboral mexicano mediante técnicas de ciencia de datos aplicadas a los datos de la ENOE.

---

## 📌 Contexto

El auge de la ciencia de datos ha impulsado su demanda en el mercado laboral; sin embargo, regiones como Chiapas enfrentan carencias formativas en esta área. Este proyecto busca aprovechar las herramientas de análisis de datos para generar conocimiento útil que apoye la toma de decisiones y políticas públicas inclusivas.

---

## 🧠 Metodología

- **Enfoque mixto:** revisión documental + análisis cuantitativo.
- **Técnicas aplicadas en R:**
  - Análisis exploratorio de datos (EDA)
  - Regresión lineal / logística
  - Clustering (segmentación)
- **Base de datos estructurada en SQL Server**, normalizada y compuesta por 5 tablas:
  - Vivienda
  - Hogar
  - Sociodemográfico
  - COE1 (cuestionario laboral parte I)
  - COE2 (cuestionario laboral parte II)

---

## 📁 Estructura del Repositorio
ENOE-DS/
- `R/`: # Scripts de procesamiento, limpieza y análisis en R
- `SQL/`:  # Scripts de modelado, importación y consultas SQL
- `data/`: Datos por categorias raw (no procesados), y datos limpios.
- `doc/`: # Documentación metodológica y técnica de la ENOE
- `outputs/`: # Gráficos, resultados y visualizaciones generadas
- `rmarkdown/`: # Informes reproducibles y reportes en RMarkdown

---

> 📌 **Nota**
Los archivos `.csv` y otras fuentes de datos voluminosos no están versionados en GitHub. Se espera que sean gestionados localmente o mediante bases de datos.

---

## 🛠 Requerimientos técnicos

- R (versión ≥ 4.2)
- Paquetes:
  - `RODBC`, `tidyverse`, `cluster`, `ggplot2`, `dplyr`, `DBI`, `odbc`, entre otros.
- SQL Server 2019 o superior
- RStudio (opcional pero recomendado)
