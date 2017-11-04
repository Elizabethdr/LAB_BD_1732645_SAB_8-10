USE CINE_DB
GO

Select b.ID_Boleto, c.ID_Cartelera, Num_Asiento
from Boleto as b
left join Cartelera as c on b.ID_Boleto = c.ID_Cartelera

Select *
From Cartelera as C
Inner join Sala as s on c.ID_Sala=s.ID_sala;

Select *
From Pelicula as p
left join Cartelera as c on p.Nombre = c.Fecha;

Select Sucursal.ID_Cartelera, Cartelera.ID_Pelicula, Sucursal.Nombre
from Sucursal
right join Cartelera on Sucursal.ID_Cartelera = Cartelera.ID_Pelicula;

CREATE VIEW V_Sucursal
As Select Nombre, Direccion, telefono
From Sucursal
where Nombre='Apodaca';

Select*
From Genero
Where ID_genero in (select ID_genero from Genero where genero='Terror');

Select *
into id_sala
From Cartelera

SELECT MAX(Edad) as 'Adulto', MIN(Edad) as 'Joven', COUNT(id_trabajador) as 'Total de registros' FROM Trabajador


