--declare @n bit
--exec MAS_INSERTIVO.Usuario_ValidarLogin '3','1', @n;
create proc MAS_INSERTIVO.Usuario_ValidarLogin
@UserName nvarchar(50), 
@Password nvarchar(64), 
@resultado bit output
as
begin
	set @resultado = 0--NO EXISTE EL USUARIO

	if (exists(select * from MAS_INSERTIVO.Usuario 
		where usua_username=@username and usua_eliminado = 0)) --si existe
	begin	
		if(exists(select * from MAS_INSERTIVO.Usuario 
		where usua_username=@UserName and usua_password=@Password ))
		begin
			--logueo OK				
			--actualizo la cantidad de intentos a cero
			update MAS_INSERTIVO.Usuario 
				set usua_cant_intentos = 0
			where usua_username=@UserName			
			set @resultado = 1
		end
		
		--actualizo la cantidad de intentos
		update MAS_INSERTIVO.Usuario
			set usua_cant_intentos=usua_cant_intentos + 1 --trigger que verifica que sea <3
		where usua_username=@UserName
	end
end
go---------------------------------------
create proc MAS_INSERTIVO.Usuario_Buscar
@username nvarchar(50)
as
begin
	select * from MAS_INSERTIVO.usuario 
	where usua_username = @username and usua_eliminado = 0
end
go------------------------------
create trigger mas_insertivo.tr_Usuario_cantidadDeIntentos
on mas_insertivo.usuario after update
as
begin
	if update(usua_cant_intentos)
	begin
		declare @id int 
		declare @cantidadDeIntentos smallint
		select @id = usua_id, @cantidadDeIntentos = usua_cant_intentos from inserted
		--Si la cantidad de intentos es mayor a 3, inhabilito el user
		if (@cantidadDeIntentos > 3)
		begin
			update MAS_INSERTIVO.Usuario
				set usua_habilitado = 0
			where usua_id=@id
		end
	end
end
go-------------------------------
create trigger mas_insertivo.tr_Usuario_Habilitado
on mas_insertivo.usuario after update
as
begin
	if update(usua_habilitado)
	begin
		declare @id int 
		declare @habilitado smallint
		select @id = usua_id, @habilitado = usua_habilitado from inserted
		
		if @habilitado <>0 
		begin
			--si esta habilitado
			select 'habilitado'
		end
		else
		begin
			--si no esta habilitado
			select 'no habilitado'
		end		
	end
end
