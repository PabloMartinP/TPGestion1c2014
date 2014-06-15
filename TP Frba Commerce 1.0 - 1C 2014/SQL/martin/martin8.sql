create view mas_insertivo.vw_Personas 
as
	select usua_id, (clie_apellido + ', ' + clie_nombre ) as Nombre from MAS_INSERTIVO.vw_usuario
	inner join MAS_INSERTIVO.CLIENTE on usua_id = clie_usuario
	union
	select usua_id, (empr_razon_social ) as Nombre from MAS_INSERTIVO.vw_usuario	
	inner join MAS_INSERTIVO.EMPRESA on usua_id = empr_usuario	
go
create view mas_insertivo.vw_publicacion_paraComprarOfertar  
as  
 select  publ_id, publ_descripcion, publ_stock, publ_fecha_venc, publ_precio, publ_usuario, p.Nombre as Vendedor, tpub_descripcion, visi_prioridad from MAS_INSERTIVO.PUBLICACION   
 left join MAS_INSERTIVO.VISIBILIDAD on visi_id = publ_visibilidad
 left join MAS_INSERTIVO.TIPO_PUBLICACION on publ_tipo = tpub_id
 left join mas_insertivo.vw_Personas p on publ_usuario = usua_id 
 where ((publ_tipo = 1 and publ_stock>0)  --compra inmediata y con stock  
  or (publ_tipo = 2))--subasta   
  and (publ_estado = 2)--estado activa  
  
 go------------------------------
create proc mas_insertivo.CambiarPassword
@usuario int, 
@password nvarchar(64)
as
begin
	update MAS_INSERTIVO.USUARIO
		set usua_password  = @password		
	where usua_id = @usuario
end

go----------------------------
