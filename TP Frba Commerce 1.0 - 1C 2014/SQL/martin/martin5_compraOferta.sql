--select * from MAS_INSERTIVO.PREGUNTA
--select * from MAS_INSERTIVO.COMPRA
create proc Mas_insertivo.Comprar
@publicacion int, 
@fecha datetime, 
@cantidad decimal(18,0), 
@usuario int
as
begin
	insert into MAS_INSERTIVO.COMPRA
	(comp_publicacion, comp_fecha, comp_cantidad, comp_usuario)
	values
	(@publicacion, @fecha, @cantidad, @usuario)	
end
go-----------------------------
create proc mas_insertivo.Ofertar
@publicacion int, 
@fecha datetime, 
@monto decimal(18,0), 
@usuario int
as
begin
	insert into MAS_INSERTIVO.OFERTA--select * from MAS_INSERTIVO.OFERTA
	(OFER_publicacion, OFER_fecha, ofer_monto, OFER_usuario)
	values
	(@publicacion, @fecha, @monto, @usuario)	
end
