use locker_control
go

create procedure InsertarUsuario
(
@cedulaUsuario int,
@primerApellido nvarchar(max),
@segundoApellido nvarchar(max),
@nombre nvarchar(max),
@seccion nvarchar(4),
@asociadoCooperativa nvarchar(2)
)
as
begin
	begin try
		insert into usuario
		values (UPPER(@cedulaUsuario), UPPER(@primerApellido), UPPER(@segundoApellido), UPPER(@nombre), UPPER(@seccion), UPPER(@asociadoCooperativa))
	
	end try
	begin catch
			PRINT 'Error Inserting Usuario';
			--Se lo comunicamos al usuario y deshacemos la transacción
			--todo volverá a estar como si nada hubiera ocurrido
			--ROLLBACK TRAN
			THROW; --5001, 'Error Inserting Usuario'
	END catch
	
	
END	
go

create procedure InsertarVenta(
@numeroCedula int,
@numeroCasillero int
)

as
begin
	begin try
		insert into venta
		values (@numeroCedula, @numeroCasillero,GETDATE())
	
	end try
	begin catch
			PRINT 'El casillero ya ha sido vendido';
			--Se lo comunicamos al usuario y deshacemos la transacción
			--todo volverá a estar como si nada hubiera ocurrido
			--ROLLBACK TRAN
			THROW; --5001, 'Error Inserting Usuario'
	END catch
	
	
END	
go

create procedure EliminarUsuario
(
@id int,
@message bit
)
as 
	begin 
	select Numero_Casillero from venta where id_usuario = @id
		if (select @@rowcount) >= 1
		set @message = 1;
		else
			set @message = 0
			delete from usuario where Id = @id;
	end
go

create procedure BuscarUsuario 
(
@Id int
)
as 
	begin
		Select Nombre +' '+Primer_Apellido +' '+ Segundo_Apellido from usuario where Id = @Id
	end
go
create procedure EliminarVenta
(
@idVenta int
)
as 
	begin 
		delete from venta where Id = @idVenta;
	end
go

create procedure BuscarCasilleroUsuario
(
@numeroCasillero int
)
as 
begin
	select u.id, u.nombre + ' ' + u.Primer_Apellido + ' ' + u.Segundo_Apellido, v.numero_casillero 
	from usuario as u
	join venta as v
	on v.Id_Usuario = u.Id
	where v.Numero_Casillero = @numeroCasillero
end
go
