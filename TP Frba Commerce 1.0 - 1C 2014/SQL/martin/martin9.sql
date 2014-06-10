create view mas_insertivo.vw_ofertasGanadoras
as
	select * from MAS_INSERTIVO.oferta where ofer_ganadora = 1
go
create view mas_insertivo.vw_publicacionesFinalizadas
as
	select * from MAS_INSERTIVO.Publicacion
	where publ_estado = 4
go
create view mas_insertivo.vw_PublicacionesAFacturar
as
	select comp_id, comP_publicacion, publ_descripcion Descripcion, comp_fecha Fecha, 
		tpub_descripcion Tipo, 
		comp_cantidad, 
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
	select 0, publ_id, 'Comision por publicacion' Publicacion, GETDATE(), 'Comision', 1, publ_visi_precio
	from MAS_INSERTIVO.publicacion 


