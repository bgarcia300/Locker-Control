use locker_control
go


select * from usuario
go
select * from venta 
go

--venta * / nombre apellido1 apellido2 (concat) 
select v.Id as Id_Venta, v.Id_Usuario, v.Numero_Casillero , u.nombre +' '+ u.primer_apellido + ' '+ u.segundo_apellido as Nombre_Completo from venta as v
join usuario as u
on v.id_usuario = u.Id
go

--id de usuario / nombre / id venta/ id usuario fk/ numero casillero

select u.id, u.nombre, v.id, v.Id_Usuario, v.numero_casillero from usuario as u
join venta as v
on v.Id_Usuario = u.Id
go


select @@SERVERNAME
go

SELECT * FROM usuario WHERE id = 305390848
go