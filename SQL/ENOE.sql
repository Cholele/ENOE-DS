
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

		[LOC] INT NULL,
		[MUN] INT NULL,
		[EST] INT NULL,
		[EST_D_TRI] INT NULL,
		[EST_D_MEN] INT NULL,
		[AGEB] INT NULL,
		[T_LOC_TRI] INT NULL,
		[T_LOC_MEN] INT NULL,
		[CD_A] INT NOT NULL,
		[ENT] INT NOT NULL,
		[CON] INT NOT NULL,
		[UPM] INT NULL,
		[D_SEM] INT NULL,
		[N_PRO_VIV] INT NULL,
		[V_SEL] INT NOT NULL,
		[N_ENT] INT NULL,
		[PER] INT NULL,
		[P1] INT NULL,
		[P2] INT NULL,
		[P3] INT NULL,
		[UR] INT NULL,
		[TIPO] INT NOT NULL,
		[MES_CAL] INT NOT NULL,
		[FAC_TRI] INT NULL,
		[FAC_MEN] INT NULL,

	 CONSTRAINT [PK_vivienda] PRIMARY KEY CLUSTERED 
	(
		[TIPO] ASC,
		[MES_CAL] ASC,
		[CD_A] ASC,
		[ENT] ASC,
		[CON] ASC,
		[V_SEL] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]


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

		[LOC] INT NULL,
		[MUN] INT NULL,
		[EST] INT NULL,
		[EST_D_TRI] INT NULL,
		[EST_D_MEN] INT NULL,
		[AGEB] INT NULL,
		[T_LOC_TRI] INT NULL,
		[T_LOC_MEN] INT NULL,
		[CD_A] INT NOT NULL,
		[ENT] INT NOT NULL,
		[CON] INT NOT NULL,
		[UPM] INT NULL,
		[D_SEM] INT NULL,
		[N_PRO_VIV] INT NULL,
		[V_SEL] INT NOT NULL,
		[N_HOG] INT NOT NULL,
		[H_MUD] INT NOT NULL,
		[N_ENT] INT NULL,
		[PER] INT NULL,
		[R_PRE] INT NULL,
		[P_DIA] INT NULL,
		[P_MES] INT NULL,
		[P_ANIO] INT NULL,
		[R_DEF] INT NULL,
		[D_DIA] INT NULL,
		[D_MES] INT NULL,
		[D_ANIO] INT NULL,
		[E_OBS] INT NULL,
		[P4_1] INT NULL,
		[P4_2] INT NULL,
		[INF] INT NULL,
		[UR] INT NULL,
		[TIPO] INT NOT NULL,
		[MES_CAL] INT NOT NULL,
		[TIPOLEV] INT NULL,
		[FAC_TRI] INT NULL,
		[FAC_MEN] INT NULL

	 CONSTRAINT [PK_hogar] PRIMARY KEY CLUSTERED 
	(
		[TIPO] ASC,
		[MES_CAL] ASC,
		[CD_A] ASC,
		[ENT] ASC,
		[CON] ASC,
		[V_SEL] ASC,

		[N_HOG] ASC,
		[H_MUD] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]


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

	[R_DEF] INT NULL,
	[LOC] INT NULL,
	[MUN] INT NULL,
	[EST] INT NULL,
	[EST_D_TRI] INT NULL,
	[EST_D_MEN] INT NULL,
	[AGEB] INT NULL,
	[T_LOC_TRI] INT NULL,
	[T_LOC_MEN] INT NULL,
	[CD_A] INT NOT NULL,
	[ENT] INT NOT NULL,
	[CON] INT NOT NULL,
	[UPM] INT NULL,
	[D_SEM] INT NULL,
	[N_PRO_VIV] INT NULL,	
	[V_SEL] INT NOT NULL,
	[N_HOG] INT NOT NULL,
	[H_MUD] INT NOT NULL,
	[N_ENT] INT NULL,
	[PER] INT NULL,
	[N_REN] INT NOT NULL,
	[C_RES] INT NULL,
	[PAR_C] INT NULL,
	[SEX] INT NULL,
	[EDA] INT NULL,
	[NAC_DIA] INT NULL,
	[NAC_MES] INT NULL,
	[NAC_ANIO] INT NULL,
	[L_NAC_C] INT NULL,
	[CS_P12] INT NULL,
	[CS_P13_1] INT NULL,
	[CS_P13_2] INT NULL,
	[CS_P14_C] INT NULL,
	[CS_P15] INT NULL,
	[CS_P16] INT NULL,
	[CS_P17] INT NULL,
	[N_HIJ] INT NULL,
	[E_CON] INT NULL,
	[CS_P20A_1] INT NULL,
	[CS_P20A_C] INT NULL,
	[CS_P20B_1] INT NULL,
	[CS_P20B_C] INT NULL,
	[CS_P20C_1] INT NULL,
	[CS_AD_MOT] INT NULL,
	[CS_P21_DES] NVARCHAR (50) NULL,
	[CS_AD_DES] INT NULL,
	[CS_NR_MOT] INT NULL,
	[CS_P23_DES] NVARCHAR (50) NULL,
	[CS_NR_ORI] INT NULL,
	[UR] INT NULL,
	[ZONA] INT NULL,
	[SALARIO] INT NULL,
	[FAC_TRI] INT NULL,
	[FAC_MEN] INT NULL,
	[CLASE1] INT NULL,
	[CLASE2] INT NULL,
	[CLASE3] INT NULL,
	[POS_OCU] INT NULL,
	[SEG_SOC] INT NULL,
	[RAMA] INT NULL,
	[C_OCU11C] INT NULL,
	[ING7C] INT NULL,
	[DUR9C] INT NULL,
	[EMPLE7C] INT NULL,
	[MEDICA5C] INT NULL,
	[BUSCAR5C] INT NULL,
	[RAMA_EST1] INT NULL,
	[RAMA_EST2] INT NULL,
	[DUR_EST] INT NULL,
	[AMBITO1] INT NULL,
	[AMBITO2] INT NULL,
	[TUE1] INT NULL,
	[TUE2] INT NULL,
	[TUE3] INT NULL,
	[BUSQUEDA] INT NULL,
	[D_ANT_LAB] INT NULL,
	[D_CEXP_EST] INT NULL,
	[DUR_DES] INT NULL,
	[SUB_O] INT NULL,
	[S_CLASIFI] INT NULL,
	[REMUNE2C] INT NULL,
	[PRE_ASA] INT NULL,
	[TIP_CON] INT NULL,
	[DISPO] INT NULL,
	[NODISPO] INT NULL,
	[C_INAC5C] INT NULL,
	[PNEA_EST] INT NULL,
	[NIV_INS] INT NULL,
	[EDA5C] INT NULL,
	[EDA7C] INT NULL,
	[EDA12C] INT NULL,
	[EDA19C] INT NULL,
	[HIJ5C] INT NULL,
	[DOMESTICO] INT NULL,
	[ANIOS_ESC] INT NULL,
	[HRSOCUP] INT NULL,
	[INGOCUP] INT NULL,
	[ING_X_HRS] FLOAT NULL,
	[TPG_P8A] INT NULL,
	[TCCO] INT NULL,
	[CP_ANOC] INT NULL,
	[IMSSISSSTE] INT NULL,
	[MA48ME1SM] INT NULL,
	[P14APOYOS] INT NULL,
	[SCIAN] INT NULL,
	[T_TRA] INT NULL,
	[EMP_PPAL] INT NULL,
	[TUE_PPAL] INT NULL,
	[TRANS_PPAL] INT NULL,
	[MH_FIL2] INT NULL,
	[MH_COL] INT NULL,
	[SEC_INS] INT NULL,
	[TIPO] INT NOT NULL,
	[MES_CAL] INT NOT NULL,

	 CONSTRAINT [PK_sdmgf] PRIMARY KEY CLUSTERED 
	(
		[TIPO] ASC,
		[MES_CAL] ASC,
		[CD_A] ASC,
		[ENT] ASC,
		[CON] ASC,
		[V_SEL] ASC,
		[N_HOG] ASC,
		[H_MUD] ASC,

		[N_REN] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]


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

		[R_DEF] INT NULL,
		[CD_A] INT NOT NULL,
		[ENT] INT NOT NULL,
		[CON] INT NOT NULL,
		[UPM] INT NULL,
		[D_SEM] INT NULL,
		[N_PRO_VIV] INT NULL,
		[V_SEL] INT NOT NULL,
		[N_HOG] INT NOT NULL,
		[H_MUD] INT NOT NULL,
		[N_ENT] INT NULL,
		[PER] INT NULL,
		[N_REN] INT NOT NULL,
		[EDA] INT NULL,
		[N_INF] INT NULL,
		[P1] INT NULL,
		[P1A1] INT NULL,
		[P1A2] INT NULL,
		[P1A3] INT NULL,
		[P1B] INT NULL,
		[P1C] INT NULL,
		[P1D] INT NULL,
		[P1E] INT NULL,
		[P2_1] INT NULL,
		[P2_2] INT NULL,
		[P2_3] INT NULL,
		[P2_4] INT NULL,
		[P2_9] INT NULL,
		[P2A_DIA] INT NULL,
		[P2A_SEM] INT NULL,
		[P2A_MES] INT NULL,
		[P2A_ANIO] INT NULL,
		[P2B_DIA] INT NULL,
		[P2B_SEM] INT NULL,
		[P2B_MES] INT NULL,
		[P2B_ANIO] INT NULL,
		[P2B] INT NULL,
		[P2C] INT NULL,
		[P2D1] INT NULL,
		[P2D2] INT NULL,
		[P2D3] INT NULL,
		[P2D4] INT NULL,
		[P2D5] INT NULL,
		[P2D6] INT NULL,
		[P2D7] INT NULL,
		[P2D8] INT NULL,
		[P2D9] INT NULL,
		[P2D10] INT NULL,
		[P2D11] INT NULL,
		[P2D99] INT NULL,
		[P2E] INT NULL,
		[P2F] INT NULL,
		[P2G1] INT NULL,
		[P2G2] INT NULL,
		[P2H1] INT NULL,
		[P2H2] INT NULL,
		[P2H3] INT NULL,
		[P2H4] INT NULL,
		[P2H9] INT NULL,
		[P2I] INT NULL,
		[P2J] INT NULL,
		[P2K_ANIO] INT NULL,
		[P2K_MES] INT NULL,
		[P2K] INT NULL,
		[P3] INT NULL,
		[P3A] INT NULL,
		[P3B] INT NULL,
		[P3C1] INT NULL,
		[P3C2] INT NULL,
		[P3C3] INT NULL,
		[P3C4] INT NULL,
		[P3C9] INT NULL,
		[P3D] INT NULL,
		[P3E] INT NULL,
		[P3F1] INT NULL,
		[P3F2] INT NULL,
		[P3G1_1] INT NULL,
		[P3G1_2] INT NULL,
		[P3G2_1] INT NULL,
		[P3G2_2] INT NULL,
		[P3G3_1] INT NULL,
		[P3G3_2] INT NULL,
		[P3G4_1] INT NULL,
		[P3G4_2] INT NULL,
		[P3G9] INT NULL,
		[P3G_TOT] INT NULL,
		[P3H] INT NULL,
		[P3I] INT NULL,
		[P3J1] INT NULL,
		[P3J2] INT NULL,
		[P3K1] INT NULL,
		[P3K2] INT NULL,
		[P3K3] INT NULL,
		[P3K4] INT NULL,
		[P3K5] INT NULL,
		[P3K9] INT NULL,
		[P3L] INT NULL,
		[P4] INT NULL,
		[P4_1] INT NULL,
		[P4_2] INT NULL,
		[P4_3] INT NULL,
		[P4A] INT NULL,
		[P4A_1] INT NULL,
		[P4B] INT NULL,
		[P4C] INT NULL,
		[P4D1] INT NULL,
		[P4D2] INT NULL,
		[P4D3] INT NULL,
		[P4E] INT NULL,
		[P4F] INT NULL,
		[P4G] INT NULL,
		[P4H] INT NULL,
		[P4I] INT NULL,
		[P4I_1] INT NULL,
		[P5] INT NULL,
		[P5A] INT NULL,
		[P5B_HLU] INT NULL,
		[P5B_MLU] INT NULL,
		[P5B_HMA] INT NULL,
		[P5B_MMA] INT NULL,
		[P5B_HMI] INT NULL,
		[P5B_MMI] INT NULL,
		[P5B_HJU] INT NULL,
		[P5B_MJU] INT NULL,
		[P5B_HVI] INT NULL,
		[P5B_MVI] INT NULL,
		[P5B_HSA] INT NULL,
		[P5B_MSA] INT NULL,
		[P5B_HDO] INT NULL,
		[P5B_MDO] INT NULL,
		[P5B_THRS] INT NULL,
		[P5B_TDIA] INT NULL,
		[P5C] INT NULL,
		[P5D1] INT NULL,
		[P5D_HLU] INT NULL,
		[P5D_MLU] INT NULL,
		[P5D_HMA] INT NULL,
		[P5D_MMA] INT NULL,
		[P5D_HMI] INT NULL,
		[P5D_MMI] INT NULL,
		[P5D_HJU] INT NULL,
		[P5D_MJU] INT NULL,
		[P5D_HVI] INT NULL,
		[P5D_MVI] INT NULL,
		[P5D_HSA] INT NULL,
		[P5D_MSA] INT NULL,
		[P5D_HDO] INT NULL,
		[P5D_MDO] INT NULL,
		[P5D_THRS] INT NULL,
		[P5D_TDIA] INT NULL,
		[P5E] INT NULL,
		[P5F1] INT NULL,
		[P5F2] INT NULL,
		[P5F3] INT NULL,
		[P5F4] INT NULL,
		[P5F5] INT NULL,
		[P5F6] INT NULL,
		[P5F7] INT NULL,
		[P5F8] INT NULL,
		[P5F9] INT NULL,
		[P5F10] INT NULL,
		[P5F11] INT NULL,
		[P5F12] INT NULL,
		[P5F13] INT NULL,
		[P5F14] INT NULL,
		[P5F15] INT NULL,
		[P5F99] INT NULL,
		[UR] INT NULL,
		[TIPO] INT NOT NULL,
		[MES_CAL] INT NOT NULL,
		[FAC_TRI] INT NULL,
		[FAC_MEN] INT NULL

	 CONSTRAINT [PK_coe1] PRIMARY KEY CLUSTERED 
	(
		[TIPO] ASC,
		[MES_CAL] ASC,
		[CD_A] ASC,
		[ENT] ASC,
		[CON] ASC,
		[V_SEL] ASC,
		[N_HOG] ASC,
		[H_MUD] ASC,
		[N_REN] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]


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

	[CD_A] INT NOT NULL,
	[ENT] INT NOT NULL,
	[CON] INT NOT NULL,
	[UPM] INT NULL,
	[D_SEM] INT NULL,
	[N_PRO_VIV] INT NULL,
	[V_SEL] INT NOT NULL,
	[N_HOG] INT NOT NULL,
	[H_MUD] INT NOT NULL,
	[N_ENT] INT NULL,
	[PER] INT NULL,
	[N_REN] INT NOT NULL,
	[EDA] INT NULL,
	[N_INF] INT NULL,
	[P6_1] INT NULL,
	[P6_2] INT NULL,
	[P6_3] INT NULL,
	[P6_4] INT NULL,
	[P6_5] INT NULL,
	[P6_6] INT NULL,
	[P6_7] INT NULL,
	[P6_8] INT NULL,
	[P6_9] INT NULL,
	[P6_10] INT NULL,
	[P6_99] INT NULL,
	[P6A1] INT NULL,
	[P6A2] INT NULL,
	[P6A3] INT NULL,
	[P6A4] INT NULL,
	[P6A9] INT NULL,
	[P6B1] INT NULL,
	[P6B2] INT NULL,
	[P6C] INT NULL,
	[P6D] INT NULL,
	[P6E] INT NULL,
	[P6E_C] INT NULL,
	[P6F] INT NULL,
	[P6F_C] INT NULL,
	[P6G] INT NULL,
	[P6H] INT NULL,
	[P6H_C] INT NULL,
	[P6I] INT NULL,
	[P6I_C] INT NULL,
	[P7] INT NULL,
	[P7A] INT NULL,
	[P7B] INT NULL,
	[P7C] INT NULL,
	[P8_1] INT NULL,
	[P8_2] INT NULL,
	[P8_3] INT NULL,
	[P8_4] INT NULL,
	[P8_9] INT NULL,
	[P8A] INT NULL,
	[P9_1] INT NULL,
	[P9_H1] INT NULL,
	[P9_M1] INT NULL,
	[P9_2] INT NULL,
	[P9_H2] INT NULL,
	[P9_M2] INT NULL,
	[P9_3] INT NULL,
	[P9_H3] INT NULL,
	[P9_M3] INT NULL,
	[P9_4] INT NULL,
	[P9_H4] INT NULL,
	[P9_M4] INT NULL,
	[P9_5] INT NULL,
	[P9_H5] INT NULL,
	[P9_M5] INT NULL,
	[P9_6] INT NULL,
	[P9_H6] INT NULL,
	[P9_M6] INT NULL,
	[P9_7] INT NULL,
	[P9_H7] INT NULL,
	[P9_M7] INT NULL,
	[P9_8] INT NULL,
	[P9_H8] INT NULL,
	[P9_M8] INT NULL,
	[UR] INT NULL,
	[TIPO] INT NOT NULL,
	[MES_CAL] INT NOT NULL,
	[FAC_TRI] INT NULL,
	[FAC_MEN] INT NULL

	 CONSTRAINT [PK_coe2] PRIMARY KEY CLUSTERED 
	(
		[TIPO] ASC,
		[MES_CAL] ASC,
		[CD_A] ASC,
		[ENT] ASC,
		[CON] ASC,
		[V_SEL] ASC,
		[N_HOG] ASC,
		[H_MUD] ASC,
		[N_REN] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]


