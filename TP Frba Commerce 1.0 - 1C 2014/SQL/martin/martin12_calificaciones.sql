create proc mas_insertivo.historial_compras
@usuario int
as
begin
	select comp_publicacion, publ_descripcion, comp_cantidad, 
		publ_precio * comp_cantidad	as Precio	
	from MAS_INSERTIVO.COMPRA
	left join MAS_INSERTIVO.PUBLICACION on comp_publicacion = publ_id
	where publ_tipo = 1 --compraInmediata 
		and comp_usuario = @usuario
end
go
create proc MAS_INSERTIVO.Historial_Oferta
@usuario int
as
begin
	select ofer_publicacion, publ_descripcion, ofer_monto, ofer_ganadora
	from MAS_INSERTIVO.OFERTA
	left join MAS_INSERTIVO.PUBLICACION on ofer_publicacion = publ_id
	where ofer_usuario = @usuario
end
go
