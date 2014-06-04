create proc mas_insertivo.Usuario_Eliminar
@codigo int
as
begin
	select * from MAS_INSERTIVO.USUARIO
	update MAS_INSERTIVO.USUARIO
		set usua_eliminado = 1
	where usua_id = @codigo
end
go------------------------------select * from mas_insertivo.tipo_documento
create proc [MAS_INSERTIVO].[empresa_guardar]  
@usuario int,  
@razon_social nvarchar(255),  
@mail nvarchar(255),   
@telefono nvarchar(50),   
@calle nvarchar(255),   
@num_calle numeric(18,0),   
@piso numeric(18,0),   
@depto nvarchar(50),   
@localidad nvarchar(255),   
@cod_postal nvarchar(50),   
@ciudad nvarchar(255),  
@cuit nvarchar(50),   
@fechaCreacion datetime,   
@NombreContacto nvarchar(255)  
as  
begin  
 --select * from MAS_INSERTIVO.empresa  
 update MAS_INSERTIVO.empresa  
	set empr_razon_social = @razon_social, 
		empr_mail = @mail, 
		empr_telefono = @telefono,   
		empr_dom_calle = @calle, 
		empr_num_calle = @num_calle, 
		empr_piso = @piso, 
		empr_depto = @depto, 
		empr_localidad = @localidad, 
		empr_cod_postal = @cod_postal,   
		empr_ciudad = @ciudad, 
		empr_cuit = @cuit, 
		empr_nombre_contacto = @NombreContacto,   
		empr_fecha_creacion =  @fechaCreacion
	where empr_usuario = @usuario
  
end 
go-------------------------------
create proc Mas_insertivo.empresa_filtrar
@razonSocial nvarchar(255),
@cuit nvarchar(50),
@mail nvarchar(255)
as
begin
	--select * from mas_insertivo.usuario
	select u.usua_username, c.*	
	from MAS_INSERTIVO.EMPRESA c
	inner join MAS_INSERTIVO.vw_usuario u on c.empr_usuario = u.usua_id
	where (empr_razon_social = @razonSocial or @razonSocial = '') 
		and (EMPR_cuit = @cuit or @cuit = '')
		and (empr_mail = @mail or @mail = '')		
end
go-----------------------------------
create  proc mas_insertivo.Empresa_buscar
@id int
as
begin
	select * from MAS_INSERTIVO.EMPRESA
	where empr_usuario = @id
end