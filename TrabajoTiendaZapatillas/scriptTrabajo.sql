USE [master]
GO
/****** Object:  Database [ZAPATILLAS]    Script Date: 03/03/2023 11:37:58 ******/
CREATE DATABASE [ZAPATILLAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ZAPATILLAS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DESARROLLO\MSSQL\DATA\ZAPATILLAS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ZAPATILLAS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DESARROLLO\MSSQL\DATA\ZAPATILLAS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ZAPATILLAS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZAPATILLAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ZAPATILLAS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ZAPATILLAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ZAPATILLAS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ZAPATILLAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ZAPATILLAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ZAPATILLAS] SET  MULTI_USER 
GO
ALTER DATABASE [ZAPATILLAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ZAPATILLAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ZAPATILLAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ZAPATILLAS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ZAPATILLAS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ZAPATILLAS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ZAPATILLAS] SET QUERY_STORE = ON
GO
ALTER DATABASE [ZAPATILLAS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ZAPATILLAS]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 03/03/2023 11:37:58 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 03/03/2023 11:37:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[IDROL] [int] NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[DESCRIPCION] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ROL] PRIMARY KEY CLUSTERED 
(
	[IDROL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 03/03/2023 11:37:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[IDUSUARIO] [int] NOT NULL,
	[IDROL] [int] NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[DNI] [nvarchar](9) NOT NULL,
	[DIRECCION] [nvarchar](50) NOT NULL,
	[TELEFONO] [nvarchar](50) NOT NULL,
	[EMAIL] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[IDUSUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTAS]    Script Date: 03/03/2023 11:37:58 ******/
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
 CONSTRAINT [PK_VENTAS] PRIMARY KEY CLUSTERED 
(
	[IDVENTA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZAPATILLAS]    Script Date: 03/03/2023 11:37:58 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CATEGORIA] ([IDCATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (1, N'Basketball', N'Zapatillas destinadas a practicar basket')
INSERT [dbo].[CATEGORIA] ([IDCATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (2, N'Futbol', N'Zapatillas destinadas para practicar futbol')
INSERT [dbo].[CATEGORIA] ([IDCATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (3, N'Skate', N'Zapatillas destinadas para practicar skate')
INSERT [dbo].[CATEGORIA] ([IDCATEGORIA], [NOMBRE], [DESCRIPCION]) VALUES (4, N'Premium', N'Las zapatillas de más alta gama para los hype-beast')
GO
INSERT [dbo].[ROL] ([IDROL], [NOMBRE], [DESCRIPCION]) VALUES (1, N'Administrador', N'Tiene todos los permisos')
INSERT [dbo].[ROL] ([IDROL], [NOMBRE], [DESCRIPCION]) VALUES (2, N'Usuario', N'Solo puede comprar zapatillas')
GO
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [IDROL], [NOMBRE], [DNI], [DIRECCION], [TELEFONO], [EMAIL]) VALUES (1, 1, N'Javier Pantoja', N'2323241L', N'Calle Jupiter 23', N'2324242', N'javier@admin.com')
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [IDROL], [NOMBRE], [DNI], [DIRECCION], [TELEFONO], [EMAIL]) VALUES (2, 2, N'Juan Costilla', N'2323212P', N'Avenida America 23', N'6823287', N'Juanito@correo.es')
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [IDROL], [NOMBRE], [DNI], [DIRECCION], [TELEFONO], [EMAIL]) VALUES (3, 2, N'Sergio Fantasci', N'0832392A', N'Avenida Mar Egeo 2', N'8349934', N'SergiF@correo.es')
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [IDROL], [NOMBRE], [DNI], [DIRECCION], [TELEFONO], [EMAIL]) VALUES (4, 2, N'Irene Iwi', N'2136283K', N'Calle Monroe', N'7382228', N'iwi@correo.es')
GO
INSERT [dbo].[VENTAS] ([IDVENTA], [IDZAPATILLA], [IDUSUARIO], [NUMEROCOMPROBANTE], [FECHA], [IMPUESTO], [TOTAL]) VALUES (1, 1, 2, N'111', CAST(N'2023-02-12T00:00:00.000' AS DateTime), 40, 139)
INSERT [dbo].[VENTAS] ([IDVENTA], [IDZAPATILLA], [IDUSUARIO], [NUMEROCOMPROBANTE], [FECHA], [IMPUESTO], [TOTAL]) VALUES (2, 2, 3, N'222', CAST(N'2022-12-22T00:00:00.000' AS DateTime), 30, 150)
INSERT [dbo].[VENTAS] ([IDVENTA], [IDZAPATILLA], [IDUSUARIO], [NUMEROCOMPROBANTE], [FECHA], [IMPUESTO], [TOTAL]) VALUES (3, 3, 4, N'333', CAST(N'2021-03-24T00:00:00.000' AS DateTime), 40, 110)
GO
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (1, 1, N' UNDER ARMOUR LOCKDOWN 6', CAST(45.00 AS Decimal(10, 2)), 30, N'Zapatillas UnderArmor', N'red-black.jpg', CAST(99.99 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (2, 1, N'NIKE PERFORMANCE KD 4', CAST(45.00 AS Decimal(10, 2)), 45, N'Zapatillas Nike KD, gama alta', N'nikeKd.jpg', CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (3, 1, N'Jordan Whynot? Zero.2', CAST(43.00 AS Decimal(10, 2)), 70, N'Zapatillas Jordan usadas por Russel WestBrook', N'whynot.jpg', CAST(72.50 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (4, 1, N'Adidas Dame 5 ', CAST(44.50 AS Decimal(10, 2)), 100, N'Zapatillas Adidas edicion Damian Lillard', N'damian.jpg', CAST(85.70 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (5, 2, N'Adidas Predator', CAST(42.50 AS Decimal(10, 2)), 20, N'Una de las botas más iconicas de esta epoca', N'predator.jpg', CAST(70.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (6, 2, N'Nike Mercurial Prototype', CAST(41.00 AS Decimal(10, 2)), 6, N'Un clasico del modernismo futbolístico', N'mercurial.jpg', CAST(130.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (7, 2, N'Nike Performance 3', CAST(42.00 AS Decimal(10, 2)), 200, N'Una de las botas más usadas  hoy en dia', N'nikePerf.jpg', CAST(55.60 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (8, 2, N'Puma Future Match', CAST(43.50 AS Decimal(10, 2)), 45, N'El mejor modelo actualmente de puma', N'puma.jpg', CAST(79.90 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (9, 3, N'Vans OldSkul', CAST(42.00 AS Decimal(10, 2)), 230, N'Las zapatillas de los skaters ', N'vansOLSKUL.jpg', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (10, 3, N'DC SHOES PURE', CAST(43.50 AS Decimal(10, 2)), 102, N'Un clasico, no te las pierdas', N'Dc.jpg', CAST(455.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (11, 3, N'Nike SB 3', CAST(42.00 AS Decimal(10, 2)), 60, N'Comodas, bonitas y perfectas para hacer skate', N'NikeSB.jpg', CAST(63.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (12, 3, N'Nike Dunk Low', CAST(43.00 AS Decimal(10, 2)), 23, N'Una de las zapas mas usadas por los skaters', N'NikeDunk.jpg', CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (13, 4, N'Jordan 1 MidNight', CAST(44.00 AS Decimal(10, 2)), 20, N'Dejate enamorar por esta maravilla', N'Air1.jpg', CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (14, 4, N'Jordan 4 Travis Scott', CAST(42.00 AS Decimal(10, 2)), 2, N'No hace falta descripcion para estas', N'travis.jpg', CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (15, 4, N'Nike A1 Cactus Jack', CAST(41.00 AS Decimal(10, 2)), 4, N'El hype hecho zapatilla', N'a1cactus.jpg', CAST(349.99 AS Decimal(10, 2)))
INSERT [dbo].[ZAPATILLAS] ([IDZAPATILLA], [IDCATEGORIA], [NOMBRE], [TALLA], [UNIDADESTOCK], [DESCRIPCION], [IMAGEN], [PRECIO]) VALUES (16, 4, N'Adidas Yeezy 10', CAST(43.50 AS Decimal(10, 2)), 10, N'Adquiere estas zapatillas historicas', N'yeez.jpg', CAST(593.90 AS Decimal(10, 2)))
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD  CONSTRAINT [FK_USUARIOS_ROL] FOREIGN KEY([IDROL])
REFERENCES [dbo].[ROL] ([IDROL])
GO
ALTER TABLE [dbo].[USUARIOS] CHECK CONSTRAINT [FK_USUARIOS_ROL]
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
USE [master]
GO
ALTER DATABASE [ZAPATILLAS] SET  READ_WRITE 
GO
