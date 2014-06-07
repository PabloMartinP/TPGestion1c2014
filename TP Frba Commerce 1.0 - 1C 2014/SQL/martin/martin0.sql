go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
--exec Funcionalidad_BuscarPorRol 1
create proc MAS_INSERTIVO.funcionalidad_BuscarPorRol
@Rol_ID int
as
begin	
	select f.func_ID, 
		f.func_nombre, 
		(CASe p.rfunc_rol when @Rol_ID then '1' else '0' end ) as Permitido --select * 
		  from MAS_INSERTIVO.Funcionalidad f 
	left join (select * from MAS_INSERTIVO.rol_funcionalidad where rfunc_rol=@Rol_ID) p on f.func_id=p.rfunc_funcionalidad
	
end
go-------------------------------------
create proc MAS_INSERTIVO.Rol_Agregar--select * from MAS_INSERTIVO.rol  
@Nombre nvarchar(50), 
@Habilitado bit
as  
begin  
 INSERT into MAS_INSERTIVO.rol  
 (Rol_Nombre, Rol_Habilitado)
 VALUES (@Nombre, @Habilitado)   
   
 select @@IDENTITY as 'ID'  
end  
go--------------------------
create proc MAS_INSERTIVO.[Permiso_Agregar]
@Rol_ID int, 
@Fun_ID int
as
begin
	insert into MAS_INSERTIVO.rol_funcionalidad
	values
	(@Rol_ID, @Fun_ID)
	
end
go------------------------------
CREATE view MAS_INSERTIVO.vw_rol
as
select Rol_ID, Rol_Nombre, Rol_Habilitado from MAS_INSERTIVO.rol 
--where Rol_Eliminado=0
go-------------------------------
CREATE proc MAS_INSERTIVO.[Rol_Filtrar]  
@ROl_Nombre nvarchar(50)
as  
begin  
 select * from MAS_INSERTIVO.vw_rol r   
 where   
  r.Rol_Nombre like '%' +@ROl_Nombre + '%'  
--  and p.Tipo_Nombre like ''%'' + @tipo_nombre + '%'   
end  
go-------------------------------
create proc MAS_INSERTIVO.[Rol_Buscar]  
@Rol_ID int  
as  
begin   
 select r.Rol_ID, r.Rol_Nombre, Rol_Habilitado
  from MAS_INSERTIVO.rol r
 where r.Rol_ID=@Rol_ID --and r.Rol_Eliminado=0
end  
go--------------------------
create proc MAS_INSERTIVO.[Rol_Modificar]  
@ID int,   
@Nombre nvarchar(50), 
@Habilitado bit
as  
begin  
update MAS_INSERTIVO.rol  
   SET Rol_Nombre = @Nombre, 
	Rol_Habilitado = @Habilitado
 WHERE Rol_ID=@ID
 
end
go--------------------------------
create proc MAS_INSERTIVO.[Permiso_EliminarPorRol]
@Rol_ID int
as
begin
	delete from MAS_INSERTIVO.rol_funcionalidad
	where rfunc_rol=@Rol_ID	
end
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql

go-------inicio usuarios
go-------inicio usuarios
go-------inicio usuarios
go-------inicio usuarios
go-------inicio usuarios

--declare @resultado bit
--exec MAS_INSERTIVO.Usuario_ValidarLogin '33','234', @resultado out
--select @resultado;
go
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
		else
		begin
			--actualizo la cantidad de intentos
			update MAS_INSERTIVO.Usuario
				set usua_cant_intentos=usua_cant_intentos + 1 --trigger que verifica que sea <3
			where usua_username=@UserName		
		end		
	end	
end
go---------------------------------------
create proc MAS_INSERTIVO.Usuario_Buscar  
@username nvarchar(50)  
as  
begin  
/*
 declare @tipo int
 if(exists(select * from MAS_INSERTIVO.CLIENTE))
	set @tipo = 1 --cliente
 else
	set @tipo = 2 
*/
 --select *, @tipo usua_tipo_usuario from MAS_INSERTIVO.usuario   
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


go-------fin usuarios
go-------fin usuarios
go-------fin usuarios
go-------fin usuarios
go-------fin usuarios
go-------fin usuarios

create proc mas_insertivo.usuario_agregar
@name nvarchar(50), 
@password nvarchar(64), 
@primera_vez bit
as
begin
	--select * from MAS_INSERTIVO.Usuario
	insert into MAS_INSERTIVO.Usuario
	(usua_username, usua_password, usua_primer_login)
	values
	(@name, @password, @primera_vez)	
end
go----------------------------
create proc mas_insertivo.cliente_agregar
@usuario int,
@nombre nvarchar(255), 
@apellido nvarchar(255), 
@tipo_doc int, 
@num_doc numeric(18,0), 
@mail nvarchar(255), 
@telefono nvarchar(50), 
@calle nvarchar(255), 
@num_calle numeric(18,0), 
@piso numeric(18,0), 
@depto nvarchar(50), 
@localidad nvarchar(255), 
@cod_postal nvarchar(50), 
@fecha_nac datetime, 
@cuil nvarchar(50)
as
begin
	--select * from MAS_INSERTIVO.Cliente
	insert into MAS_INSERTIVO.Cliente
	(clie_usuario, clie_nombre, clie_apellido, clie_tipo_doc, clie_num_doc, clie_mail, clie_telefono, 
	clie_dom_calle, clie_num_calle, clie_piso, clie_depto, clie_localidad, clie_cod_postal, clie_fecha_nac, 
	clie_cuil)
	values
	(@usuario, @nombre, @apellido, @tipo_doc, @num_doc, @mail, @telefono, 
	@calle, @num_calle, @piso, @depto, @localidad, @cod_postal, @fecha_nac, @cuil)
end
go----------------------------------
create proc MAS_INSERTIVO.cliente_buscarPorTelefono
@telefono nvarchar(50)
as
begin
	select * from MAS_INSERTIVO.Cliente
	where clie_telefono = @telefono
end
go---------------------------
create proc MAS_INSERTIVO.cliente_buscarPorDocumento
@tipo_doc int, 
@num_doc numeric(18,0)
as
begin
	select * from MAS_INSERTIVO.Cliente
	where clie_tipo_doc = @tipo_doc and clie_num_doc = @num_doc
end
go------------
create proc mas_insertivo.cliente_tipos_doc
as
begin
	select tdoc_id codigo, tdoc_nombre descripcion from MAS_INSERTIVO.Tipo_Documento	
end
go----------------------------
create proc mas_insertivo.Cliente_Existe
@codigo int
as
begin
	select * from MAS_INSERTIVO.CLIENTE
	where clie_usuario = @codigo
end