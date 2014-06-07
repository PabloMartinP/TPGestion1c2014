alter view mas_insertivo.ComprasOfertasSinCalificar
as
select id, tpub_id, tpub_descripcion Publicacion, publ_id, publ_descripcion, fecha, Cantidad, Usuario, 
	case tipo 
			when 1 then publ_precio * cantidad
			else publ_precio
			end as Precio
	from (
select ofer_id id, 2 tipo, ofer_publicacion publicacion, ofer_fecha fecha, 
	ofer_monto Cantidad,	
	ofer_usuario usuario
from MAS_INSERTIVO.OFERTA
where ofer_calificacion is null
union all
select comp_id id, 1 tipo, comp_publicacion publicacion,  comp_fecha Fecha, 
	comp_cantidad Cantidad, 	
	comp_usuario usuario--, *
from MAS_INSERTIVO.COMPRA
where comp_calificacion is null
) CO
inner join MAS_INSERTIVO.PUBLICACION on CO.Publicacion = publ_id
inner join MAS_INSERTIVO.TIPO_PUBLICACION on CO.tipo = tpub_id
go-----------------------------------------------------------
create proc mas_insertivo.ComprasSinCalificar
@usuario int
as
begin
	select * from MAS_INSERTIVO.ComprasOfertasSinCalificar
	where USUARIO = @usuario
end
go------------------------
alter proc mas_insertivo.calificar
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
		
	--si es una compra
	if(@tipo = 1)
		update MAS_INSERTIVO.COMPRA--select * from MAS_INSERTIVO.COMPRA where comp_id = 92672
			set comp_calificacion = @@IDENTITY
		where comp_id = @compra_oferta 
	else
		update MAS_INSERTIVO.OFERTA
			set ofer_calificacion = @@IDENTITY
		where ofer_id = @compra_oferta
		
end
