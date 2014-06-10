--select * from mas_insertivo.visibilidad;
create proc mas_insertivo.visi_agregar
@codigo numeric(18,0), 
@descripcion nvarchar(255),
@precio numeric(18,2), 
@porcentaje numeric(18,2), 
@duraciondias smallint, 
@prioridad smallint 
as
begin
	select * from mas_insertivo.visibilidad;
	insert into mas_insertivo.visibilidad
	(Visi_codigo, Visi_descripcion, Visi_Precio, Visi_porcentaje, Visi_duracion_dias, visi_prioridad)
	values
	(@codigo, @descripcion, @precio, @porcentaje, @duraciondias, @prioridad)	
end