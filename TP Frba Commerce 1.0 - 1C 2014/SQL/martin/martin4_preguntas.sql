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