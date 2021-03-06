USE [master]
GO
/****** Object:  Database [CINE_DB]    Script Date: 13/10/2017 03:08:59 p.m. ******/
CREATE DATABASE [CINE_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CINE_DB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CINE_DB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CINE_DB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CINE_DB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CINE_DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CINE_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CINE_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CINE_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CINE_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CINE_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CINE_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CINE_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CINE_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CINE_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CINE_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CINE_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CINE_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CINE_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CINE_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CINE_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CINE_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CINE_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CINE_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CINE_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CINE_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CINE_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CINE_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CINE_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CINE_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CINE_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CINE_DB] SET  MULTI_USER 
GO
ALTER DATABASE [CINE_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CINE_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CINE_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CINE_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CINE_DB]
GO
/****** Object:  Table [dbo].[Boleto]    Script Date: 13/10/2017 03:08:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Boleto](
	[ID_Boleto] [uniqueidentifier] NOT NULL,
	[ID_Cartelera] [uniqueidentifier] NOT NULL,
	[Num_Asiento] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Boleto] PRIMARY KEY CLUSTERED 
(
	[ID_Boleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cartelera]    Script Date: 13/10/2017 03:08:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cartelera](
	[ID_Cartelera] [uniqueidentifier] NOT NULL,
	[ID_Sala] [uniqueidentifier] NOT NULL,
	[ID_Pelicula] [uniqueidentifier] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora_Inicio] [time](7) NOT NULL,
	[Hora_final] [time](7) NOT NULL,
 CONSTRAINT [PK_Cartelera] PRIMARY KEY CLUSTERED 
(
	[ID_Cartelera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genero]    Script Date: 13/10/2017 03:08:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genero](
	[ID_genero] [uniqueidentifier] NOT NULL,
	[genero] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[ID_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 13/10/2017 03:08:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pelicula](
	[ID_Pelicula] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Sinopsis] [varchar](50) NOT NULL,
	[Duracion] [time](7) NOT NULL,
	[ID_genero] [uniqueidentifier] NOT NULL,
	[Clasificacion] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Pelicula] PRIMARY KEY CLUSTERED 
(
	[ID_Pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Posicion]    Script Date: 13/10/2017 03:08:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Posicion](
	[ID_Posición] [uniqueidentifier] NOT NULL,
	[ID_trabajador] [uniqueidentifier] NOT NULL,
	[Posicion] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Relacion_Venta_Boleto]    Script Date: 13/10/2017 03:08:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relacion_Venta_Boleto](
	[ID_RelacionVentaBoleto] [uniqueidentifier] NOT NULL,
	[ID_Boleto] [uniqueidentifier] NOT NULL,
	[ID_VentaMostrador] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Relacion_Venta_Boleto] PRIMARY KEY CLUSTERED 
(
	[ID_RelacionVentaBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sala]    Script Date: 13/10/2017 03:08:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sala](
	[ID_Sala] [uniqueidentifier] NOT NULL,
	[Num_Asiento] [varchar](10) NOT NULL,
	[Precio] [int] NOT NULL,
	[Tipo_sala] [varchar](50) NOT NULL,
	[ID_sucursal] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Sala] PRIMARY KEY CLUSTERED 
(
	[ID_Sala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 13/10/2017 03:08:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursal](
	[ID_Sucursal] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Direccion] [varchar](20) NOT NULL,
	[telefono] [varchar](15) NOT NULL,
	[ID_Cartelera] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[ID_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trabajador]    Script Date: 13/10/2017 03:08:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trabajador](
	[ID_Trabajador] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Edad] [int] NOT NULL,
	[ID_sucursal] [uniqueidentifier] NOT NULL,
	[ID_posicion] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Trabajador] PRIMARY KEY CLUSTERED 
(
	[ID_Trabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta_Mostrador]    Script Date: 13/10/2017 03:08:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta_Mostrador](
	[ID_VentaMostrador] [uniqueidentifier] NOT NULL,
	[Fecha] [date] NOT NULL,
	[ID_sucursal] [uniqueidentifier] NOT NULL,
	[ID_Trabajador] [uniqueidentifier] NOT NULL,
	[Total_Precio] [int] NOT NULL,
 CONSTRAINT [PK_Venta_Mostrador] PRIMARY KEY CLUSTERED 
(
	[ID_VentaMostrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Cartelera] FOREIGN KEY([ID_Cartelera])
REFERENCES [dbo].[Cartelera] ([ID_Cartelera])
GO
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Cartelera]
GO
ALTER TABLE [dbo].[Cartelera]  WITH CHECK ADD  CONSTRAINT [FK_Cartelera_Pelicula] FOREIGN KEY([ID_Pelicula])
REFERENCES [dbo].[Pelicula] ([ID_Pelicula])
GO
ALTER TABLE [dbo].[Cartelera] CHECK CONSTRAINT [FK_Cartelera_Pelicula]
GO
ALTER TABLE [dbo].[Cartelera]  WITH CHECK ADD  CONSTRAINT [FK_Cartelera_Sala] FOREIGN KEY([ID_Sala])
REFERENCES [dbo].[Sala] ([ID_Sala])
GO
ALTER TABLE [dbo].[Cartelera] CHECK CONSTRAINT [FK_Cartelera_Sala]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Genero] FOREIGN KEY([ID_genero])
REFERENCES [dbo].[Genero] ([ID_genero])
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [FK_Pelicula_Genero]
GO
ALTER TABLE [dbo].[Posicion]  WITH CHECK ADD  CONSTRAINT [FK_Posicion_Trabajador] FOREIGN KEY([ID_trabajador])
REFERENCES [dbo].[Trabajador] ([ID_Trabajador])
GO
ALTER TABLE [dbo].[Posicion] CHECK CONSTRAINT [FK_Posicion_Trabajador]
GO
ALTER TABLE [dbo].[Posicion]  WITH CHECK ADD  CONSTRAINT [FK_Posicion_Trabajador1] FOREIGN KEY([ID_Posición])
REFERENCES [dbo].[Trabajador] ([ID_Trabajador])
GO
ALTER TABLE [dbo].[Posicion] CHECK CONSTRAINT [FK_Posicion_Trabajador1]
GO
ALTER TABLE [dbo].[Relacion_Venta_Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Relacion_Venta_Boleto_Boleto] FOREIGN KEY([ID_Boleto])
REFERENCES [dbo].[Boleto] ([ID_Boleto])
GO
ALTER TABLE [dbo].[Relacion_Venta_Boleto] CHECK CONSTRAINT [FK_Relacion_Venta_Boleto_Boleto]
GO
ALTER TABLE [dbo].[Relacion_Venta_Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Relacion_Venta_Boleto_Venta_Mostrador] FOREIGN KEY([ID_VentaMostrador])
REFERENCES [dbo].[Venta_Mostrador] ([ID_VentaMostrador])
GO
ALTER TABLE [dbo].[Relacion_Venta_Boleto] CHECK CONSTRAINT [FK_Relacion_Venta_Boleto_Venta_Mostrador]
GO
ALTER TABLE [dbo].[Sala]  WITH CHECK ADD  CONSTRAINT [FK_Sala_Sucursal] FOREIGN KEY([ID_sucursal])
REFERENCES [dbo].[Sucursal] ([ID_Sucursal])
GO
ALTER TABLE [dbo].[Sala] CHECK CONSTRAINT [FK_Sala_Sucursal]
GO
ALTER TABLE [dbo].[Trabajador]  WITH CHECK ADD  CONSTRAINT [FK_Trabajador_Sucursal] FOREIGN KEY([ID_sucursal])
REFERENCES [dbo].[Sucursal] ([ID_Sucursal])
GO
ALTER TABLE [dbo].[Trabajador] CHECK CONSTRAINT [FK_Trabajador_Sucursal]
GO
ALTER TABLE [dbo].[Venta_Mostrador]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Mostrador_Sucursal] FOREIGN KEY([ID_sucursal])
REFERENCES [dbo].[Sucursal] ([ID_Sucursal])
GO
ALTER TABLE [dbo].[Venta_Mostrador] CHECK CONSTRAINT [FK_Venta_Mostrador_Sucursal]
GO
USE [master]
GO
ALTER DATABASE [CINE_DB] SET  READ_WRITE 
GO
