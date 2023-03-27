/****** Object:  Database [AZURETAJAMAR]    Script Date: 27/03/2023 12:12:40 ******/
CREATE DATABASE [AZURETAJAMAR]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [AZURETAJAMAR] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [AZURETAJAMAR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AZURETAJAMAR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AZURETAJAMAR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AZURETAJAMAR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AZURETAJAMAR] SET ARITHABORT OFF 
GO
ALTER DATABASE [AZURETAJAMAR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AZURETAJAMAR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AZURETAJAMAR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AZURETAJAMAR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AZURETAJAMAR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AZURETAJAMAR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AZURETAJAMAR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AZURETAJAMAR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AZURETAJAMAR] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [AZURETAJAMAR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AZURETAJAMAR] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AZURETAJAMAR] SET  MULTI_USER 
GO
ALTER DATABASE [AZURETAJAMAR] SET ENCRYPTION ON
GO
ALTER DATABASE [AZURETAJAMAR] SET QUERY_STORE = ON
GO
ALTER DATABASE [AZURETAJAMAR] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IDCATEGORIA] [int] NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[DESCRIPCION] [nvarchar](60) NULL,
 CONSTRAINT [PK_CATEGORIA] PRIMARY KEY CLUSTERED 
(
	[IDCATEGORIA] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZAPATILLAS]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZAPATILLAS](
	[IDZAPATILLA] [int] NOT NULL,
	[IDCATEGORIA] [int] NOT NULL,
	[NOMBRE] [nvarchar](50) NULL,
	[TALLA] [decimal](10, 2) NOT NULL,
	[UNIDADESTOCK] [int] NOT NULL,
	[DESCRIPCION] [nvarchar](50) NOT NULL,
	[IMAGEN] [nvarchar](100) NULL,
	[PRECIO] [decimal](10, 2) NULL,
 CONSTRAINT [PK_ZAPATILLAS] PRIMARY KEY CLUSTERED 
(
	[IDZAPATILLA] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VISTA_ZAPATILLAS_CATEGORIA]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VISTA_ZAPATILLAS_CATEGORIA]
AS

