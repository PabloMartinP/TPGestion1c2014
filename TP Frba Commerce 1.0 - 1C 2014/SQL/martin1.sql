create proc [MAS_INSERTIVO].[empresa_agregar]
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
	insert into MAS_INSERTIVO.empresa
	(empr_usuario, empr_razon_social, empr_mail, empr_telefono, 
	empr_dom_calle, empr_num_calle, empr_piso, empr_depto, empr_localidad, empr_cod_postal, 
	empr_ciudad, empr_cuit, empr_nombre_contacto, 
	empr_fecha_creacion)
	values
	(@usuario, @razon_social, @mail, @telefono, 
	@calle, @num_calle, @piso, @depto, @localidad, @cod_postal, 
	@ciudad, @cuit, @NombreContacto, @fechaCreacion)
end
go---------------------------------------
create proc MAS_INSERTIVO.empresa_buscarPorRazonSocial
@razonSocial nvarchar(255)
as
begin
	select * from MAS_INSERTIVO.EMPRESA
	where empr_razon_social = @razonSocial
end
go---------------------
create proc mas_insertivo.empresa_buscarPorCUIT
@cuit nvarchar(50)
as
begin
	select * from MAS_INSERTIVO.EMPRESA
	where empr_cuit = @cuit
end
go----------------------------------------------
--exec Mas_insertivo.cliente_filtrar '','',-1,-1,''
go
create view mas_insertivo.vw_usuario
as
	select * from MAS_INSERTIVO.USUARIO
	where usua_eliminado =0 
go
create proc Mas_insertivo.cliente_filtrar
@nombre nvarchar(255),
@apellido nvarchar(255),
@tipo_doc int,
@num_doc numeric(18,0),
@mail nvarchar(255)
as
begin
	--select * from mas_insertivo.vw_usuario
	select u.usua_username, c.*	
	from MAS_INSERTIVO.CLIENTE c
	inner join MAS_INSERTIVO.vw_usuario u on c.clie_usuario = u.usua_id
	where (clie_nombre = @nombre or @nombre='') and 
		(clie_apellido = @apellido or @apellido='') and
		(clie_tipo_doc = @tipo_doc or @tipo_doc = -1) and
		(clie_num_doc = @num_doc or @num_doc = -1) and
		(clie_mail = @mail or @mail = '')
		
end
go----------------------------------------------
create proc mas_insertivo.Usuario_BuscarPorId
@id int
as
begin
	select * from MAS_INSERTIVO.USUARIO
	where usua_id = @id
end
go----------------------------------------------
create proc mas_insertivo.Cliente_buscar
@id int
as
begin
	select * from MAS_INSERTIVO.CLIENTE
	where clie_usuario = @id
end
go----------------------------------------------
--create proc mas_insertivo.tipo_documento
--@id int
--as
--begin
--	select * from mas_insertivo.tipo_documento
--	where tdoc_id = @id
--end
go----------------------------------------------
create proc mas_insertivo.Cliente_Guardar
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
	update  MAS_INSERTIVO.Cliente
		set
		clie_usuario = @usuario, 
		clie_nombre = @nombre, 
		clie_apellido = @apellido, 
		clie_tipo_doc = @tipo_doc, 
		clie_num_doc = @num_doc, 
		clie_mail = @mail, 
		clie_telefono = @telefono, 
		clie_dom_calle = @calle, 
		clie_num_calle = @num_calle, 
		clie_piso = @piso, 
		clie_depto = @depto, 
		clie_localidad = @localidad, 
		clie_cod_postal = @cod_postal, 
		clie_fecha_nac = @fecha_nac, 
		clie_cuil = @cuil
	where clie_usuario = @usuario
end
