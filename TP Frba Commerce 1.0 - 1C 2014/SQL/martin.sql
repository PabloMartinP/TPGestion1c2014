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
