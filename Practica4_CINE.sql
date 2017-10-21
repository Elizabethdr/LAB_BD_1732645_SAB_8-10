use BDProyectoCine
GO

select * 
from cartelera
select * 
from posicion 
select * 
from sala
select * 
from sucursal
select * 
from trabajador

insert into posicion select NEWID(), 'Vendedor de Boletos' 
union select NEWID(), 'vendedor'
union select NEWID(), 'Gerente'

insert into sucursal select NEWID(), 'Esfera City', 'Estansuela', '8121293845'
union select newid() , 'Plaza Fiesta','Anahuac', '8129328392' 
union select newid() , 'Plaza Bella', 'Apodaca', '8291832956'

insert into sala select NEWID(), '40',' 100', '4D', '65C318C7-A05D-4087-9135-CB52F8A27089'
union select NEWID(), '50', '70', '3D', 'EC5C18DB-31BC-45DD-B037-94E1C2A9518F'
union select NEWID(), '30', '50', '2D', '7E171B88-90D5-464D-95A7-6204B664BC5A'

insert into trabajador select NEWID(), 'Gil', 'Contreras', '19','18477EA8-EA6C-487E-B49E-410C3EB2B866', '65C318C7-A05D-4087-9135-CB52F8A27089'
union select NEWID(), 'Aneth', 'Mares', '18', '0DBF6828-0695-4068-BBC5-9D1C8634B70E', 'EC5C18DB-31BC-45DD-B037-94E1C2A9518F'
union select NEWID(), 'Axel', 'Flores', '18','714FCE4D-2580-49C9-8564-FA3FFC2E4F35' , '7E171B88-90D5-464D-95A7-6204B664BC5A'

insert into cartelera select NEWID(), 'F3CD7518-1679-47C5-8DE1-1129EADD6D60', '2017-10-15','16:00', '22:00'
union select NEWID(), 'FD72914D-B344-4982-9D04-31A1AC1B4765', '2017-10-17','12:30', '11:30'
union select NEWID(), 'AFA0F661-0017-4D01-9BE8-4800235970A2', '2017-10-18', '14:10','16:50' 

update posicion
set posicion='Vendedor'
where posicion='Vendedor de Boletos' AND id_posicion='74188040-05D4-464B-A22A-11C7C14DBBCB'

update sala
set numero_asientos='50'
where id_sucursal='EC5C18DB-31BC-45DD-B037-94E1C2A9518F'

update cartelera
set fecha='2017-10-31',hora_inicio='21:00',hora_fin='23:59'
where id_cartelera='5B346E62-1DF1-4268-AC11-7CC955D5B0D0'

update trabajador 
set nombre= 'Enrique', edad= '22'
where nombre= 'Axel'

update sucursal 
set telefono='8129328392'
where nombre='Plaza Fiesta'


delete from cartelera
where id_sala='AFA0F661-0017-4D01-9BE8-4800235970A2'

delete from trabajador 
where id_posicion='714FCE4D-2580-49C9-8564-FA3FFC2E4F35'

delete from posicion
where posicion='Servidor'

delete from sala 
where numero_asientos='30' and tipo_sala='2D'

delete from sucursal
where nombre='Plaza Bella'
