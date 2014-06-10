
create view mas_insertivo.vw_publicacion_paraComprarOfertar  
as  
 select top 100 percent publ_id, publ_descripcion, publ_stock, publ_precio, tpub_descripcion, publ_estado, publ_fecha_venc, publ_usuario, publ_visibilidad--, r.*  
 from MAS_INSERTIVO.PUBLICACION  
 left join MAS_INSERTIVO.TIPO_PUBLICACION on publ_tipo = tpub_id  
 inner join MAS_INSERTIVO.VISIBILIDAD on visi_id = publ_visibilidad
 --left  join MAS_INSERTIVO.PUBLICACION_RUBRO pr on pr.prubr_publicacion = publ_id  
 --left join MAS_INSERTIVO.RUBRO r on r.rubr_id = pr.prubr_rubro  
 where publ_estado = 2--estado activa  
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
