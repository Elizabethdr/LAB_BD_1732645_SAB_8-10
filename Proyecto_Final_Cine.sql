USE [master]
GO
/****** Object:  Database [Cine]    Script Date: 11/11/2017 11:59:53 p.m. ******/
CREATE DATABASE [Cine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Cine.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Cine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Cine_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Cine] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cine] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cine] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Cine] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Cine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cine] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Cine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cine] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cine] SET  MULTI_USER 
GO
ALTER DATABASE [Cine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cine] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Cine]
GO
/****** Object:  StoredProcedure [dbo].[AsientoDaniado]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AsientoDaniado]
(@sucursal varchar(100))
as 
begin
	select *
	from AsientoDañado AD
	join Sala Sa on Sa.id_sala=AD.id_sala
	join Sucursal Su on Su.id_sucursal=SA.id_sucursal
	where nombre = @sucursal
end


GO
/****** Object:  StoredProcedure [dbo].[Boletos_ocupados]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Boletos_ocupados] (@nombre varchar(20))
as
select id_asiento_dañado, num_asiento_dañado, id_ticket_boleto, nombre, num_asiento
from asientosdaniadoview, Ticket_Boleto
where nombre = 'Montemorelos'
GO
/****** Object:  StoredProcedure [dbo].[insertarPeliculas]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[insertarPeliculas]
(@nombre varchar(100), @sinopsis varchar(700), @duracion time(7), @genero uniqueidentifier, @clasificacion varchar(50))
as 
begin
	insert into Pelicula
	select NEWID(), @nombre ,@sinopsis, @duracion, @genero, @clasificacion
	
end


GO
/****** Object:  StoredProcedure [dbo].[insertarPosicion]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[insertarPosicion]
(@posicion varchar(100))
as 
begin
	insert into Posicion
	select NEWID(),@posicion
	
end


GO
/****** Object:  StoredProcedure [dbo].[insertarSala]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[insertarSala]
(@asientos int, @precio money, @tipo varchar(50), @idsucu uniqueidentifier)
as 
begin
	insert into sala
	select NEWID(), @asientos ,@precio, @tipo, @idsucu
	
end


GO
/****** Object:  StoredProcedure [dbo].[insertarTrabajador]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[insertarTrabajador] 
(@nombre varchar(100), @apellido varchar(100), @edad int, @idsuc uniqueidentifier, @idpos uniqueidentifier)
as 
begin
	insert into Trabajador
	select NEWID(), @nombre, @apellido, @edad, @idsuc, @idpos
	
end


GO
/****** Object:  UserDefinedFunction [dbo].[CalcularCambio]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create function [dbo].[CalcularCambio]
(@total money, @pago money)
returns money
begin
declare @final money 
	set @final= @pago -@total
return @final 
end;


GO
/****** Object:  Table [dbo].[AsientoDañado]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AsientoDañado](
	[id_asiento_dañado] [uniqueidentifier] NOT NULL,
	[num_asiento_dañado] [int] NOT NULL,
	[id_sala] [uniqueidentifier] NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_AsientoDañado] PRIMARY KEY CLUSTERED 
(
	[id_asiento_dañado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cartelera]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cartelera](
	[id_cartelera] [uniqueidentifier] NOT NULL,
	[id_sala] [uniqueidentifier] NOT NULL,
	[id_pelicula] [uniqueidentifier] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora_inicio] [time](7) NOT NULL,
 CONSTRAINT [PK_Cartelera] PRIMARY KEY CLUSTERED 
(
	[id_cartelera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genero]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genero](
	[id_genero] [uniqueidentifier] NOT NULL,
	[genero] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[id_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pelicula](
	[id_pelicula] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[sinopsis] [varchar](700) NOT NULL,
	[duracion] [time](7) NOT NULL,
	[id_genero] [uniqueidentifier] NOT NULL,
	[clasificacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pelicula] PRIMARY KEY CLUSTERED 
(
	[id_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Posicion]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Posicion](
	[id_posicion] [uniqueidentifier] NOT NULL,
	[posicion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Posicion] PRIMARY KEY CLUSTERED 
(
	[id_posicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[id_producto] [uniqueidentifier] NOT NULL,
	[producto] [varchar](100) NOT NULL,
	[precio] [money] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sala]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sala](
	[id_sala] [uniqueidentifier] NOT NULL,
	[num_asientos] [int] NOT NULL,
	[precio] [money] NOT NULL,
	[tipo_sala] [varchar](50) NOT NULL,
	[id_sucursal] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_sala] PRIMARY KEY CLUSTERED 
(
	[id_sala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursal](
	[id_sucursal] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[direccion] [varchar](200) NOT NULL,
	[telefono] [varchar](700) NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[id_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[id_ticket] [uniqueidentifier] NOT NULL,
	[fecha] [date] NOT NULL,
	[id_cartelera] [uniqueidentifier] NOT NULL,
	[id_trabajador] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket_Boleto]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket_Boleto](
	[id_ticket_boleto] [uniqueidentifier] NOT NULL,
	[id_ticket] [uniqueidentifier] NOT NULL,
	[num_asiento] [int] NOT NULL,
 CONSTRAINT [PK_Ticket_Boleto] PRIMARY KEY CLUSTERED 
(
	[id_ticket_boleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TicketDulceria]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketDulceria](
	[id_ticketdulceria] [uniqueidentifier] NOT NULL,
	[id_trabajador] [uniqueidentifier] NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_Dulceria] PRIMARY KEY CLUSTERED 
(
	[id_ticketdulceria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trabajador]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trabajador](
	[id_trabajador] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[edad] [int] NOT NULL,
	[id_sucursal] [uniqueidentifier] NOT NULL,
	[id_posicion] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Trabajador] PRIMARY KEY CLUSTERED 
(
	[id_trabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ventas_Dulceria]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas_Dulceria](
	[id_venta_dulceria] [uniqueidentifier] NOT NULL,
	[id_ticketdulceria] [uniqueidentifier] NOT NULL,
	[id_producto] [uniqueidentifier] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Ventas_Dulceria] PRIMARY KEY CLUSTERED 
(
	[id_venta_dulceria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[asientosdaniadoview]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[asientosdaniadoview] as
select asda.id_asiento_dañado, asda.num_asiento_dañado, asda.descripcion, suc.nombre, sa.tipo_sala, sa.precio
from AsientoDañado asda
left join sala as sa on asda.id_sala = sa.id_sala
left join Sucursal as suc on sa.id_sucursal = suc.id_sucursal




GO
/****** Object:  View [dbo].[cartView]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[cartView] as 
select cart.*,suc.nombre as 'Nombre Sucursal', sa.tipo_sala, sa.precio,sa.num_asientos, peli.nombre as 'Nombre Pelicula', peli.clasificacion, peli.duracion, datepart(hour,peli.duracion)+datepart(hour,cart.hora_inicio) as 'hora_fin', datepart(MINUTE,peli.duracion)+ datepart(MINUTE,cart.hora_inicio) as 'minute_fin' 
from Cartelera cart
left join Pelicula as peli on cart.id_pelicula = peli.id_pelicula
left join Sala as sa on cart.id_sala= sa.id_sala
left join Sucursal as suc on sa.id_sucursal= suc.id_sucursal





GO
/****** Object:  View [dbo].[DulceriaView]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[DulceriaView] as 
select TD.id_ticketdulceria, TD.fecha, Tr.nombre as 'Nombre Trabajador' , Su.nombre as 'Nombre Sucursal',SUM(VD.cantidad)as 'Cantidad productos comprados', Sum(VD.cantidad*pr.precio) AS 'Precio Final'
from TicketDulceria TD
join Trabajador Tr on Tr.id_trabajador=TD.id_trabajador
join Ventas_Dulceria VD on VD.id_ticketdulceria= TD.id_ticketdulceria
join Producto Pr on Pr.id_producto=VD.id_producto
join Sucursal Su on Su.id_sucursal=Tr.id_sucursal
group by TD.id_ticketdulceria, TD.fecha,Tr.nombre, Su.nombre



GO
/****** Object:  View [dbo].[Peliculaview]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[Peliculaview] as 
select peli.*, ge.genero
from Pelicula peli
left join Genero ge on peli.id_genero= ge.id_genero




GO
/****** Object:  View [dbo].[salaview]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[salaview] as
select sa.*, suc.nombre as 'Nombre sucursal', suc.direccion, suc.telefono
from sala sa
left join Sucursal suc on sa.id_sucursal = suc.id_sucursal




GO
/****** Object:  View [dbo].[TicketView]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[TicketView] as 
select T.id_ticket, T.fecha,Ca.id_cartelera,Pe.nombre as 'Nombre Pelicula', Ge.genero,Tr.nombre as 'Nombre Trabajador', Sa.id_sala,Sa.tipo_sala, Sa.precio, Su.nombre as 'Nombre Sucursal', (Count(TB.id_ticket)*Sa.precio) as 'Precio Total'
from Ticket T
join Cartelera Ca on Ca.id_cartelera=T.id_cartelera
join Trabajador Tr on Tr.id_trabajador= T.id_trabajador
join sala Sa on Sa.id_sala=Ca.id_sala
join Pelicula Pe on Pe.id_pelicula=Ca.id_pelicula
join Genero Ge on Ge.id_genero=Pe.id_genero
join Sucursal Su on Su.id_sucursal=Sa.id_sucursal
join Ticket_Boleto TB on TB.id_ticket= T.id_ticket
group by T.id_ticket,T.fecha,Ca.id_cartelera, Pe.nombre, Ge.genero, Tr.nombre, Sa.id_sala, Sa. tipo_sala, Sa.precio, Su.nombre





GO
/****** Object:  View [dbo].[TrabajadorView]    Script Date: 11/11/2017 11:59:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TrabajadorView] as
select tra.id_trabajador, (tra.nombre+tra.apellido) as 'Nombre',tra.edad, suc.id_sucursal,suc.nombre as 'Nombre sucursal', suc.direccion,suc.telefono, pos.posicion
from Trabajador tra
left join Sucursal suc on tra.id_sucursal=suc.id_sucursal
left join Posicion pos on tra.id_posicion=pos.id_posicion




GO
ALTER TABLE [dbo].[AsientoDañado]  WITH CHECK ADD  CONSTRAINT [FK_AsientoDañado_sala] FOREIGN KEY([id_sala])
REFERENCES [dbo].[sala] ([id_sala])
GO
ALTER TABLE [dbo].[AsientoDañado] CHECK CONSTRAINT [FK_AsientoDañado_sala]
GO
ALTER TABLE [dbo].[Cartelera]  WITH CHECK ADD  CONSTRAINT [FK_Cartelera_Pelicula] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[Pelicula] ([id_pelicula])
GO
ALTER TABLE [dbo].[Cartelera] CHECK CONSTRAINT [FK_Cartelera_Pelicula]
GO
ALTER TABLE [dbo].[Cartelera]  WITH CHECK ADD  CONSTRAINT [FK_Cartelera_sala] FOREIGN KEY([id_sala])
REFERENCES [dbo].[sala] ([id_sala])
GO
ALTER TABLE [dbo].[Cartelera] CHECK CONSTRAINT [FK_Cartelera_sala]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Genero] FOREIGN KEY([id_genero])
REFERENCES [dbo].[Genero] ([id_genero])
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [FK_Pelicula_Genero]
GO
ALTER TABLE [dbo].[sala]  WITH CHECK ADD  CONSTRAINT [FK_sala_Sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[Sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[sala] CHECK CONSTRAINT [FK_sala_Sucursal]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Cartelera] FOREIGN KEY([id_cartelera])
REFERENCES [dbo].[Cartelera] ([id_cartelera])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Cartelera]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Trabajador] FOREIGN KEY([id_trabajador])
REFERENCES [dbo].[Trabajador] ([id_trabajador])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Trabajador]
GO
ALTER TABLE [dbo].[Ticket_Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Boleto_Ticket] FOREIGN KEY([id_ticket])
REFERENCES [dbo].[Ticket] ([id_ticket])
GO
ALTER TABLE [dbo].[Ticket_Boleto] CHECK CONSTRAINT [FK_Ticket_Boleto_Ticket]
GO
ALTER TABLE [dbo].[TicketDulceria]  WITH CHECK ADD  CONSTRAINT [FK_Dulceria_Trabajador] FOREIGN KEY([id_trabajador])
REFERENCES [dbo].[Trabajador] ([id_trabajador])
GO
ALTER TABLE [dbo].[TicketDulceria] CHECK CONSTRAINT [FK_Dulceria_Trabajador]
GO
ALTER TABLE [dbo].[Trabajador]  WITH CHECK ADD  CONSTRAINT [FK_Trabajador_Posicion1] FOREIGN KEY([id_posicion])
REFERENCES [dbo].[Posicion] ([id_posicion])
GO
ALTER TABLE [dbo].[Trabajador] CHECK CONSTRAINT [FK_Trabajador_Posicion1]
GO
ALTER TABLE [dbo].[Trabajador]  WITH CHECK ADD  CONSTRAINT [FK_Trabajador_Sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[Sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[Trabajador] CHECK CONSTRAINT [FK_Trabajador_Sucursal]
GO
ALTER TABLE [dbo].[Ventas_Dulceria]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Dulceria_Dulceria] FOREIGN KEY([id_ticketdulceria])
REFERENCES [dbo].[TicketDulceria] ([id_ticketdulceria])
GO
ALTER TABLE [dbo].[Ventas_Dulceria] CHECK CONSTRAINT [FK_Ventas_Dulceria_Dulceria]
GO
ALTER TABLE [dbo].[Ventas_Dulceria]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Dulceria_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Ventas_Dulceria] CHECK CONSTRAINT [FK_Ventas_Dulceria_Producto]
GO
USE [master]
GO
ALTER DATABASE [Cine] SET  READ_WRITE 
GO
