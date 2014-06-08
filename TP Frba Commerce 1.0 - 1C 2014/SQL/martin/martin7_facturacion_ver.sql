create view mas_insertivo.ComprasAFacturar
as
	select comp_id id, comp_publicacion publ_id, tpub_id, tpub_descripcion, 
	comp_fecha fecha, comp_usuario usuario,  
	publ_descripcion, comp_cantidad, comp_cantidad * publ_precio as Precio
	from MAS_INSERTIVO.COMPRA	
	inner join MAS_INSERTIVO.PUBLICACION on publ_id = comp_publicacion
	inner join MAS_INSERTIVO.TIPO_PUBLICACION on publ_tipo = tpub_id
	where comp_pagado =0
	union
	select ofer_id id, ofer_publicacion publ_id, tpub_id, tpub_descripcion, 	
	ofer_fecha fecha, ofer_usuario usuario, 
	publ_descripcion, ofer_monto, ofer_monto as Precio
	from MAS_INSERTIVO.OFERTA
	inner join MAS_INSERTIVO.PUBLICACION on publ_id = ofer_publicacion
	inner join MAS_INSERTIVO.TIPO_PUBLICACION on publ_tipo = tpub_id
	where ofer_pagado = 0 and ofer_ganadora = 1
	
go--------------------------
--exec mas_Insertivo.ComprasParaFacturar 95, 10
create  proc mas_Insertivo.ComprasParaFacturar
@usuario int, 
@cantidad tinyint
as
begin	
	declare @sql nvarchar(4000)
	set @sql = ' select top ' + CONVERT(nvarchar, @cantidad) + ' * from MAS_INSERTIVO.comprasAFacturar '
	set @sql = @sql + ' where USUARIO = ' + CONVERT(nvarchar, @usuario) 
	set @sql = @sql + ' order by fecha desc '
	
	exec (@sql)
	--select @sql
end
go
