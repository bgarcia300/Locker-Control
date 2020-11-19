create database locker_control
go
use locker_control
go

create table usuario
(Id int primary key,
Primer_Apellido nvarchar(max),
Segundo_Apellido nvarchar(max),
Nombre nvarchar(max),
Seccion nvarchar(4),
Relacion_Cooperativa_Usuario nvarchar(2)
)
go

create table venta
(Id int IDENTITY(1,1) primary key,
Id_Usuario int,
Numero_Casillero int unique not null,
fecha_venta datetime,
constraint fk_id_usuario foreign key (Id_Usuario)
references dbo.usuario (id)
)
go

create login usuarioSQL with password = 'dbLockerControl'
go

create user usuarioSQL for login usuarioSQL
go
