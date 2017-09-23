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
  [Fecha_nacimiento]  AS (datediff(year,getdate(),[FechadeIngreso]))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DepartamentoAsignado]    Script Date: 19/09/2017 

01:11:28 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DepartamentoAsignado](
	[Id] [uniqueidentifier] NOT NULL,
	[RH] [varchar](20) NOT NULL,
	[Ventas] [varchar](20) NOT NULL,
	[IyD] [varchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nominasenlaempresa]    Script Date: 09/09/2017 

01:11:28 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nominasenlaempresa](
	[Id] [uniqueidentifier] NOT NULL,
	[Sueldo] [int] NOT NULL,
	[VentasTotales] [int] NOT NULL,
	[Comisiones] [int] NOT NULL,
	[SueldoTotal]  AS ([Sueldo]+[Ventastotales]*[Comisiones])
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NumeroSeguroSocialNSS]    Script Date: 09/09/2017 

01:11:28 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NumeroSeguroSocialNSS](
	[Id] [uniqueidentifier] NOT NULL,
	[NSS] [int] NOT NULL,
	[ClinicaDeAdscripcion] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PeriododeVacaciones]    Script Date: 09/09/2017 

01:11:28 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriododeVacaciones](
	[Id] [uniqueidentifier] NOT NULL,
	[Inicio] [date] NOT NULL,
	[Fin] [date] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TiendaAsignadaactualmente]    Script Date: 

09/09/2017 01:11:28 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiendaAsignadaactualmente](
	[Id] [uniqueidentifier] NOT NULL,
	[Ciudad] [varchar](20) NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[Pais] [varchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trabajadoreenlaempresa]    Script Date: 09/09/2017 

01:11:28 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trabajadoreenlaempresa](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Edad] [int] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[EdadActual]  AS (datediff(year,getdate(),[FechaNacimiento]))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Practica2_Sabado_10_12_Renacida] SET  READ_WRITE 
GO

CREATE TABLE Alumno (
  ID_ALUMNO VARCHAR NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR NULL,
  Apellido VARCHAR NULL,
  Fecha_nacimiento VARCHAR NULL,
  Dirección VARCHAR NULL,
  Matricula INT NULL,
  Materias VARCHAR NULL,
  Maestros VARCHAR NULL,
  Carrera VARCHAR NULL,
  Edad INT NULL,
  Horario VARCHAR NULL,
  Correo electronico VARCHAR NULL,
  Facultad VARCHAR NULL,
  PRIMARY KEY(ID_ALUMNO)
);

CREATE TABLE Clientes (
  idClientes INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR NULL,
  Apellidos VARCHAR NULL,
  Dirección VARCHAR NULL,
  Telefono INT NULL,
  PRIMARY KEY(idClientes)
);

CREATE TABLE Clientes_has_Facturas (
  Clientes_idClientes INT NOT NULL,
  Facturas_idFacturas VARCHAR NOT NULL,
  PRIMARY KEY(Clientes_idClientes, Facturas_idFacturas),
  INDEX Clientes_has_Facturas_FKIndex1(Clientes_idClientes),
  INDEX Clientes_has_Facturas_FKIndex2(Facturas_idFacturas)
);

CREATE TABLE Facturas (
  idFacturas VARCHAR NOT NULL AUTO_INCREMENT,
  Fecha VARCHAR NULL,
  id_clientes INT NULL,
  PRIMARY KEY(idFacturas)
);

CREATE TABLE Facturas_has_Ventas (
  Facturas_idFacturas VARCHAR NOT NULL,
  Ventas_idVentas INT NOT NULL,
  PRIMARY KEY(Facturas_idFacturas, Ventas_idVentas),
  INDEX Facturas_has_Ventas_FKIndex1(Facturas_idFacturas),
  INDEX Facturas_has_Ventas_FKIndex2(Ventas_idVentas)
);

CREATE TABLE Facultad (
  idFacultad VARCHAR NOT NULL AUTO_INCREMENT,
  Alumno_ID_ALUMNO VARCHAR NOT NULL,
  Biblioteca VARCHAR NULL,
  Edificios VARCHAR NULL,
  Dirección VARCHAR NULL,
  Maestros VARCHAR NULL,
  Carreras VARCHAR NULL,
  Semestres INT NULL,
  PRIMARY KEY(idFacultad, Alumno_ID_ALUMNO),
  INDEX Facultad_FKIndex1(Alumno_ID_ALUMNO)
);

CREATE TABLE Horario (
  Matutino VARCHAR NOT NULL AUTO_INCREMENT,
  Alumno_ID_ALUMNO VARCHAR NOT NULL,
  Vespertino VARCHAR NULL,
  Nocturna VARCHAR NULL,
  PRIMARY KEY(Matutino),
  INDEX Horario_FKIndex1(Alumno_ID_ALUMNO)
);

CREATE TABLE Matricula (
  Usuario INT NOT NULL AUTO_INCREMENT,
  Alumno_ID_ALUMNO VARCHAR NOT NULL,
  Contraseña VARCHAR NULL,
  Nombre VARCHAR NULL,
  Apellidos VARCHAR NULL,
  PRIMARY KEY(Usuario, Alumno_ID_ALUMNO),
  INDEX Matricula_FKIndex1(Alumno_ID_ALUMNO)
);

CREATE TABLE Ventas (
  idVentas INT NOT NULL AUTO_INCREMENT,
  id_facturas INT NULL,
  id_producto VARCHAR NULL,
  cantidad INTEGER UNSIGNED NULL,
  PRIMARY KEY(idVentas)
);


