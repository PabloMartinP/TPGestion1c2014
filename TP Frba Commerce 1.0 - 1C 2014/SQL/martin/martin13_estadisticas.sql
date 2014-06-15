create proc mas_insertivo.CantidadPublicacionGratuitas
@usuario int
as
begin
	select COUNT(*) from MAS_INSERTIVO.PUBLICACION
	where publ_visi_precio = 0 and publ_visi_porcentaje = 0
		and publ_usuario = @usuario		
end
go
------------------------------------------
-- Clientes con mayor cantidad de publicaciones sin calificar
declare @anio int;
declare @cuarto int;

set @anio = 2014;
set @cuarto = 4;

select top 5 usua_username, COUNT(comp_id) as calificaciones_pendientes
from mas_insertivo.USUARIO, mas_insertivo.COMPRA
where usua_id = comp_usuario
and comp_calificacion is null
and DATEPART(YEAR, comp_fecha) = @anio
and DATEPART(QUARTER, comp_fecha) = @cuarto
group by usua_username
order by 2 desc;
------------------------------------------------------------
-- Vendedores con mayores calificaciones
go
declare @anio int;
declare @cuarto int;

set @anio = 2014;
set @cuarto = 1;

select top 5 usua_username,SUM(cali_cant_estrellas) / COUNT(*) as calificacion
from mas_insertivo.USUARIO, mas_insertivo.CALIFICACION
where usua_id = cali_usuario_calificado
and DATEPART(YEAR, cali_fecha) = @anio
and DATEPART(QUARTER, cali_fecha) = @cuarto
group by usua_username
order by 2 desc, COUNT(*) desc; -- Si tiene mas votos, deberia tener prioridad

-------------------------------------------
-- Vendedores con mayor facturacion
declare @anio int;
declare @cuarto int;

set @anio = 2014;
set @cuarto = 4;
select top 5 usua_username, SUM(fact_total) as facturacion_total
from MAS_INSERTIVO.USUARIO, MAS_INSERTIVO.FACTURA_CABECERA
where usua_id = fact_usuario
and DATEPART(YEAR, fact_fecha) = @anio
and DATEPART(QUARTER, fact_fecha) = @cuarto
group by usua_username
order by 2 desc;

-------------------------------------------------------------
declare @anio int;
declare @cuarto int;

set @anio = 2013;
set @cuarto = 4;
select 
DATEPART(YEAR, publ_fecha) as año,
DATEPART(MONTH, publ_fecha) as mes,
publ_visibilidad as visibilidad,
SUM(publ_stock) as productos_no_vendidos
from MAS_INSERTIVO.USUARIO, MAS_INSERTIVO.PUBLICACION
where usua_id = publ_usuario
and DATEPART(YEAR, publ_fecha) = @anio
and DATEPART(QUARTER, publ_fecha) = @cuarto
and publ_stock > 0
group by usua_username, DATEPART(YEAR, publ_fecha), DATEPART(MONTH, publ_fecha), publ_visibilidad
order by 2 desc, 3 desc, 4 desc; -- año, mes, visibilidad
