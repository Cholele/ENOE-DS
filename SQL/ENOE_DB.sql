﻿
CREATE DATABASE ENOE


USE [ENOE]

/*============================================================================================================================================*/
/*													TABLA vivienda															        	*/
/*============================================================================================================================================*/
	GO
	/****** Object:  Table [dbo].[vivienda]    Script Date: 25/04/2023 11:37:39 p. m. ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [dbo].[vivienda](

		[loc] INT NULL,
		[mun] INT NULL,
		[est] INT NULL,
		[est_d_tri] INT NULL,
		[est_d_men] INT NULL,
		[ageb] INT NULL,
		[t_loc_tri] INT NULL,
		[t_loc_men] INT NULL,
		[cd_a] INT NOT NULL,
		[ent] INT NOT NULL,
		[con] INT NOT NULL,
		[upm] INT NULL,
		[d_sem] INT NULL,
		[n_pro_viv] INT NULL,
		[v_sel] INT NOT NULL,
		[n_ent] INT NULL,
		[per] INT NULL,
		[p1] INT NULL,
		[p2] INT NULL,
		[p3] INT NULL,
		[ur] INT NULL,
		[tipo] INT NOT NULL,
		[mes_cal] INT NOT NULL,
		[fac_tri] INT NULL,
		[fac_men] INT NULL,

	 CONSTRAINT [pk_vivienda] PRIMARY KEY CLUSTERED 
	(
		[tipo] ASC,
		[mes_cal] ASC,
		[cd_a] ASC,
		[ent] ASC,
		[con] ASC,
		[v_sel] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [primary]
	) ON [primary]


/*============================================================================================================================================*/
/*													TABLA hogar															        	*/
/*============================================================================================================================================*/
	GO
	/****** Object:  Table [dbo].[hogar]    Script Date: 25/04/2023 11:37:39 p. m. ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [dbo].[hogar](

		[loc] INT NULL,
		[mun] INT NULL,
		[est] INT NULL,
		[est_d_tri] INT NULL,
		[est_d_men] INT NULL,
		[ageb] INT NULL,
		[t_loc_tri] INT NULL,
		[t_loc_men] INT NULL,
		[cd_a] INT NOT NULL,
		[ent] INT NOT NULL,
		[con] INT NOT NULL,
		[upm] INT NULL,
		[d_sem] INT NULL,
		[n_pro_viv] INT NULL,
		[v_sel] INT NOT NULL,
		[n_hog] INT NOT NULL,
		[h_mud] INT NOT NULL,
		[n_ent] INT NULL,
		[per] INT NULL,
		[r_pre] INT NULL,
		[p_dia] INT NULL,
		[p_mes] INT NULL,
		[p_anio] INT NULL,
		[r_def] INT NULL,
		[d_dia] INT NULL,
		[d_mes] INT NULL,
		[d_anio] INT NULL,
		[e_obs] INT NULL,
		[p4_1] INT NULL,
		[p4_2] INT NULL,
		[inf] INT NULL,
		[ur] INT NULL,
		[tipo] INT NOT NULL,
		[mes_cal] INT NOT NULL,
		[tipolev] INT NULL,
		[fac_tri] INT NULL,
		[fac_men] INT NULL

	 CONSTRAINT [pk_hogar] PRIMARY KEY CLUSTERED 
	(
		[tipo] ASC,
		[mes_cal] ASC,
		[cd_a] ASC,
		[ent] ASC,
		[con] ASC,
		[v_sel] ASC,

		[n_hog] ASC,
		[h_mud] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [primary]
	) ON [primary]


/*============================================================================================================================================*/
/*													TABLA sdmgf															        	*/
/*============================================================================================================================================*/
	GO
	/****** Object:  Table [dbo].[sdmgf]    Script Date: 25/04/2023 11:37:39 p. m. ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [dbo].[sdmgf](

	[r_def] INT NULL,
	[loc] INT NULL,
	[mun] INT NULL,
	[est] INT NULL,
	[est_d_tri] INT NULL,
	[est_d_men] INT NULL,
	[ageb] INT NULL,
	[t_loc_tri] INT NULL,
	[t_loc_men] INT NULL,
	[cd_a] INT NOT NULL,
	[ent] INT NOT NULL,
	[con] INT NOT NULL,
	[upm] INT NULL,
	[d_sem] INT NULL,
	[n_pro_viv] INT NULL,	
	[v_sel] INT NOT NULL,
	[n_hog] INT NOT NULL,
	[h_mud] INT NOT NULL,
	[n_ent] INT NULL,
	[per] INT NULL,
	[n_ren] INT NOT NULL,
	[c_res] INT NULL,
	[par_c] INT NULL,
	[sex] INT NULL,
	[eda] INT NULL,
	[nac_dia] INT NULL,
	[nac_mes] INT NULL,
	[nac_anio] INT NULL,
	[l_nac_c] INT NULL,
	[cs_p12] INT NULL,
	[cs_p13_1] INT NULL,
	[cs_p13_2] INT NULL,
	[cs_p14_c] INT NULL,
	[cs_p15] INT NULL,
	[cs_p16] INT NULL,
	[cs_p17] INT NULL,
	[n_hij] INT NULL,
	[e_con] INT NULL,
	[cs_p20a_1] INT NULL,
	[cs_p20a_c] INT NULL,
	[cs_p20b_1] INT NULL,
	[cs_p20b_c] INT NULL,
	[cs_p20c_1] INT NULL,
	[cs_ad_mot] INT NULL,
	[cs_p21_des] NVARCHAR (50) NULL,
	[cs_ad_des] INT NULL,
	[cs_nr_mot] INT NULL,
	[cs_p23_des] NVARCHAR (50) NULL,
	[cs_nr_ori] INT NULL,
	[ur] INT NULL,
	[zona] INT NULL,
	[salario] INT NULL,
	[fac_tri] INT NULL,
	[fac_men] INT NULL,
	[clase1] INT NULL,
	[clase2] INT NULL,
	[clase3] INT NULL,
	[pos_ocu] INT NULL,
	[seg_soc] INT NULL,
	[rama] INT NULL,
	[c_ocu11c] INT NULL,
	[ing7c] INT NULL,
	[dur9c] INT NULL,
	[emple7c] INT NULL,
	[medica5c] INT NULL,
	[buscar5c] INT NULL,
	[rama_est1] INT NULL,
	[rama_est2] INT NULL,
	[dur_est] INT NULL,
	[ambito1] INT NULL,
	[ambito2] INT NULL,
	[tue1] INT NULL,
	[tue2] INT NULL,
	[tue3] INT NULL,
	[busqueda] INT NULL,
	[d_ant_lab] INT NULL,
	[d_cexp_est] INT NULL,
	[dur_des] INT NULL,
	[sub_o] INT NULL,
	[s_clasifi] INT NULL,
	[remune2c] INT NULL,
	[pre_asa] INT NULL,
	[tip_con] INT NULL,
	[dispo] INT NULL,
	[nodispo] INT NULL,
	[c_inac5c] INT NULL,
	[pnea_est] INT NULL,
	[niv_ins] INT NULL,
	[eda5c] INT NULL,
	[eda7c] INT NULL,
	[eda12c] INT NULL,
	[eda19c] INT NULL,
	[hij5c] INT NULL,
	[domestico] INT NULL,
	[anios_esc] INT NULL,
	[hrsocup] INT NULL,
	[ingocup] INT NULL,
	[ing_x_hrs] FLOAT NULL,
	[tpg_p8a] INT NULL,
	[tcco] INT NULL,
	[cp_anoc] INT NULL,
	[imssissste] INT NULL,
	[ma48me1sm] INT NULL,
	[p14apoyos] INT NULL,
	[scian] INT NULL,
	[t_tra] INT NULL,
	[emp_ppal] INT NULL,
	[tue_ppal] INT NULL,
	[trans_ppal] INT NULL,
	[mh_fil2] INT NULL,
	[mh_col] INT NULL,
	[sec_ins] INT NULL,
	[tipo] INT NOT NULL,
	[mes_cal] INT NOT NULL,

	 CONSTRAINT [pk_sdmgf] PRIMARY KEY CLUSTERED 
	(
		[tipo] ASC,
		[mes_cal] ASC,
		[cd_a] ASC,
		[ent] ASC,
		[con] ASC,
		[v_sel] ASC,
		[n_hog] ASC,
		[h_mud] ASC,

		[n_ren] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [primary]
	) ON [primary]


/*============================================================================================================================================*/
/*													TABLA coe1          														        	*/
/*============================================================================================================================================*/
	GO
	/****** Object:  Table [dbo].[coe1]    Script Date: 25/04/2023 11:37:39 p. m. ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [dbo].[coe1](

		[r_def] INT NULL,
		[cd_a] INT NOT NULL,
		[ent] INT NOT NULL,
		[con] INT NOT NULL,
		[upm] INT NULL,
		[d_sem] INT NULL,
		[n_pro_viv] INT NULL,
		[v_sel] INT NOT NULL,
		[n_hog] INT NOT NULL,
		[h_mud] INT NOT NULL,
		[n_ent] INT NULL,
		[per] INT NULL,
		[n_ren] INT NOT NULL,
		[eda] INT NULL,
		[n_inf] INT NULL,
		[p1] INT NULL,
		[p1a1] INT NULL,
		[p1a2] INT NULL,
		[p1a3] INT NULL,
		[p1b] INT NULL,
		[p1c] INT NULL,
		[p1d] INT NULL,
		[p1e] INT NULL,
		[p2_1] INT NULL,
		[p2_2] INT NULL,
		[p2_3] INT NULL,
		[p2_4] INT NULL,
		[p2_9] INT NULL,
		[p2a_dia] INT NULL,
		[p2a_sem] INT NULL,
		[p2a_mes] INT NULL,
		[p2a_anio] INT NULL,
		[p2b_dia] INT NULL,
		[p2b_sem] INT NULL,
		[p2b_mes] INT NULL,
		[p2b_anio] INT NULL,
		[p2b] INT NULL,
		[p2c] INT NULL,
		[p2d1] INT NULL,
		[p2d2] INT NULL,
		[p2d3] INT NULL,
		[p2d4] INT NULL,
		[p2d5] INT NULL,
		[p2d6] INT NULL,
		[p2d7] INT NULL,
		[p2d8] INT NULL,
		[p2d9] INT NULL,
		[p2d10] INT NULL,
		[p2d11] INT NULL,
		[p2d99] INT NULL,
		[p2e] INT NULL,
		[p2f] INT NULL,
		[p2g1] INT NULL,
		[p2g2] INT NULL,
		[p2h1] INT NULL,
		[p2h2] INT NULL,
		[p2h3] INT NULL,
		[p2h4] INT NULL,
		[p2h9] INT NULL,
		[p2i] INT NULL,
		[p2j] INT NULL,
		[p2k_anio] INT NULL,
		[p2k_mes] INT NULL,
		[p2k] INT NULL,
		[p3] INT NULL,
		[p3a] INT NULL,
		[p3b] INT NULL,
		[p3c1] INT NULL,
		[p3c2] INT NULL,
		[p3c3] INT NULL,
		[p3c4] INT NULL,
		[p3c9] INT NULL,
		[p3d] INT NULL,
		[p3e] INT NULL,
		[p3f1] INT NULL,
		[p3f2] INT NULL,
		[p3g1_1] INT NULL,
		[p3g1_2] INT NULL,
		[p3g2_1] INT NULL,
		[p3g2_2] INT NULL,
		[p3g3_1] INT NULL,
		[p3g3_2] INT NULL,
		[p3g4_1] INT NULL,
		[p3g4_2] INT NULL,
		[p3g9] INT NULL,
		[p3g_tot] INT NULL,
		[p3h] INT NULL,
		[p3i] INT NULL,
		[p3j1] INT NULL,
		[p3j2] INT NULL,
		[p3k1] INT NULL,
		[p3k2] INT NULL,
		[p3k3] INT NULL,
		[p3k4] INT NULL,
		[p3k5] INT NULL,
		[p3k9] INT NULL,
		[p3l] INT NULL,
		[p4] INT NULL,
		[p4_1] INT NULL,
		[p4_2] INT NULL,
		[p4_3] INT NULL,
		[p4a] INT NULL,
		[p4a_1] INT NULL,
		[p4b] INT NULL,
		[p4c] INT NULL,
		[p4d1] INT NULL,
		[p4d2] INT NULL,
		[p4d3] INT NULL,
		[p4e] INT NULL,
		[p4f] INT NULL,
		[p4g] INT NULL,
		[p4h] INT NULL,
		[p4i] INT NULL,
		[p4i_1] INT NULL,
		[p5] INT NULL,
		[p5a] INT NULL,
		[p5b_hlu] INT NULL,
		[p5b_mlu] INT NULL,
		[p5b_hma] INT NULL,
		[p5b_mma] INT NULL,
		[p5b_hmi] INT NULL,
		[p5b_mmi] INT NULL,
		[p5b_hju] INT NULL,
		[p5b_mju] INT NULL,
		[p5b_hvi] INT NULL,
		[p5b_mvi] INT NULL,
		[p5b_hsa] INT NULL,
		[p5b_msa] INT NULL,
		[p5b_hdo] INT NULL,
		[p5b_mdo] INT NULL,
		[p5b_thrs] INT NULL,
		[p5b_tdia] INT NULL,
		[p5c] INT NULL,
		[p5d1] INT NULL,
		[p5d_hlu] INT NULL,
		[p5d_mlu] INT NULL,
		[p5d_hma] INT NULL,
		[p5d_mma] INT NULL,
		[p5d_hmi] INT NULL,
		[p5d_mmi] INT NULL,
		[p5d_hju] INT NULL,
		[p5d_mju] INT NULL,
		[p5d_hvi] INT NULL,
		[p5d_mvi] INT NULL,
		[p5d_hsa] INT NULL,
		[p5d_msa] INT NULL,
		[p5d_hdo] INT NULL,
		[p5d_mdo] INT NULL,
		[p5d_thrs] INT NULL,
		[p5d_tdia] INT NULL,
		[p5e] INT NULL,
		[p5f1] INT NULL,
		[p5f2] INT NULL,
		[p5f3] INT NULL,
		[p5f4] INT NULL,
		[p5f5] INT NULL,
		[p5f6] INT NULL,
		[p5f7] INT NULL,
		[p5f8] INT NULL,
		[p5f9] INT NULL,
		[p5f10] INT NULL,
		[p5f11] INT NULL,
		[p5f12] INT NULL,
		[p5f13] INT NULL,
		[p5f14] INT NULL,
		[p5f15] INT NULL,
		[p5f99] INT NULL,
		[ur] INT NULL,
		[tipo] INT NOT NULL,
		[mes_cal] INT NOT NULL,
		[fac_tri] INT NULL,
		[fac_men] INT NULL

	 CONSTRAINT [pk_coe1] PRIMARY KEY CLUSTERED 
	(
		[tipo] ASC,
		[mes_cal] ASC,
		[cd_a] ASC,
		[ent] ASC,
		[con] ASC,
		[v_sel] ASC,
		[n_hog] ASC,
		[h_mud] ASC,
		[n_ren] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [primary]
	) ON [primary]


/*============================================================================================================================================*/
/*												    	TABLA coe2														                   	*/
/*============================================================================================================================================*/
	GO
	/****** Object:  Table [dbo].[coe2]    Script Date: 25/04/2023 11:37:39 p. m. ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [dbo].[coe2](	

	[cd_a] INT NOT NULL,
	[ent] INT NOT NULL,
	[con] INT NOT NULL,
	[upm] INT NULL,
	[d_sem] INT NULL,
	[n_pro_viv] INT NULL,
	[v_sel] INT NOT NULL,
	[n_hog] INT NOT NULL,
	[h_mud] INT NOT NULL,
	[n_ent] INT NULL,
	[per] INT NULL,
	[n_ren] INT NOT NULL,
	[eda] INT NULL,
	[n_inf] INT NULL,
	[p6_1] INT NULL,
	[p6_2] INT NULL,
	[p6_3] INT NULL,
	[p6_4] INT NULL,
	[p6_5] INT NULL,
	[p6_6] INT NULL,
	[p6_7] INT NULL,
	[p6_8] INT NULL,
	[p6_9] INT NULL,
	[p6_10] INT NULL,
	[p6_99] INT NULL,
	[p6a1] INT NULL,
	[p6a2] INT NULL,
	[p6a3] INT NULL,
	[p6a4] INT NULL,
	[p6a9] INT NULL,
	[p6b1] INT NULL,
	[p6b2] INT NULL,
	[p6c] INT NULL,
	[p6d] INT NULL,
	[p6e] INT NULL,
	[p6e_c] INT NULL,
	[p6f] INT NULL,
	[p6f_c] INT NULL,
	[p6g] INT NULL,
	[p6h] INT NULL,
	[p6h_c] INT NULL,
	[p6i] INT NULL,
	[p6i_c] INT NULL,
	[p7] INT NULL,
	[p7a] INT NULL,
	[p7b] INT NULL,
	[p7c] INT NULL,
	[p8_1] INT NULL,
	[p8_2] INT NULL,
	[p8_3] INT NULL,
	[p8_4] INT NULL,
	[p8_9] INT NULL,
	[p8a] INT NULL,
	[p9_1] INT NULL,
	[p9_h1] INT NULL,
	[p9_m1] INT NULL,
	[p9_2] INT NULL,
	[p9_h2] INT NULL,
	[p9_m2] INT NULL,
	[p9_3] INT NULL,
	[p9_h3] INT NULL,
	[p9_m3] INT NULL,
	[p9_4] INT NULL,
	[p9_h4] INT NULL,
	[p9_m4] INT NULL,
	[p9_5] INT NULL,
	[p9_h5] INT NULL,
	[p9_m5] INT NULL,
	[p9_6] INT NULL,
	[p9_h6] INT NULL,
	[p9_m6] INT NULL,
	[p9_7] INT NULL,
	[p9_h7] INT NULL,
	[p9_m7] INT NULL,
	[p9_8] INT NULL,
	[p9_h8] INT NULL,
	[p9_m8] INT NULL,
	[ur] INT NULL,
	[tipo] INT NOT NULL,
	[mes_cal] INT NOT NULL,
	[fac_tri] INT NULL,
	[fac_men] INT NULL

	 CONSTRAINT [pk_coe2] PRIMARY KEY CLUSTERED 
	(
		[tipo] ASC,
		[mes_cal] ASC,
		[cd_a] ASC,
		[ent] ASC,
		[con] ASC,
		[v_sel] ASC,
		[n_hog] ASC,
		[h_mud] ASC,
		[n_ren] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [primary]
	) ON [primary]


/*============================================================================================================================================*/
/*												    	  FK				       									                   	*/
/*============================================================================================================================================*/
	GO
	ALTER TABLE [dbo].[hogar]  WITH CHECK ADD  CONSTRAINT [fk_hogar_vivienda] FOREIGN KEY([tipo],[mes_cal],[cd_a],[ent],[con],[v_sel])
	REFERENCES [dbo].[vivienda] ([tipo],[mes_cal],[cd_a],[ent],[con],[v_sel])
	GO
	ALTER TABLE [dbo].[hogar] CHECK CONSTRAINT [fk_hogar_vivienda]


	GO
	ALTER TABLE [dbo].[sdmgf]  WITH CHECK ADD  CONSTRAINT [fk_sdmgf_hogar] FOREIGN KEY([tipo],[mes_cal],[cd_a],[ent],[con],[v_sel],[n_hog],[h_mud])
	REFERENCES [dbo].[hogar] ([tipo],[mes_cal],[cd_a],[ent],[con],[v_sel],[n_hog],[h_mud])
	GO
	ALTER TABLE [dbo].[sdmgf] CHECK CONSTRAINT [fk_sdmgf_hogar]


	GO
	ALTER TABLE [dbo].[coe1]  WITH CHECK ADD  CONSTRAINT [fk_coe1_sdmgf] FOREIGN KEY([tipo],[mes_cal],[cd_a],[ent],[con],[v_sel],[n_hog],[h_mud],[n_ren])
	REFERENCES [dbo].[sdmgf] ([tipo],[mes_cal],[cd_a],[ent],[con],[v_sel],[n_hog],[h_mud],[n_ren])
	GO
	ALTER TABLE [dbo].[coe1] CHECK CONSTRAINT [fk_coe1_sdmgf]


	GO
	ALTER TABLE [dbo].[coe2]  WITH CHECK ADD  CONSTRAINT [fk_coe2_sdmgf] FOREIGN KEY([tipo],[mes_cal],[cd_a],[ent],[con],[v_sel],[n_hog],[h_mud],[n_ren])
	REFERENCES [dbo].[sdmgf] ([tipo],[mes_cal],[cd_a],[ent],[con],[v_sel],[n_hog],[h_mud],[n_ren])
	GO
	ALTER TABLE [dbo].[coe2] CHECK CONSTRAINT [fk_coe2_sdmgf]



