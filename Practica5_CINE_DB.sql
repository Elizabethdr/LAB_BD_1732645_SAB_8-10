USE [CINE_DB]
GO

CREATE TABLE [dbo].[Sala](
	[ID_sala] [uniqueidentifier] NOT NULL,
	[Num_Asientos] [int] NOT NULL,
	[Precio] [smallmoney] NOT NULL,
	[Tipo_sala] [varchar](14) NOT NULL,
 CONSTRAINT [PK_Sala] PRIMARY KEY CLUSTERED 
(
	[ID_sala] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sala] ([ID_sala], [Num_Asientos], [Precio], [Tipo_sala]) VALUES (N'f6026811-635a-417d-a7ae-0c5f1c25ccfd', 150, 100.0000, N'4DX')
INSERT [dbo].[Sala] ([ID_sala], [Num_Asientos], [Precio], [Tipo_sala]) VALUES (N'105a752c-4bfd-4deb-81bd-8dc6f7f3b670', 100, 50.0000, N'Kids')
INSERT [dbo].[Sala] ([ID_sala], [Num_Asientos], [Precio], [Tipo_sala]) VALUES (N'f37de3c5-8792-4c37-8d61-edd64ae382be', 100, 70.0000, N'3D')
INSERT [dbo].[Sala] ([ID_sala], [Num_Asientos], [Precio], [Tipo_sala]) VALUES (N'dcbe3d93-8dd2-42ee-a3d1-f7f97355684e', 50, 40.0000, N'Tradicional')
/****** Object:  Table [dbo].[Genero]    Script Date: 10/27/2017 17:40:00 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Genero] ([ID_genero], [genero]) VALUES (N'245f0e17-9c15-4467-abdf-551cce72649b', N'Romance')
INSERT [dbo].[Genero] ([ID_genero], [genero]) VALUES (N'93e2ba28-6ca6-4bdc-b5d2-73ce1d866230', N'Comedia')
INSERT [dbo].[Genero] ([ID_genero], [genero]) VALUES (N'fbb16388-a9ad-4085-b63f-89358aebc2e2', N'Horror')
INSERT [dbo].[Genero] ([ID_genero], [genero]) VALUES (N'ba19458e-ac24-407e-bf91-f8ecc4126d75', N'Infantil')
/****** Object:  Table [dbo].[Posicion]    Script Date: 10/27/2017 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Posicion](
	[ID_Posicion] [uniqueidentifier] NOT NULL,
	[Posicion] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Posicion] PRIMARY KEY CLUSTERED 
(
	[ID_Posicion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Posicion] ([ID_Posicion], [Posicion]) VALUES (N'f1a9f98c-7a99-4663-a6c8-25e6540fbf3f', N'Asistente')
INSERT [dbo].[Posicion] ([ID_Posicion], [Posicion]) VALUES (N'98b15f65-955b-4b31-a29b-52870129ec46', N'Dulceria')
INSERT [dbo].[Posicion] ([ID_Posicion], [Posicion]) VALUES (N'7707e7cf-667b-4a78-b2fa-78551d39ff95', N'Gerente')
INSERT [dbo].[Posicion] ([ID_Posicion], [Posicion]) VALUES (N'd66b1c51-3fb3-4e94-b348-c02e1e1de44e', N'Punto del Cielo')
INSERT [dbo].[Posicion] ([ID_Posicion], [Posicion]) VALUES (N'f4c22d9e-4f4d-46bc-8ae5-ed0d3cadeb49', N'Cajero')
/****** Object:  Table [dbo].[Pelicula]    Script Date: 10/27/2017 17:40:00 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Pelicula] ([ID_Pelicula], [Nombre], [Sinopsis], [Duracion], [ID_genero], [Clasificacion]) VALUES (N'3c4d5263-4c32-4266-a4e4-02cc90a25def', N'Coraline', N'I AM YOUR OTHER MOTHER', CAST(0x07005847F80D0000 AS Time), N'ba19458e-ac24-407e-bf91-f8ecc4126d75', N'PG')
INSERT [dbo].[Pelicula] ([ID_Pelicula], [Nombre], [Sinopsis], [Duracion], [ID_genero], [Clasificacion]) VALUES (N'33f2d315-aa8e-4f5b-9807-17ac5b529782', N'Scary Movie 2', N'Is that chicken soup?', CAST(0x07005847F80D0000 AS Time), N'93e2ba28-6ca6-4bdc-b5d2-73ce1d866230', N'B-15')
INSERT [dbo].[Pelicula] ([ID_Pelicula], [Nombre], [Sinopsis], [Duracion], [ID_genero], [Clasificacion]) VALUES (N'178c701a-dd3b-4361-9c8e-3f2f13ba595f', N'COCO', N'Find your voice', CAST(0x0700D088C3100000 AS Time), N'ba19458e-ac24-407e-bf91-f8ecc4126d75', N'AA')
INSERT [dbo].[Pelicula] ([ID_Pelicula], [Nombre], [Sinopsis], [Duracion], [ID_genero], [Clasificacion]) VALUES (N'4514702f-731e-43a1-b592-5190b04b4e21', N'Crazy, Stupid, Love.', N'Love might be the answer', CAST(0x07005847F80D0000 AS Time), N'245f0e17-9c15-4467-abdf-551cce72649b', N'PG-13')
INSERT [dbo].[Pelicula] ([ID_Pelicula], [Nombre], [Sinopsis], [Duracion], [ID_genero], [Clasificacion]) VALUES (N'3084047b-8523-4a36-bd4e-568b412d8513', N'Scary Movie', N'What is your favorite horror movie?', CAST(0x07005847F80D0000 AS Time), N'93e2ba28-6ca6-4bdc-b5d2-73ce1d866230', N'B-15')
INSERT [dbo].[Pelicula] ([ID_Pelicula], [Nombre], [Sinopsis], [Duracion], [ID_genero], [Clasificacion]) VALUES (N'097f0c99-3de0-4a46-b53e-6d4d46e55be9', N'Letters to Juliet', N'A road trip that will change your life', CAST(0x07009CA6920C0000 AS Time), N'245f0e17-9c15-4467-abdf-551cce72649b', N'PG-13')
INSERT [dbo].[Pelicula] ([ID_Pelicula], [Nombre], [Sinopsis], [Duracion], [ID_genero], [Clasificacion]) VALUES (N'f7c838f5-f315-4f38-8ff0-a773b6f1e216', N'The exorcist', N'Clasico de Horror', CAST(0x0700D088C3100000 AS Time), N'fbb16388-a9ad-4085-b63f-89358aebc2e2', N'R')
INSERT [dbo].[Pelicula] ([ID_Pelicula], [Nombre], [Sinopsis], [Duracion], [ID_genero], [Clasificacion]) VALUES (N'3f83bd43-798d-47c7-94d4-dd8fb9d6d0fa', N'IT', N'La mejor pelicula de horror del a�o', CAST(0x0700EC7572A30000 AS Time), N'fbb16388-a9ad-4085-b63f-89358aebc2e2', N'R')
/****** Object:  Table [dbo].[Cartelera]    Script Date: 10/27/2017 17:40:00 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cartelera] ([ID_Cartelera], [ID_Sala], [ID_Pelicula], [Fecha], [Hora_Inicio], [Hora_final]) VALUES (N'c47696e0-7499-4202-8cb5-0e67b9106927', N'dcbe3d93-8dd2-42ee-a3d1-f7f97355684e', N'4514702f-731e-43a1-b592-5190b04b4e21', CAST(0x743D0B00 AS Date), CAST(0x0700B4284D8A0000 AS Time), CAST(0x070050CFDF960000 AS Time))
INSERT [dbo].[Cartelera] ([ID_Cartelera], [ID_Sala], [ID_Pelicula], [Fecha], [Hora_Inicio], [Hora_final]) VALUES (N'887f7088-83f7-453c-90b8-156946c38d03', N'105a752c-4bfd-4deb-81bd-8dc6f7f3b670', N'3c4d5263-4c32-4266-a4e4-02cc90a25def', CAST(0x743D0B00 AS Date), CAST(0x07001882BA7D0000 AS Time), CAST(0x070070C9B28B0000 AS Time))
INSERT [dbo].[Cartelera] ([ID_Cartelera], [ID_Sala], [ID_Pelicula], [Fecha], [Hora_Inicio], [Hora_final]) VALUES (N'57fd202f-4601-43d9-8c91-95d5f81886de', N'f6026811-635a-417d-a7ae-0c5f1c25ccfd', N'3f83bd43-798d-47c7-94d4-dd8fb9d6d0fa', CAST(0x743D0B00 AS Date), CAST(0x070084B1109B0000 AS Time), CAST(0x07003AC9BBA90000 AS Time))
INSERT [dbo].[Cartelera] ([ID_Cartelera], [ID_Sala], [ID_Pelicula], [Fecha], [Hora_Inicio], [Hora_final]) VALUES (N'03aa0fcf-253f-4d93-b569-969109f73eef', N'f37de3c5-8792-4c37-8d61-edd64ae382be', N'178c701a-dd3b-4361-9c8e-3f2f13ba595f', CAST(0x743D0B00 AS Date), CAST(0x0700E03495640000 AS Time), CAST(0x0700B0BD58750000 AS Time))
INSERT [dbo].[Cartelera] ([ID_Cartelera], [ID_Sala], [ID_Pelicula], [Fecha], [Hora_Inicio], [Hora_final]) VALUES (N'0f0209b5-5c84-4c0b-a5a9-9bd75c4bd1fb', N'f6026811-635a-417d-a7ae-0c5f1c25ccfd', N'3f83bd43-798d-47c7-94d4-dd8fb9d6d0fa', CAST(0x743D0B00 AS Date), CAST(0x0700543AD4AB0000 AS Time), CAST(0x07000A527FBA0000 AS Time))
INSERT [dbo].[Cartelera] ([ID_Cartelera], [ID_Sala], [ID_Pelicula], [Fecha], [Hora_Inicio], [Hora_final]) VALUES (N'bb2b923b-93a7-4105-91e4-a08ffb4472fd', N'dcbe3d93-8dd2-42ee-a3d1-f7f97355684e', N'33f2d315-aa8e-4f5b-9807-17ac5b529782', CAST(0x743D0B00 AS Date), CAST(0x07001CEDAE920000 AS Time), CAST(0x0700B893419F0000 AS Time))
INSERT [dbo].[Cartelera] ([ID_Cartelera], [ID_Sala], [ID_Pelicula], [Fecha], [Hora_Inicio], [Hora_final]) VALUES (N'ec28c95b-235d-40d7-8944-b61e097c0add', N'f37de3c5-8792-4c37-8d61-edd64ae382be', N'178c701a-dd3b-4361-9c8e-3f2f13ba595f', CAST(0x743D0B00 AS Date), CAST(0x070080461C860000 AS Time), CAST(0x070050CFDF960000 AS Time))
INSERT [dbo].[Cartelera] ([ID_Cartelera], [ID_Sala], [ID_Pelicula], [Fecha], [Hora_Inicio], [Hora_final]) VALUES (N'740ebccf-329d-4f7c-ae4f-c5d56d21c0ad', N'dcbe3d93-8dd2-42ee-a3d1-f7f97355684e', N'3084047b-8523-4a36-bd4e-568b412d8513', CAST(0x743D0B00 AS Date), CAST(0x070084B1109B0000 AS Time), CAST(0x07002058A3A70000 AS Time))
INSERT [dbo].[Cartelera] ([ID_Cartelera], [ID_Sala], [ID_Pelicula], [Fecha], [Hora_Inicio], [Hora_final]) VALUES (N'07c78326-b051-430c-a2b4-e0dced1ddc15', N'105a752c-4bfd-4deb-81bd-8dc6f7f3b670', N'3c4d5263-4c32-4266-a4e4-02cc90a25def', CAST(0x743D0B00 AS Date), CAST(0x070048F9F66C0000 AS Time), CAST(0x0700A040EF7A0000 AS Time))
/****** Object:  Table [dbo].[Boleto]    Script Date: 10/27/2017 17:40:00 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Boleto] ([ID_Boleto], [ID_Cartelera], [Num_Asiento]) VALUES (N'4208b725-7a4d-4ce0-a000-4a0ea071aaf0', N'740ebccf-329d-4f7c-ae4f-c5d56d21c0ad', N'A4')
INSERT [dbo].[Boleto] ([ID_Boleto], [ID_Cartelera], [Num_Asiento]) VALUES (N'7a4a8844-d1ba-4f05-bb0f-6de7f7e482e4', N'bb2b923b-93a7-4105-91e4-a08ffb4472fd', N'K11')
INSERT [dbo].[Boleto] ([ID_Boleto], [ID_Cartelera], [Num_Asiento]) VALUES (N'ffdab629-6845-463f-bf06-71fbc432fac5', N'57fd202f-4601-43d9-8c91-95d5f81886de', N'A2')
INSERT [dbo].[Boleto] ([ID_Boleto], [ID_Cartelera], [Num_Asiento]) VALUES (N'93d821b4-9118-4fd5-9921-75a0843b2fb9', N'57fd202f-4601-43d9-8c91-95d5f81886de', N'B8')
INSERT [dbo].[Boleto] ([ID_Boleto], [ID_Cartelera], [Num_Asiento]) VALUES (N'9f4581d0-96f2-44a4-ad93-84bac26e00f8', N'740ebccf-329d-4f7c-ae4f-c5d56d21c0ad', N'A7')
INSERT [dbo].[Boleto] ([ID_Boleto], [ID_Cartelera], [Num_Asiento]) VALUES (N'9952a698-6aa1-4aab-aa34-9fe9c246f25b', N'57fd202f-4601-43d9-8c91-95d5f81886de', N'F12')
INSERT [dbo].[Boleto] ([ID_Boleto], [ID_Cartelera], [Num_Asiento]) VALUES (N'5c863c42-0d29-4755-9975-c38da00ff764', N'57fd202f-4601-43d9-8c91-95d5f81886de', N'F13')
INSERT [dbo].[Boleto] ([ID_Boleto], [ID_Cartelera], [Num_Asiento]) VALUES (N'94afcad5-694a-4427-89ce-d2db2cb0ef2f', N'bb2b923b-93a7-4105-91e4-a08ffb4472fd', N'K12')
INSERT [dbo].[Boleto] ([ID_Boleto], [ID_Cartelera], [Num_Asiento]) VALUES (N'bbf4429d-4425-4865-9fee-d33d2468358b', N'03aa0fcf-253f-4d93-b569-969109f73eef', N'M4')
INSERT [dbo].[Boleto] ([ID_Boleto], [ID_Cartelera], [Num_Asiento]) VALUES (N'02e837ee-f31d-4580-bf5b-d3cadf2c6410', N'57fd202f-4601-43d9-8c91-95d5f81886de', N'A1')
INSERT [dbo].[Boleto] ([ID_Boleto], [ID_Cartelera], [Num_Asiento]) VALUES (N'c5226dac-bc43-41d1-8f8b-e50e93f61a88', N'57fd202f-4601-43d9-8c91-95d5f81886de', N'B7')
INSERT [dbo].[Boleto] ([ID_Boleto], [ID_Cartelera], [Num_Asiento]) VALUES (N'f925c03c-e75d-4237-96fc-e68707ebb6cc', N'03aa0fcf-253f-4d93-b569-969109f73eef', N'M5')
/****** Object:  Table [dbo].[Sucursal]    Script Date: 10/27/2017 17:40:00 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Direccion], [telefono], [ID_Cartelera]) VALUES (N'7f22555c-c79e-4c3c-8b95-5a8b7ddb7185', N'Apodaca', N'Sendero Apodaca', N'8110158422', N'07c78326-b051-430c-a2b4-e0dced1ddc15')
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Direccion], [telefono], [ID_Cartelera]) VALUES (N'caf16123-7f19-4bfd-9951-78d1e889e6ac', N'Sendero', N'Plaza Bella', N'812185472', N'887f7088-83f7-453c-90b8-156946c38d03')
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Direccion], [telefono], [ID_Cartelera]) VALUES (N'a058df7b-719c-4924-8b68-876992a0ce14', N'Santiago', N'New Palace', N'821745472', N'ec28c95b-235d-40d7-8944-b61e097c0add')
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Direccion], [telefono], [ID_Cartelera]) VALUES (N'0429f85d-0804-4dd7-9f4c-89f4a11726da', N'Anahuac', N'Plaza Fiesta', N'812745472', N'03aa0fcf-253f-4d93-b569-969109f73eef')
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Direccion], [telefono], [ID_Cartelera]) VALUES (N'53b2f15c-8ba9-4fbf-8399-b9f4ba87672b', N'San Nicolas', N'Santo Domingo', N'8118745472', N'03aa0fcf-253f-4d93-b569-969109f73eef')
/****** Object:  Table [dbo].[Trabajador]    Script Date: 10/27/2017 17:40:00 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Trabajador] ([ID_Trabajador], [Nombre], [Apellido], [Edad], [ID_sucursal], [ID_posicion]) VALUES (N'5e4f7c27-c275-4d4f-8472-20d56738dc62', N'Aneth', N'Mares', 18, N'caf16123-7f19-4bfd-9951-78d1e889e6ac', N'7707e7cf-667b-4a78-b2fa-78551d39ff95')
INSERT [dbo].[Trabajador] ([ID_Trabajador], [Nombre], [Apellido], [Edad], [ID_sucursal], [ID_posicion]) VALUES (N'a5875491-84b3-4f70-b3f9-4dbb156e2cf1', N'Lorena', N'Loredo', 20, N'caf16123-7f19-4bfd-9951-78d1e889e6ac', N'98b15f65-955b-4b31-a29b-52870129ec46')
INSERT [dbo].[Trabajador] ([ID_Trabajador], [Nombre], [Apellido], [Edad], [ID_sucursal], [ID_posicion]) VALUES (N'8f76dcf6-6b2d-47dd-a29c-873bb51ade5a', N'Bruno', N'Mendez', 21, N'caf16123-7f19-4bfd-9951-78d1e889e6ac', N'f1a9f98c-7a99-4663-a6c8-25e6540fbf3f')
INSERT [dbo].[Trabajador] ([ID_Trabajador], [Nombre], [Apellido], [Edad], [ID_sucursal], [ID_posicion]) VALUES (N'1f7b78e7-785e-4025-b4a9-ddfb642167b8', N'Marco', N'Almaguer', 18, N'a058df7b-719c-4924-8b68-876992a0ce14', N'7707e7cf-667b-4a78-b2fa-78551d39ff95')
INSERT [dbo].[Trabajador] ([ID_Trabajador], [Nombre], [Apellido], [Edad], [ID_sucursal], [ID_posicion]) VALUES (N'04611f84-1f00-4cd6-8797-e3e43a5263e7', N'Diana', N'Diaz', 18, N'0429f85d-0804-4dd7-9f4c-89f4a11726da', N'7707e7cf-667b-4a78-b2fa-78551d39ff95')
/****** Object:  Table [dbo].[Venta_Mostrador]    Script Date: 10/27/2017 17:40:00 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relacion_Venta_Boleto]    Script Date: 10/27/2017 17:40:00 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Boleto_Cartelera1]    Script Date: 10/27/2017 17:40:00 ******/
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Cartelera1] FOREIGN KEY([ID_Cartelera])
REFERENCES [dbo].[Cartelera] ([ID_Cartelera])
GO
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Cartelera1]
GO
/****** Object:  ForeignKey [FK_Cartelera_Pelicula1]    Script Date: 10/27/2017 17:40:00 ******/
ALTER TABLE [dbo].[Cartelera]  WITH CHECK ADD  CONSTRAINT [FK_Cartelera_Pelicula1] FOREIGN KEY([ID_Pelicula])
REFERENCES [dbo].[Pelicula] ([ID_Pelicula])
GO
ALTER TABLE [dbo].[Cartelera] CHECK CONSTRAINT [FK_Cartelera_Pelicula1]
GO
/****** Object:  ForeignKey [FK_Cartelera_Sala1]    Script Date: 10/27/2017 17:40:00 ******/
ALTER TABLE [dbo].[Cartelera]  WITH CHECK ADD  CONSTRAINT [FK_Cartelera_Sala1] FOREIGN KEY([ID_Sala])
REFERENCES [dbo].[Sala] ([ID_sala])
GO
ALTER TABLE [dbo].[Cartelera] CHECK CONSTRAINT [FK_Cartelera_Sala1]
GO
/****** Object:  ForeignKey [FK_Pelicula_Genero1]    Script Date: 10/27/2017 17:40:00 ******/
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Genero1] FOREIGN KEY([ID_genero])
REFERENCES [dbo].[Genero] ([ID_genero])
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [FK_Pelicula_Genero1]
GO
/****** Object:  ForeignKey [FK_Relacion_Venta_Boleto_Boleto1]    Script Date: 10/27/2017 17:40:00 ******/
ALTER TABLE [dbo].[Relacion_Venta_Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Relacion_Venta_Boleto_Boleto1] FOREIGN KEY([ID_Boleto])
REFERENCES [dbo].[Boleto] ([ID_Boleto])
GO
ALTER TABLE [dbo].[Relacion_Venta_Boleto] CHECK CONSTRAINT [FK_Relacion_Venta_Boleto_Boleto1]
GO
/****** Object:  ForeignKey [FK_Relacion_Venta_Boleto_Venta_Mostrador1]    Script Date: 10/27/2017 17:40:00 ******/
ALTER TABLE [dbo].[Relacion_Venta_Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Relacion_Venta_Boleto_Venta_Mostrador1] FOREIGN KEY([ID_VentaMostrador])
REFERENCES [dbo].[Venta_Mostrador] ([ID_VentaMostrador])
GO
ALTER TABLE [dbo].[Relacion_Venta_Boleto] CHECK CONSTRAINT [FK_Relacion_Venta_Boleto_Venta_Mostrador1]
GO
/****** Object:  ForeignKey [FK_Sucursal_Cartelera]    Script Date: 10/27/2017 17:40:00 ******/
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Sucursal_Cartelera] FOREIGN KEY([ID_Cartelera])
REFERENCES [dbo].[Cartelera] ([ID_Cartelera])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_Sucursal_Cartelera]
GO
/****** Object:  ForeignKey [FK_Trabajador_Posicion1]    Script Date: 10/27/2017 17:40:00 ******/
ALTER TABLE [dbo].[Trabajador]  WITH CHECK ADD  CONSTRAINT [FK_Trabajador_Posicion1] FOREIGN KEY([ID_posicion])
REFERENCES [dbo].[Posicion] ([ID_Posicion])
GO
ALTER TABLE [dbo].[Trabajador] CHECK CONSTRAINT [FK_Trabajador_Posicion1]
GO
/****** Object:  ForeignKey [FK_Trabajador_Sucursal1]    Script Date: 10/27/2017 17:40:00 ******/
ALTER TABLE [dbo].[Trabajador]  WITH CHECK ADD  CONSTRAINT [FK_Trabajador_Sucursal1] FOREIGN KEY([ID_sucursal])
REFERENCES [dbo].[Sucursal] ([ID_Sucursal])
GO
ALTER TABLE [dbo].[Trabajador] CHECK CONSTRAINT [FK_Trabajador_Sucursal1]
GO
/****** Object:  ForeignKey [FK_Venta_Mostrador_Sucursal1]    Script Date: 10/27/2017 17:40:00 ******/
ALTER TABLE [dbo].[Venta_Mostrador]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Mostrador_Sucursal1] FOREIGN KEY([ID_sucursal])
REFERENCES [dbo].[Sucursal] ([ID_Sucursal])
GO
ALTER TABLE [dbo].[Venta_Mostrador] CHECK CONSTRAINT [FK_Venta_Mostrador_Sucursal1]
GO
/****** Object:  ForeignKey [FK_Venta_Mostrador_Trabajador]    Script Date: 10/27/2017 17:40:00 ******/
ALTER TABLE [dbo].[Venta_Mostrador]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Mostrador_Trabajador] FOREIGN KEY([ID_Trabajador])
REFERENCES [dbo].[Trabajador] ([ID_Trabajador])
GO
ALTER TABLE [dbo].[Venta_Mostrador] CHECK CONSTRAINT [FK_Venta_Mostrador_Trabajador]
GO


SELECT Nombre, Direccion FROM Sucursal
GROUP BY Direccion, Nombre

SELECT MAX(Edad) as 'Adulto', MIN(Edad) as 'Joven', COUNT(id_trabajador) as 'Total de registros' FROM Trabajador

SELECT TOP 100 * FROM Trabajador

SELECT * FROM Sucursal
WHERE Direccion = 'Apodaca';

SELECT * FROM Sala
WHERE Precio = '70';

SELECT Nombre, Edad FROM Trabajador
GROUP BY Nombre, Edad

SELECT COUNT(ID_genero)
FROM Genero;

SELECT AVG(Precio)
FROM Sala;

SELECT COUNT(Num_Asientos), Tipo_sala 
FROM Sala
GROUP BY Tipo_sala
HAVING COUNT (Num_Asientos) > 50;
