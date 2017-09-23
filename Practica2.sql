USE [Practica2]
GO
/****** Object:  Database [Practica2]    Script Date: 19/09/2017 07:45:28 p.m. 
******/
USE [Practica2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica2', FILENAME = N'C:\Program Files (x86)\Microsoft SQL 
Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Practica2.mdf' , SIZE = 5120KB , 

MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Practica2_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL 
Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Practica2_log.ldf' , SIZE = 2048KB , 

MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Practica2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practica2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Practica2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Practica2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Practica2] SET  MULTI_USER 
GO
ALTER DATABASE [Practica2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica2] SET FILESTREAM( NON_TRANSACTED_ACCESS = 

OFF ) 
GO
ALTER DATABASE [Practica2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Practica2]
GO
/****** Object:  Table [dbo].[Alumno]     Script Date: 19/09/2017 07:45:28 p.m. 
******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Apellidos] [varchar](30) NOT NULL,
  	[Fecha_nacimiento][date] NOT NULL,
  	[Dirección][varchar](15) NOT NULL,
 	[Matricula][int] NOT NULL,
  	[Materias][varchar](15) NOT NULL,
  	[Maestros][varchar](15) NOT NULL,
  	[Carrera][varchar](15) NOT NULL,
 	[Matricula][int] NOT NULL,
  	[Horario][varchar](10) NOT NULL,
  	[Correo electronico][varchar](10) NOT NULL,
  	[Facultad][varchar](10) NOT NULL,
  	[Fecha_nacimiento]  AS (datediff(year,getdate(),[Fecha_nacimiento]))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 19/09/2017 
07:51:28 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Matricula](
	[Id] [uniqueidentifier] NOT NULL,
	[usuario] [varchar](20) NOT NULL,
	[contraseña] [varchar](20) NOT NULL,
	[nombre] [varchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 19/09/2017 
07:51:28 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[Id] [uniqueidentifier] NOT NULL,
	[Matutino] [varchar](10) NULL,
	[Vespertino] [varchar](10) NULL,
	[Nocturno] [varchar](10) NULL,
	[VentasTotales] [int] NOT NULL,
	[Comisiones] [int] NOT NULL,
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Facultad]    Script Date: 19/09/2017 
7:51:28 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Facultad](
	[Id] [uniqueidentifier] NOT NULL,
	[Edificios] [int] NOT NULL,
	[Aula] [int] NOT NULL,
	[Biblioteca] [varchar](15) NOT NULL,
	[Maestros] [varchar](15) NOT NULL,
	[Carreras] [varchar](15) NOT NULL,
	[Semestres] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 19/09/2017 
07:51:28 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](15) NOT NULL,
	[Apellidos] [varchar](15) NOT NULL,
	[Dirección] [varchar](15) NOT NULL,
	[Telefono] [int] NOT NULL,
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 
19/09/2017 07:51:28 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Facturas](
	[Id] [uniqueidentifier] NOT NULL,
	[Fecha] [date] NOT NULL,
	[id_clientes] [int] NOT NULL,
	[Fecha] AS (datediff(year,getdate(),[Fecha]))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 19/09/2017 
07:51:28 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [uniqueidentifier] NOT NULL,
	[id_facturas] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Practica2] SET  READ_WRITE 
GO
