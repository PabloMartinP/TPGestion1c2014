create proc mas_insertivo.Rubros
as
begin
	select * from MAS_INSERTIVO.RUBRO
end
go---------------
create proc mas_insertivo.visibilidades
as
begin
	select * from MAS_INSERTIVO.VISIBILIDAD
end
go--------------------------
create proc mas_insertivo.Publicacion_Estados
as
begin
	select * from MAS_INSERTIVO.ESTADO_PUBLICACION
end
go-----------
create proc mas_insertivo.Publicacion_Tipos
as
begin
	select * from MAS_INSERTIVO.TIPO_PUBLICACION
end
go--------------------------
create proc mas_insertivo.Visi_Buscar
@codigo int
as
begin
	select * from MAS_INSERTIVO.VISIBILIDAD
	where visi_id = @codigo
end
go----------------
create proc mas_insertivo.Publicacion_estado_buscar
@codigo int
as
begin
	select * from MAS_INSERTIVO.ESTADO_PUBLICACION
	where epub_id = @codigo
end
go-----------------------------------
create proc mas_insertivo.Publicacion_tipo_buscar
@codigo int
as
begin
	select * from MAS_INSERTIVO.TIPO_PUBLICACION
	where tpub_id = @codigo
end
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
create proc mas_insertivo.publicacion_generar
@descripcion nvarchar(255), 
@stock numeric(18,0), 
@fecha datetime, 
@fecha_Vencimiento datetime, 
@precio numeric(18,2), 
@visibilidad int, 
@usuario int, 
@estado int, 
@tipo int, 
@preguntas bit
as
begin
	--select * from MAS_INSERTIVO.PUBLICACION where 
	
	insert into MAS_INSERTIVO.PUBLICACION
	(publ_descripcion, publ_Stock, publ_fecha, publ_fecha_venc, publ_precio, publ_visibilidad, publ_usuario, publ_estado, publ_tipo, publ_permitir_preguntas)
	values
	(@descripcion, @stock, @fecha, @fecha_Vencimiento, @precio, @visibilidad, @usuario, @estado, @tipo, @preguntas)
	
	select @@IDENTITY
end
go--=============================================================================???
create proc mas_insertivo.rubro_publicacion_insertar
@publicacion int, 
@rubro int
as
begin
	--select * from MAS_INSERTIVO.publicacion_rubro
	insert into MAS_INSERTIVO.publicacion_rubro
	(prubr_publicacion, prubr_rubro)
	values
	(@publicacion, @rubro)
end
go--=============================================================================???
create proc mas_insertivo.Publicacion_filtrar
@descripcion nvarchar(255), 
@usuario int
as
begin
	select * from MAS_INSERTIVO.PUBLICACION
	where publ_usuario = @usuario and (publ_descripcion = @descripcion or @descripcion ='')
end
go--=============================================================================???
create proc Mas_insertivo.Publicacion_Buscar
@codigo int
as
begin
	select * from MAS_INSERTIVO.PUBLICACION
	where publ_id = @codigo
end
go--=============================================================================???
create proc mas_insertivo.Publicacion_Rubros
@codigo int
as
begin
	select r.* from MAS_INSERTIVO.publicacion_Rubro
	inner join MAS_INSERTIVO.RUBRO r on prubr_rubro = rubr_id
	where prubr_publicacion = @codigo
end
go--=============================================================================???
go--=============================================================================???
create proc mas_insertivo.publicacion_editar
@id int,
@descripcion nvarchar(255), 
@stock numeric(18,0), 
@fecha datetime, 
@fecha_Vencimiento datetime, 
@precio numeric(18,2), 
@visibilidad int, 
@usuario int, 
@estado int, 
@tipo int, 
@preguntas bit
as
begin
	--select * from MAS_INSERTIVO.PUBLICACION 
	update MAS_INSERTIVO.PUBLICACION
		set publ_descripcion = @descripcion, 
		publ_Stock = @stock, 
		publ_fecha = @fecha, 
		publ_fecha_venc = @fecha_Vencimiento, 
		publ_precio = @precio, 
		publ_visibilidad = @visibilidad, 
		publ_usuario = @usuario, 
		publ_estado = @estado, 
		publ_tipo = @tipo, 
		publ_permitir_preguntas = @preguntas
	where publ_id = @id
end
go------------------
create proc mas_insertivo.Rubro_publicacion_eliminar
@publicacion int
as
begin
	--select * from MAS_INSERTIVO.publicacion_rubro
	delete from MAS_INSERTIVO.publicacion_rubro
	where prubr_publicacion = @publicacion
end
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
