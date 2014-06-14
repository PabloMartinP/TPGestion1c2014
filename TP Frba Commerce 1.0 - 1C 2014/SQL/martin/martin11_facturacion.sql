create view mas_insertivo.vw_ofertasGanadoras
as
	select * from MAS_INSERTIVO.oferta where ofer_ganadora = 1
go
create view mas_insertivo.vw_publicacionesFinalizadas
as
	select * from MAS_INSERTIVO.Publicacion
	where publ_estado = 4
go
go
create view mas_insertivo.vw_PublicacionesAFacturar  
as  
	--select * from MAS_INSERTIVO.compra
 select comp_id, publ_usuario Usuario, comP_publicacion Publ_ID, publ_descripcion Descripcion, comp_fecha Fecha,   
  tpub_descripcion Tipo,   
  comp_cantidad Cantidad,   
  round((case publ_tipo when 1 then (comp_cantidad * publ_precio)  
        else ofer_monto end ) * visi_porcentaje ,2) as Precio  
  --, * from MAS_INSERTIVO.compra c  
  from MAS_INSERTIVO.compra c  
 inner join MAS_INSERTIVO.vw_publicacionesFinalizadas on publ_id = comp_publicacion   
 inner join MAS_INSERTIVO.tipo_publicacion on publ_tipo = tpub_id  
 inner join MAS_INSERTIVO.visibilidad on visi_id = publ_visibilidad  
 --joineo con las ofertas ganadoras usar el precio ganador  
 left join MAS_INSERTIVO.vw_ofertasGanadoras on ofer_publicacion = comp_publicacion  
 where comp_pagado = 0   
 union  
 select 0, publ_usuario Usuario, publ_id, 'Comision por publicacion' Publicacion, publ_fecha Fecha, 'Comision' Descripcion, 1 Cantidad, publ_visi_precio  
 from MAS_INSERTIVO.publicacion where publ_pagado = 0
  
  
--select * from MAS_INSERTIVO.USUARIO where usua_id = 38 92-69669713-58
--exec mas_Insertivo.ComprasParaFacturar 38,10,1
go
create proc mas_Insertivo.ComprasParaFacturar
@usuario int, 
@cantidad tinyint, 
@incluirPublicacion bit
as
begin	
	declare @sql nvarchar(4000)
	set @sql = ' select top ' + CONVERT(nvarchar, @cantidad) + ' * from MAS_INSERTIVO.vw_PublicacionesAFacturar '
	set @sql = @sql + ' where USUARIO = ' + CONVERT(nvarchar, @usuario)
	if @incluirPublicacion=0
		 set @sql = @sql + ' and comP_id <>0 ' --si no incluye las publs las saco
	set @sql = @sql + ' order by Publ_id, fecha '
	
	exec (@sql)
	--select @sql
end
go
create proc mas_insertivo.Fact_InsertarCabecera
@fecha datetime, 
@usuario int, 
@tipopago int, 
@total numeric(18,2)
as
begin
	--select * from MAS_INSERTIVO.FACTURA_CABECERA
	insert into MAS_INSERTIVO.FACTURA_CABECERA
	(fact_fecha, fact_usuario, fact_tipo_pago, fact_total)
	values
	(@fecha, @usuario, @tipopago, @total)
	
	select @@IDENTITY
end
go---------------------------
create proc mas_insertivo.Fact_InsertarItem
@factura numeric(18,0), 
@renglon int, 
@publicacion int, 
@cantidad int, 
@monto numeric(18,2)
as
begin
	--select * from MAS_INSERTIVO.FACTURA_ITEM
	insert into MAS_INSERTIVO.FACTURA_ITEM
	(item_factura, item_renglon, item_publicacion, item_cantidad, item_monto)
	values
	(@factura, @renglon, @publicacion, @cantidad, @monto)
	
end
go
create proc mas_insertivo.Fact_MarcarComoPagado
@comp_id int, 
@publ_id numeric(18,0)
as
begin
	if (@comp_id is null) -- si compra_ID es null, significa que es una comision por publicacion
		update MAS_INSERTIVO.PUBLICACION
			set publ_pagado = 1
		where publ_id = @publ_id
	else
		update MAS_INSERTIVO.COMPRA
			set comp_pagado = 1
		where comp_id = @comp_id
end