Create procedure Clas_pel(@Clas varchar(8)) 
as
select * from Pelicula
where Clasificacion=@Clas

exec Clas_pel c1


Create procedure Job_more_eig(@Ed int)
as
select * from Trabajador
where Edad=@Ed

exec Job_more_eig e1


Create procedure ge_romn (@Romc varchar(30))
as
select * from Genero
where genero = 'romance'

exec ge_romn g2


Create procedure suc_nme (@Apod varchar(20))
as
select * from Sucursal
where Nombre='Apodaca'

exec suc_nme s1 


Create procedure psc_gert (@Grnt varchar(20))
as
Select * from Posicion
where Posicion='gerente'

exec psc_gert g3



Create Function dbo.TrabajadorApellido(@NM varchar)
returns varchar(100)
as
begin
declare @Apellido varchar(100)
select @Apellido = Apellido from Trabajador
return @Apellido
end

Select *, dbo.TrabajadorApellido (Apellido) from Trabajador


Create trigger tr_insert
on Genero
after insert
as
print 'Cambios realizados'
insert into Genero values (N'245f0e17-9c15-4467-abdf-551cce72641c','Terror');

Create trigger tr_insert3
on Genero
instead of insert
as
print 'Hubo cambios'
insert into Genero values ('234f0e16-8d14-3356-abdf-551cce72640d', 'Accion');


 