/*-------------------------- 📥 CARGA MASIVA DE REGISTROS --------------------------*/

/*
	Este comando permite insertar registros de forma masiva a una tabla utilizando BULK INSERT.

	📌 Consideraciones para una carga exitosa:

	1. Especificar correctamente la tabla de destino.
	   Ejemplo: 'dbo.vivienda', 'dbo.hogar', 'dbo.sdmgf', etc.

	2. Indicar la ruta absoluta del archivo .csv:
	   - Usa comillas simples y doble backslash si es necesario.
	   - En este ejemplo, los archivos se movieron a la ruta de instalación de SQL Server
		 para evitar problemas de permisos de lectura (carpeta segura y accesible por el servicio de SQL).

	3. Respetar el orden lógico de inserción conforme a la estructura relacional de la ENOE:
	   1. vivienda
	   2. hogar
	   3. sdmgf
	   4. coe1
	   5. coe2
	   Esto garantiza que las claves foráneas se respeten y no se generen conflictos de integridad referencial.

	4. Repetir el proceso para cada trimestre que se desee incorporar al análisis.
*/


/* Ejemplo: Cargar registros en la tabla 'coe2' */

	BULK INSERT
		dbo.coe2
	FROM 
		'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\coe2.csv'
	WITH
	(
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		FIRSTROW = 2
	)

/*-------------------------- 📊 VERIFICACIÓN DE REGISTROS POR TRIMESTRE --------------------------*/

/*
	Este bloque permite validar que los datos han sido cargados correctamente para los trimestres esperados,
	consultando el número de registros por trimestre dentro de la tabla `coe2`.

	🔎 Descripción de los comandos:

	1. Consulta total de registros cargados en la tabla `coe2`.

	2. Filtro por trimestre usando la variable `PER`:
	   - PER = 323 → Corresponde al **3er trimestre de 2023**
	   - PER = 423 → Corresponde al **4to trimestre de 2023**

	✅ Este control es útil para:
	- Verificar si se cargaron todos los trimestres requeridos.
	- Detectar posibles duplicados, omisiones o errores de importación.
	- Servir como punto de control antes de realizar uniones o análisis posteriores.
*/

-- Total de registros en coe2
SELECT COUNT(*) AS total_registros FROM dbo.coe2;

-- Registros del trimestre III - 2023
SELECT COUNT(*) AS registros_t3_2023 FROM dbo.coe2 WHERE PER = 323;

-- Registros del trimestre IV - 2023
SELECT COUNT(*) AS registros_t4_2023 FROM dbo.coe2 WHERE PER = 423;