SELECT Z.IDZAPATILLA, Z.NOMBRE, Z.TALLA, Z.UNIDADESTOCK, Z.DESCRIPCION, Z.IMAGEN, Z.PRECIO, C.NOMBRE AS NOMBRECATEGORIA FROM ZAPATILLAS Z
INNER JOIN CATEGORIA C
ON Z.IDCATEGORIA = C.IDCATEGORIA
GO
/****** Object:  Table [dbo].[COMPRAS]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRAS](
	[NUMEROTARJETA] [nvarchar](16) NULL,
	[NOMBRE] [nvarchar](50) NULL,
	[APELLIDOS] [nvarchar](50) NULL,
	[DIRECCION] [nvarchar](50) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[NUMEROTELEFONO] [int] NULL,
	[CODIGOPOSTAL] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CURSOSBI]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CURSOSBI](
	[IDCURSO] [int] NOT NULL,
	[NOMBRECURSO] [nvarchar](150) NULL,
	[DESCRIPCION] [nvarchar](500) NULL,
	[PRECIO] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCURSO] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPT]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPT](
	[DEPT_NO] [int] NULL,
	[DNOMBRE] [nvarchar](50) NULL,
	[LOC] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCTOR]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCTOR](
	[HOSPITAL_COD] [nvarchar](50) NULL,
	[DOCTOR_NO] [nvarchar](50) NULL,
	[APELLIDO] [nvarchar](50) NULL,
	[ESPECIALIDAD] [nvarchar](50) NULL,
	[SALARIO] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMP]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMP](
	[EMP_NO] [int] NULL,
	[APELLIDO] [nvarchar](50) NULL,
	[OFICIO] [nvarchar](50) NULL,
	[DIR] [int] NULL,
	[FECHA_ALT] [datetime] NULL,
	[SALARIO] [int] NULL,
	[COMISION] [int] NULL,
	[DEPT_NO] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENFERMO]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENFERMO](
	[INSCRIPCION] [nvarchar](50) NULL,
	[APELLIDO] [nvarchar](50) NULL,
	[DIRECCION] [nvarchar](50) NULL,
	[FECHA_NAC] [datetime] NULL,
	[S] [nvarchar](50) NULL,
	[NSS] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOSPITAL]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOSPITAL](
	[HOSPITAL_COD] [nvarchar](50) NULL,
	[NOMBRE] [nvarchar](50) NULL,
	[DIRECCION] [nvarchar](50) NULL,
	[TELEFONO] [nvarchar](50) NULL,
	[NUM_CAMA] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCUPACION]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCUPACION](
	[INSCRIPCION] [int] NULL,
	[HOSPITAL_COD] [int] NULL,
	[SALA_COD] [int] NULL,
	[CAMA] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLANTILLA]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLANTILLA](
	[HOSPITAL_COD] [nvarchar](50) NULL,
	[SALA_COD] [nvarchar](50) NULL,
	[EMPLEADO_NO] [nvarchar](50) NULL,
	[APELLIDO] [nvarchar](50) NULL,
	[FUNCION] [nvarchar](50) NULL,
	[T] [nvarchar](50) NULL,
	[SALARIO] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SALA]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALA](
	[HOSPITAL_COD] [nvarchar](50) NULL,
	[SALA_COD] [nvarchar](50) NULL,
	[NOMBRE] [nvarchar](50) NULL,
	[NUM_CAMA] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOLICITUDESALUMNOSBI]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOLICITUDESALUMNOSBI](
	[IDUSUARIO] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [nvarchar](150) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[DIRECCION] [nvarchar](500) NULL,
	[DNI] [nchar](9) NULL,
	[FECHAREGISTRO] [datetime] NULL,
	[IDCURSO] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDUSUARIO] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[IDUSUARIO] [int] NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[DNI] [nvarchar](9) NOT NULL,
	[DIRECCION] [nvarchar](50) NOT NULL,
	[TELEFONO] [nvarchar](50) NOT NULL,
	[EMAIL] [nvarchar](60) NOT NULL,
	[SALT] [nvarchar](50) NULL,
	[PASSWORD] [varbinary](max) NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[IDUSUARIO] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTAS]    Script Date: 27/03/2023 12:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTAS](
	[IDVENTA] [int] NOT NULL,
	[IDZAPATILLA] [int] NOT NULL,
	[IDUSUARIO] [int] NOT NULL,
	[NUMEROCOMPROBANTE] [nvarchar](50) NULL,
	[FECHA] [datetime] NULL,
	[IMPUESTO] [int] NULL,
	[TOTAL] [int] NULL,
	[NOMBREZAPATILLA] [nvarchar](50) NULL,
 CONSTRAINT [PK_VENTAS] PRIMARY KEY CLUSTERED 
(
	[IDVENTA] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CATEGORIA] ([IDCATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (1, N'Basketball', N'Zapatillas destinadas a practicar basket')
INSERT [dbo].[CATEGORIA] ([IDCATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (2, N'Futbol', N'Zapatillas destinadas para practicar futbol')
INSERT [dbo].[CATEGORIA] ([IDCATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (3, N'Skate', N'Zapatillas destinadas para practicar skate')
INSERT [dbo].[CATEGORIA] ([IDCATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (4, N'Premium', N'Las zapatillas de más alta gama para los hype-beast')
GO
INSERT [dbo].[COMPRAS] ([NUMEROTARJETA], [NOMBRE], [APELLIDOS], [DIRECCION], [EMAIL], [NUMEROTELEFONO], [CODIGOPOSTAL]) VALUES (N'123134', NULL, NULL, NULL, NULL, NULL, N'0')
INSERT [dbo].[COMPRAS] ([NUMEROTARJETA], [NOMBRE], [APELLIDOS], [DIRECCION], [EMAIL], [NUMEROTELEFONO], [CODIGOPOSTAL]) VALUES (N'121314345', N'javi', N'Pantoja', N'Calle Jupiter', N'javi@javi.es', 2323424, N'28341')
GO
INSERT [dbo].[CURSOSBI] ([IDCURSO], [NOMBRECURSO], [DESCRIPCION], [PRECIO]) VALUES (1, N'POWER PLATFORM', N'Certificación PL400', 900)
INSERT [dbo].[CURSOSBI] ([IDCURSO], [NOMBRECURSO], [DESCRIPCION], [PRECIO]) VALUES (2, N'AZURE', N'Certificación AZ204', 950)
INSERT [dbo].[CURSOSBI] ([IDCURSO], [NOMBRECURSO], [DESCRIPCION], [PRECIO]) VALUES (3, N'AWS', N'Certicificación Developer', 1200)
INSERT [dbo].[CURSOSBI] ([IDCURSO], [NOMBRECURSO], [DESCRIPCION], [PRECIO]) VALUES (4, N'NET CORE', N'Aplicaciones Multiplataforma Net Core', 600)
INSERT [dbo].[CURSOSBI] ([IDCURSO], [NOMBRECURSO], [DESCRIPCION], [PRECIO]) VALUES (5, N'COSTURA', N'Taller de costura y manualidades', 120)
GO
INSERT [dbo].[DEPT] ([DEPT_NO], [DNOMBRE], [LOC]) VALUES (10, N'CONTABILIDAD', N'ELCHE')
INSERT [dbo].[DEPT] ([DEPT_NO], [DNOMBRE], [LOC]) VALUES (20, N'INVESTIGACION', N'MADRID')
INSERT [dbo].[DEPT] ([DEPT_NO], [DNOMBRE], [LOC]) VALUES (30, N'VENTAS', N'BARCELONA')
INSERT [dbo].[DEPT] ([DEPT_NO], [DNOMBRE], [LOC]) VALUES (40, N'PRODUCCION', N'SALAMANCA')
GO
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (N'22', N'386', N'Cabeza D.', N'Psiquiatría', 152000)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (N'22', N'398', N'Best D.', N'Urología', 225000)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (N'19', N'435', N'López A.', N'Cardiología', 321000)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (N'22', N'453', N'Galo D.', N'Pediatría', 145222)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (N'45', N'522', N'Adams C.', N'Neurología', 520000)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (N'18', N'585', N'Miller G.', N'Ginecología', 450111)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (N'45', N'607', N'Chuki P.', N'Pediatría', 223000)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (N'18', N'982', N'Cajal R.', N'Cardiología', 151500)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (N'17', N'521', N'Peke O.', N'Neurología', 231000)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (N'17', N'120', N'Curro F.', N'Urología', 211000)
GO
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7369, N'SANCHA', N'EMPLEADO', 7902, CAST(N'1980-12-17T00:00:00.000' AS DateTime), 104000, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7499, N'ARROYO', N'VENDEDOR', 7698, CAST(N'1981-02-22T00:00:00.000' AS DateTime), 208000, 39000, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7521, N'SALA', N'VENDEDOR', 7698, CAST(N'1981-02-22T00:00:00.000' AS DateTime), 162500, 65000, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7566, N'JIMENEZ', N'DIRECTOR', 7839, CAST(N'1981-04-02T00:00:00.000' AS DateTime), 386750, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7654, N'MARTINEZ', N'VENDEDOR', 7698, CAST(N'1981-09-28T00:00:00.000' AS DateTime), 182000, 182000, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7698, N'NEGRO', N'DIRECTOR', 7839, CAST(N'1981-05-01T00:00:00.000' AS DateTime), 370500, 0, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7782, N'CEREZO', N'DIRECTOR', 7839, CAST(N'1981-06-09T00:00:00.000' AS DateTime), 318500, 0, 10)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7788, N'GIL', N'ANALISTA', 7566, CAST(N'1987-03-30T00:00:00.000' AS DateTime), 390000, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7839, N'REY', N'PRESIDENTE', 0, CAST(N'1981-11-17T00:00:00.000' AS DateTime), 650000, 0, 10)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7844, N'TOVAR', N'VENDEDOR', 7698, CAST(N'1981-09-08T00:00:00.000' AS DateTime), 195000, 0, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7876, N'ALONSO', N'EMPLEADO', 7788, CAST(N'1987-05-03T00:00:00.000' AS DateTime), 143000, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7900, N'JIMENO', N'EMPLEADO', 7698, CAST(N'1981-12-03T00:00:00.000' AS DateTime), 123500, 0, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7902, N'FERNANDEZ', N'ANALISTA', 7566, CAST(N'1981-12-03T00:00:00.000' AS DateTime), 390000, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7934, N'MUÑOZ', N'EMPLEADO', 7782, CAST(N'1982-06-23T00:00:00.000' AS DateTime), 169000, 0, 10)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7919, N'SERRA', N'DIRECTOR', 7839, CAST(N'1983-12-11T00:00:00.000' AS DateTime), 390000, 21000, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7988, N'SANTIUSTE', N'ANALISTA', 7919, CAST(N'1987-02-03T00:00:00.000' AS DateTime), 225000, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7322, N'FORD', N'VENDEDOR', 7919, CAST(N'1982-04-04T00:00:00.000' AS DateTime), 129000, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7614, N'GUTIERREZ', N'ANALISTA', 7919, CAST(N'1976-10-31T00:00:00.000' AS DateTime), 219000, 25000, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7589, N'CASALES', N'EMPLEADO', 7919, CAST(N'1984-11-28T00:00:00.000' AS DateTime), 179000, 0, 10)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7777, N'TORMO', N'VENDEDOR', 7788, CAST(N'1982-09-22T00:00:00.000' AS DateTime), 165900, 0, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7618, N'ALCALA', N'EMPLEADO', 7782, CAST(N'1987-01-14T00:00:00.000' AS DateTime), 123000, 0, 10)
GO
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'10995', N'Laguía M.', N'Goya 20', CAST(N'1956-05-16T00:00:00.000' AS DateTime), N'M', N'280862422')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'14024', N'Fernández M.', N'Recoletos 50', CAST(N'1960-05-21T00:00:00.000' AS DateTime), N'F', N'284991452')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'18004', N'Serrano V.', N'Alcalá 12', CAST(N'1967-06-23T00:00:00.000' AS DateTime), N'F', N'321790059')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'36658', N'Domin S.', N'Mayor 71', CAST(N'1942-01-01T00:00:00.000' AS DateTime), N'M', N'160654471')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'38702', N'Neal R.', N'Orense 11', CAST(N'1940-06-18T00:00:00.000' AS DateTime), N'F', N'380010217')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'39217', N'Cervantes M.', N'Perón 38', CAST(N'1952-02-29T00:00:00.000' AS DateTime), N'M', N'440294390')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'59076', N'Miller B.', N'López de Hoyos 2', CAST(N'1945-09-16T00:00:00.000' AS DateTime), N'F', N'311969044')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'63827', N'Ruiz P.', N'Ezquerdo 103', CAST(N'1980-12-26T00:00:00.000' AS DateTime), N'M', N'100973253')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'64823', N'Fraiser A.', N'Soto 3', CAST(N'1980-07-10T00:00:00.000' AS DateTime), N'F', N'285201776')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'74835', N'Benítez E.', N'Argentina', CAST(N'1957-10-05T00:00:00.000' AS DateTime), N'M', N'154811767')
GO
INSERT [dbo].[HOSPITAL] ([HOSPITAL_COD], [NOMBRE], [DIRECCION], [TELEFONO], [NUM_CAMA]) VALUES (N'19', N'Provincial', N'O'' Donell 50', N'964-4256', N'502')
INSERT [dbo].[HOSPITAL] ([HOSPITAL_COD], [NOMBRE], [DIRECCION], [TELEFONO], [NUM_CAMA]) VALUES (N'18', N'General', N'Atocha s/n', N'595-3111', N'987')
INSERT [dbo].[HOSPITAL] ([HOSPITAL_COD], [NOMBRE], [DIRECCION], [TELEFONO], [NUM_CAMA]) VALUES (N'22', N'La Paz', N'Castellana 1000', N'923-5411', N'412')
INSERT [dbo].[HOSPITAL] ([HOSPITAL_COD], [NOMBRE], [DIRECCION], [TELEFONO], [NUM_CAMA]) VALUES (N'45', N'San Carlos', N'Ciudad Univeritaria', N'597-1500', N'845')
INSERT [dbo].[HOSPITAL] ([HOSPITAL_COD], [NOMBRE], [DIRECCION], [TELEFONO], [NUM_CAMA]) VALUES (N'17', N'Ruber', N'Juan Bravo, 49', N'91-4027100', N'217')
GO
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (10995, 19, 6, 1)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (18004, 19, 3, 2)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (14024, 19, 6, 3)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (36658, 18, 4, 1)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (38702, 18, 4, 2)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (39217, 22, 1, 1)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (59076, 22, 6, 2)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (63827, 22, 6, 3)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (64882, 22, 2, 1)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (78955, 45, 2, 1)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (56233, 45, 1, 2)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (59877, 17, 6, 5)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (65231, 17, 3, 9)
GO
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (N'22', N'6', N'1009', N'Higueras D.', N'Enfermera', N'T', N'200500')
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (N'45', N'4', N'1280', N'Amigo R.', N'Interino', N'N', N'221000')
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (N'19', N'6', N'3106', N'Hernández J.', N'Enfermero', N'T', N'275000')
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (N'19', N'6', N'3754', N'Díaz B.', N'Enfermera', N'T', N'226200')
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (N'22', N'1', N'6065', N'Rivera G.', N'Enfermera', N'N', N'162600')
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (N'18', N'4', N'6357', N'Karplus W.', N'Interino', N'T', N'337900')
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (N'22', N'1', N'7379', N'Carlos R.', N'Enfermera', N'T', N'211900')
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (N'22', N'6', N'8422', N'Bocina G.', N'Enfermero', N'M', N'183800')
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (N'45', N'1', N'8526', N'Frank H.', N'Enfermera', N'T', N'252200')
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (N'22', N'2', N'9901', N'Núñez C.', N'Interino', N'M', N'221000')
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (N'17', N'6', N'8521', N'Palomo C.', N'Interino', N'M', N'219000')
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (N'17', N'1', N'8520', N'Cortes V.', N'Enfermera', N'N', N'189500')
GO
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'19', N'3', N'Cuidados Intensivos', N'21')
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'19', N'6', N'Psiquiátricos', N'67')
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'18', N'3', N'Cuidados Intensivos', N'10')
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'18', N'4', N'Cardiología', N'53')
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'22', N'1', N'Recuperación', N'10')
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'22', N'6', N'Psiquiátricos', N'118')
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'22', N'2', N'Maternidad', N'34')
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'45', N'4', N'Cardiología', N'55')
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'45', N'1', N'Recuperación', N'15')
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'45', N'2', N'Maternidad', N'24')
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'17', N'6', N'Psiquiátricos', N'220')
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'17', N'1', N'Recuperación', N'20')
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (N'17', N'2', N'Maternidad', N'21')
GO
SET IDENTITY_INSERT [dbo].[SOLICITUDESALUMNOSBI] ON 

INSERT [dbo].[SOLICITUDESALUMNOSBI] ([IDUSUARIO], [NOMBRE], [EMAIL], [DIRECCION], [DNI], [FECHAREGISTRO], [IDCURSO]) VALUES (1, N'CARLOS CSS', N'Carlos123@css.com', N'Calle Arcadia 108', N'34342    ', NULL, 4)
INSERT [dbo].[SOLICITUDESALUMNOSBI] ([IDUSUARIO], [NOMBRE], [EMAIL], [DIRECCION], [DNI], [FECHAREGISTRO], [IDCURSO]) VALUES (2, N'Charles styles', N'vorasito@gamil.com', N'Calle loca', N'211212   ', NULL, 3)
SET IDENTITY_INSERT [dbo].[SOLICITUDESALUMNOSBI] OFF
GO
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [DNI], [DIRECCION], [TELEFONO], [EMAIL], [SALT], [PASSWORD]) VALUES (1, N'Javier Pantoja', N'2323241L', N'Calle Jupiter 23', N'2324242', N'javier@admin.com', NULL, NULL)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [DNI], [DIRECCION], [TELEFONO], [EMAIL], [SALT], [PASSWORD]) VALUES (2, N'Juan Costilla', N'2323212P', N'Avenida America 23', N'6823287', N'Juanito@correo.es', NULL, NULL)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [DNI], [DIRECCION], [TELEFONO], [EMAIL], [SALT], [PASSWORD]) VALUES (3, N'Sergio Fantasci', N'0832392A', N'Avenida Mar Egeo 2', N'8349934', N'SergiF@correo.es', NULL, NULL)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [DNI], [DIRECCION], [TELEFONO], [EMAIL], [SALT], [PASSWORD]) VALUES (4, N'Irene Iwi', N'2136283K', N'Calle Monroe', N'7382228', N'iwi@correo.es', NULL, NULL)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [DNI], [DIRECCION], [TELEFONO], [EMAIL], [SALT], [PASSWORD]) VALUES (5, N'Luka Donx', N'563273', N'Calle Nba', N'67323223', N'luka@mavs.nba', N'jsadk283', 0x63006F006E00740072006100)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [DNI], [DIRECCION], [TELEFONO], [EMAIL], [SALT], [PASSWORD]) VALUES (6, N'Javi', N'123456', N'calle falsa', N'12345', N'cientificodebanco@gmail.com', N'ëj°8áÈª+tî?+ö¤Õå°^¬Ý«;ÑDçCõIîÞp±ÜyîXs×ýÚ', 0xB71408D29B9D0638F81BF3560B9CD946B85442EA0427FE1E1F11862A37D41ADC65946D04B2FB2F55CF2F59BADD7411CD753817A84009350BC012A5A5FEF9F77E)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [DNI], [DIRECCION], [TELEFONO], [EMAIL], [SALT], [PASSWORD]) VALUES (7, N'Javo', N'123456', N'Calle Alfonso Perez', N'80233', N'javo@javo.es', N'fî-bH5~Î]W*9×n8 ¹Rêè]*ZÀæg¯Cëi¼	Dóe-y', 0xD02B2F1C099D10C0C09405DBD0F52A0A7B7A7252D6DF6CB12AA838C1E28417E207F47CA35CBFD8488841169A1CAF4E1D596321BD42EBAEFED4F94C4D7878E72D)
GO
INSERT [dbo].[VENTAS] ([IDVENTA], [IDZAPATILLA], [IDUSUARIO], [NUMEROCOMPROBANTE], [FECHA], [IMPUESTO], [TOTAL], [NOMBREZAPATILLA]) VALUES (1, 1, 2, N'111', CAST(N'2023-02-12T00:00:00.000' AS DateTime), 40, 139, NULL)
INSERT [dbo].[VENTAS] ([IDVENTA], [IDZAPATILLA], [IDUSUARIO], [NUMEROCOMPROBANTE], [FECHA], [IMPUESTO], [TOTAL], [NOMBREZAPATILLA]) VALUES (2, 2, 3, N'222', CAST(N'2022-12-22T00:00:00.000' AS DateTime), 30, 150, NULL)
INSERT [dbo].[VENTAS] ([IDVENTA], [IDZAPATILLA], [IDUSUARIO], [NUMEROCOMPROBANTE], [FECHA], [IMPUESTO], [TOTAL], [NOMBREZAPATILLA]) VALUES (3, 3, 4, N'333', CAST(N'2021-03-24T00:00:00.000' AS DateTime), 40, 110, NULL)
GO
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (1, 1, N' UNDER ARMOUR LOCKDOWN 6', CAST(45.00 AS Decimal(10, 2)), 30, N'Zapatillas UnderArmor', N'https://underarmourcol.vtexassets.com/arquivos/ids/514259/3025616-600_RE9_2.png?v=638007680475200000', CAST(99.99 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (2, 1, N'NIKE PERFORMANCE KD 4', CAST(45.00 AS Decimal(10, 2)), 45, N'Zapatillas Nike KD, gama alta', N'https://static.runnea.com/images/prices/sneakers-nike-air-jordan-legacy-312-nike-10013733638.png', CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (3, 1, N'Jordan Whynot? Zero.2', CAST(43.00 AS Decimal(10, 2)), 70, N'Zapatillas Jordan usadas por Russel WestBrook', N'https://sportforme.com/userfiles/productlargeimages/product_51543.jpg', CAST(72.50 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (4, 1, N'Adidas Dame 5 ', CAST(44.50 AS Decimal(10, 2)), 100, N'Zapatillas Adidas edicion Damian Lillard', N'https://www.madbasket.com/10878/adidas-dame-8-j-chinese-new-year.jpg', CAST(85.70 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (5, 2, N'Adidas Predator', CAST(42.50 AS Decimal(10, 2)), 20, N'Una de las botas más iconicas de esta epoca', N'https://soccerstorecore.azureedge.net/0-0-116557.png', CAST(70.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (6, 2, N'Nike Mercurial Prototype', CAST(41.00 AS Decimal(10, 2)), 6, N'Un clasico del modernismo futbolístico', N'https://storage.googleapis.com/ssr_mx/products/688fd87ba77c0a202eb0b01691f88abb.jpg', CAST(130.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (7, 2, N'Nike Performance 3', CAST(42.00 AS Decimal(10, 2)), 200, N'Una de las botas más usadas  hoy en dia', N'https://www.noticiasdevaldemoro.es/wp-content/uploads/2022/11/botas-futbol-nike-506auk.png', CAST(55.60 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (8, 2, N'Puma Future Match', CAST(43.50 AS Decimal(10, 2)), 45, N'El mejor modelo actualmente de puma', N'https://soccerstorecore.azureedge.net/0-0-131251.png', CAST(79.90 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (9, 3, N'Vans OldSkul', CAST(42.00 AS Decimal(10, 2)), 230, N'Las zapatillas de los skaters ', N'https://www.43einhalb.com/media/324252/w/1080/h/1080/n/vans-vn0a4bw3ks71-old-skool-36-d-1.png', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (10, 3, N'DC SHOES PURE', CAST(43.50 AS Decimal(10, 2)), 102, N'Un clasico, no te las pierdas', N'https://ethletic.com/wp-content/uploads/2023/03/65000_247247_00288.png', CAST(455.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (11, 3, N'Nike SB 3', CAST(42.00 AS Decimal(10, 2)), 60, N'Comodas, bonitas y perfectas para hacer skate', N'https://static.runnea.com/images/201708/nike_janoski_negro_grande.png?0', CAST(63.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (12, 3, N'Nike Dunk Low', CAST(43.00 AS Decimal(10, 2)), 23, N'Una de las zapas mas usadas por los skaters', N'https://static.sneakerjagers.com/p/hmF1LB7bhYam7eULsb0psSLXdlVLMu0SGJO0JXJb.png', CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (13, 4, N'Jordan 1 MidNight', CAST(44.00 AS Decimal(10, 2)), 20, N'Dejate enamorar por esta maravilla', N'https://cdn.restocks.net/cdn-cgi/image/width=1000/storage/images/products/DD9315-104/1.png', CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (14, 4, N'Jordan 4 Travis Scott', CAST(42.00 AS Decimal(10, 2)), 2, N'No hace falta descripcion para estas', N'https://platano-sneakers.es/wp-content/uploads/2022/09/air-jordan-4-retro-military-black-1-1000.png', CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (15, 4, N'Nike A1 Cactus Jack', CAST(41.00 AS Decimal(10, 2)), 4, N'El hype hecho zapatilla', N'https://www.logistun.es/wp-content/uploads/2022/10/nike-jordan-1-576gff.png', CAST(349.99 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (16, 4, N'Adidas Yeezy 10', CAST(43.50 AS Decimal(10, 2)), 10, N'Adquiere estas zapatillas historicas', N'https://platano-sneakers.es/wp-content/uploads/2022/10/adidas-yeezy-boost-350-v2-sulfur-1-1000.png', CAST(593.90 AS Decimal(10, 2)))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UNIQUE_DNI]    Script Date: 27/03/2023 12:12:45 ******/
ALTER TABLE [dbo].[SOLICITUDESALUMNOSBI] ADD  CONSTRAINT [UNIQUE_DNI] UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SOLICITUDESALUMNOSBI]  WITH CHECK ADD  CONSTRAINT [FK_SOLICITUDESBI_CURSOSBI] FOREIGN KEY([IDCURSO])
REFERENCES [dbo].[CURSOSBI] ([IDCURSO])
GO
ALTER TABLE [dbo].[SOLICITUDESALUMNOSBI] CHECK CONSTRAINT [FK_SOLICITUDESBI_CURSOSBI]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_USUARIOS] FOREIGN KEY([IDUSUARIO])
REFERENCES [dbo].[USUARIOS] ([IDUSUARIO])
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_VENTAS_USUARIOS]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_ZAPATILLAS] FOREIGN KEY([IDZAPATILLA])
REFERENCES [dbo].[ZAPATILLAS] ([IDZAPATILLA])
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_VENTAS_ZAPATILLAS]
GO
ALTER TABLE [dbo].[ZAPATILLAS]  WITH CHECK ADD  CONSTRAINT [FK_ZAPATILLAS_CATEGORIA] FOREIGN KEY([IDCATEGORIA])
REFERENCES [dbo].[CATEGORIA] ([IDCATEGORIA])
GO
ALTER TABLE [dbo].[ZAPATILLAS] CHECK CONSTRAINT [FK_ZAPATILLAS_CATEGORIA]
GO
/****** Object:  StoredProcedure [dbo].[SP_GETZAPATILLASID]    Script Date: 27/03/2023 12:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GETZAPATILLASID](@IDZAPATILLA INT)
AS
	SELECT NOMBRE FROM ZAPATILLAS WHERE IDZAPATILLA = @IDZAPATILLA
GO
/****** Object:  StoredProcedure [dbo].[SP_INCREMENTO_SALARIO_EMP]    Script Date: 27/03/2023 12:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_INCREMENTO_SALARIO_EMP](@APELLIDO NVARCHAR(30),@INCREMENTO INT) 
AS 
	UPDATE EMP SET SALARIO = SALARIO + @INCREMENTO
	WHERE APELLIDO = @APELLIDO
GO
ALTER DATABASE [AZURETAJAMAR] SET  READ_WRITE 
GO
