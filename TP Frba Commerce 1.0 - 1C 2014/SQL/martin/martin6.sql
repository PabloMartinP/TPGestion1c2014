create view mas_insertivo.vw_ComprasSinCalificar
as
select comp_id, tpub_id, tpub_descripcion Publicacion, 
	publ_id, publ_descripcion, 
	comp_fecha, comp_Cantidad, comp_Usuario, 
	case tpub_id 
			when 1 then publ_precio * comp_cantidad--si es compraInmediata
			else publ_precio --si es subasta
			end as Precio
	from MAS_INSERTIVO.COMPRA
	inner join MAS_INSERTIVO.PUBLICACION on publ_id = comp_publicacion
	inner join MAS_INSERTIVO.TIPO_PUBLICACION on publ_tipo = tpub_id
	where comp_calificacion is null
go-----------------------------------------------------------
create proc mas_insertivo.ComprasSinCalificar
@usuario int
as
begin
	select * from MAS_INSERTIVO.vw_ComprasSinCalificar
	where comp_USUARIO = @usuario
end
go------------------------
create proc mas_insertivo.calificar
@calificado int, --el usuario califi 
@calificador int, 
@cant_estrellas tinyint, 
@descripcion nvarchar(255),
@compra_oferta int, 
@tipo tinyint
as
begin
	--select * from MAS_INSERTIVO.CALIFICACION
	insert into MAS_INSERTIVO.CALIFICACION
	(cali_usuario_calificado, cali_usuario_calificador, cali_cant_estrellas, cali_descripcion)
	values
	(@calificado, @calificador, @cant_estrellas, @descripcion)
		
		
	update MAS_INSERTIVO.COMPRA--select * from MAS_INSERTIVO.COMPRA where comp_id = 92672
		set comp_calificacion = @@IDENTITY
	where comp_id = @compra_oferta 	
		
end
