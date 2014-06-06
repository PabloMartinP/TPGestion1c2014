--select * from mas_insertivo.pregunta
create proc mas_insertivo.Respuestas
@usuario int
as
begin
	select publ_descripcion, preg_descripcion, preg_respuesta from MAS_INSERTIVO.pregunta  
	inner join MAS_INSERTIVO.PUBLICACION on preg_publicacion = publ_id
	where preg_respuesta is not null and preg_usuario = @usuario
end
go--------
create proc mas_insertivo.Preguntas
@usuario int
as
begin
	select preg_id, publ_id, publ_descripcion, preg_descripcion from MAS_INSERTIVO.pregunta  
	inner join MAS_INSERTIVO.PUBLICACION on preg_publicacion = publ_id
	where preg_respuesta is null and preg_usuario = @usuario
end
go-------------------------
create proc mas_insertivo.Pregunta_Responder
@id int, 
@usuario int, 
@respuesta nvarchar(255), 
@fecha datetime
as
begin
	--select * from MAS_INSERTIVO.PREGUNTA
	update MAS_INSERTIVO.PREGUNTA
		set preg_usuario = @usuario, 
			preg_respuesta = @respuesta, 
			preg_fecha = @fecha
		where preg_id = @id
end
go---------------------------------------------------------
go---------------------------------------------------------
go---------------------------------------------------------

create view mas_insertivo.vw_publicacion_paraComprarOfertar
as
	select publ_id, publ_descripcion, publ_stock, publ_precio, tpub_descripcion, publ_estado, publ_fecha_venc, publ_usuario, publ_visibilidad--, r.*
	from MAS_INSERTIVO.PUBLICACION
	left join MAS_INSERTIVO.TIPO_PUBLICACION on publ_tipo = tpub_id
	--left  join MAS_INSERTIVO.PUBLICACION_RUBRO pr on pr.prubr_publicacion = publ_id
	--left join MAS_INSERTIVO.RUBRO r on r.rubr_id = pr.prubr_rubro
	where ((publ_tipo = 1 and publ_stock>0)  --compra inmediata y con stock
		or (publ_tipo = 2))--subasta 
		and (publ_estado = 2)--estado activa

go-----------------------
create proc mas_insertivo.Preguntar
@publicacion int, 
@pregunta nvarchar(255), 
@fecha datetime, 
@usuario int
as
begin
	--select * from MAS_INSERTIVO.PREGUNTA
	insert into MAS_INSERTIVO.PREGUNTA
	(preg_publicacion, preg_usuario, preg_descripcion, preg_fecha)
	values
	(@publicacion, @usuario, @pregunta, @fecha)
end