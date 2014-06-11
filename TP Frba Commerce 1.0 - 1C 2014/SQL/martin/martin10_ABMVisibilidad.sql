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
	--select * from mas_insertivo.visibilidad;
	insert into mas_insertivo.visibilidad
	(Visi_codigo, Visi_descripcion, Visi_Precio, Visi_porcentaje, Visi_duracion_dias, visi_prioridad)
	values
	(@codigo, @descripcion, @precio, @porcentaje, @duraciondias, @prioridad)	
end
go-----------------
create proc mas_insertivo.visi_editar
@id int, 
@codigo numeric(18,0), 
@descripcion nvarchar(255),
@precio numeric(18,2), 
@porcentaje numeric(18,2), 
@duraciondias smallint, 
@prioridad smallint 
as
begin
	update mas_insertivo.visibilidad
		set  Visi_codigo =@codigo, 
			Visi_descripcion = @descripcion, 
			Visi_Precio= @precio ,
			Visi_porcentaje = @porcentaje, 
			Visi_duracion_dias = @duraciondias, 
			visi_prioridad = @prioridad
		where visi_id = @id
end

go-----------------
create proc mas_insertivo.Visi_Filtrar  
@descripcion nvarchar(255)  
as  
begin  
 select * from mas_insertivo.visibilidad   
 where visi_descripcion like '%'+ @descripcion +'%'  
end
go-----------------
create proc mas_insertivo.visi_eliminar
@id int
as
begin
	delete from MAS_INSERTIVO.VISIBILIDAD
	where visi_id = @id
end
go-----------------

go-----------------

go-----------------

go-----------------

go-----------------

go-----------------

go-----------------