/*============================================================================================================================================*/
/*												    	  TABLES FK				       									                   	*/
/*============================================================================================================================================*/
	GO
	ALTER TABLE [dbo].[hogar]  WITH CHECK ADD  CONSTRAINT [FK_hogar_vivienda] FOREIGN KEY([TIPO],[MES_CAL],[CD_A],[ENT],[CON],[V_SEL])
	REFERENCES [dbo].[vivienda] ([TIPO],[MES_CAL],[CD_A],[ENT],[CON],[V_SEL])
	GO
	ALTER TABLE [dbo].[hogar] CHECK CONSTRAINT [FK_hogar_vivienda]


	GO
	ALTER TABLE [dbo].[sdmgf]  WITH CHECK ADD  CONSTRAINT [FK_sdmgf_hogar] FOREIGN KEY([TIPO],[MES_CAL],[CD_A],[ENT],[CON],[V_SEL],[N_HOG],[H_MUD])
	REFERENCES [dbo].[hogar] ([TIPO],[MES_CAL],[CD_A],[ENT],[CON],[V_SEL],[N_HOG],[H_MUD])
	GO
	ALTER TABLE [dbo].[sdmgf] CHECK CONSTRAINT [FK_sdmgf_hogar]


	GO
	ALTER TABLE [dbo].[coe1]  WITH CHECK ADD  CONSTRAINT [FK_coe1_sdmgf] FOREIGN KEY([TIPO],[MES_CAL],[CD_A],[ENT],[CON],[V_SEL],[N_HOG],[H_MUD],[N_REN])
	REFERENCES [dbo].[sdmgf] ([TIPO],[MES_CAL],[CD_A],[ENT],[CON],[V_SEL],[N_HOG],[H_MUD],[N_REN])
	GO
	ALTER TABLE [dbo].[coe1] CHECK CONSTRAINT [FK_coe1_sdmgf]


	GO
	ALTER TABLE [dbo].[coe2]  WITH CHECK ADD  CONSTRAINT [FK_coe2_sdmgf] FOREIGN KEY([TIPO],[MES_CAL],[CD_A],[ENT],[CON],[V_SEL],[N_HOG],[H_MUD],[N_REN])
	REFERENCES [dbo].[sdmgf] ([TIPO],[MES_CAL],[CD_A],[ENT],[CON],[V_SEL],[N_HOG],[H_MUD],[N_REN])
	GO
	ALTER TABLE [dbo].[coe2] CHECK CONSTRAINT [FK_coe2_sdmgf]



/*-------------------------- REGISTROS --------------------------*/

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

/*------------ Se comprueba de que los valores por trimestre se registraron de forma correcta ------------*/
	SELECT count(*) FROM dbo.coe2
	SELECT count(*) FROM dbo.coe2 where PER = 323
	SELECT count(*) FROM dbo.coe2 where PER = 423