select * from gd_esquema.Maestra

select * from Usuarios --delete from usuarios

insert into usuarios
(Usuario_UserName, Usuario_Password)
select distinct convert(nvarchar,Cli_Dni) UserName, '123' Pass/*, 
	Cli_Apeliido, Cli_Nombre, Cli_Fecha_Nac, Cli_Mail, 
	Cli_Dom_Calle, Cli_Nro_Calle, Cli_Piso, Cli_Depto, Cli_Cod_Postal*/
from gd_esquema.Maestra where convert(nvarchar,Cli_Dni) is not null
union
select distinct convert(nvarchar,Publ_Cli_Dni) UserName, '123' as Pass/*,
	Publ_Cli_Apeliido, Publ_Cli_Nombre, Publ_Cli_Fecha_Nac, Publ_Cli_Mail, 
	Publ_Cli_Dom_Calle, Publ_Cli_Nro_Calle, Publ_Cli_Piso, Publ_Cli_Depto, Publ_Cli_Cod_Postal*/
from gd_esquema.Maestra where convert(nvarchar,Publ_Cli_Dni) is not null
union
select distinct Publ_Empresa_Cuit, '123' from gd_esquema.Maestra where Publ_Empresa_Cuit is not null



--select * from rubros
select distinct Publicacion_Rubro_Descripcion from gd_esquema.Maestra

--select * from visibilidades
insert into visibilidades
select distinct Publicacion_Visibilidad_Cod, Publicacion_Visibilidad_Desc, Publicacion_Visibilidad_Precio, Publicacion_Visibilidad_Precio
from gd_esquema.Maestra

--select * from Publicacion_Estados
insert into Publicacion_Estados 
values
('Borrador'),('Activa'),('Pausada'),('Finalizada')
select distinct Publicacion_Estado from gd_esquema.Maestra

--select * from tipos
insert into Publicacion_Tipos
select distinct Publicacion_Tipo from gd_esquema.Maestra
/*
--select * from publicaciones
insert into publicaciones--clientesssssssssssssssssssssssssssssssss
select distinct Publicacion_Cod, Publicacion_Descripcion, Publicacion_Stock, 
	Publicacion_Fecha, Publicacion_Fecha_Venc, 
	Publicacion_Precio, 
	(select visi_ID from visibilidades where visi_ID = Publicacion_Visibilidad_Cod) Publ_Visibilidad, 
	(select Usuario_ID from usuarios where Usuario_UserName = convert(nvarchar,Publ_Cli_Dni) ) Publicacion_Usuario, 
	(select Tipo_ID from tipos where tipo_Descripcion = Publicacion_Tipo) Publicacion_Tipo, 
	0 PermitirPreguntas		
from gd_esquema.Maestra where Publ_Cli_Dni is not null

insert into publicaciones--EMPRESASSSSSSSSSSSSSSSSSSSSSSSSSSSSS
select distinct Publicacion_Cod, Publicacion_Descripcion, Publicacion_Stock, 
	Publicacion_Fecha, Publicacion_Fecha_Venc, 
	Publicacion_Precio, 
	(select visi_ID from visibilidades where visi_ID = Publicacion_Visibilidad_Cod) Publ_Visibilidad, 
	(select Usuario_ID from usuarios where Usuario_UserName = Publ_Empresa_Cuit ) Publicacion_Usuario, 
	(select Tipo_ID from tipos where tipo_Descripcion = Publicacion_Tipo) Publicacion_Tipo, 
	0 PermitirPreguntas		
from gd_esquema.Maestra where Publ_Empresa_Cuit is not null
*/
-----------------------select distinct * from gd_esquema.Maestra order by Publicacion_COd, Publicacion_TIPO
-----------------------select * from gd_esquema.Maestra order by Publicacion_COd, Publicacion_TIPO
--begin tran rollback commit
insert into publicaciones --select * from publicaciones
(Publ_ID, Publ_Descripcion, Publ_Stock, Publ_Fecha, Publ_Fecha_Vencimiento, Publ_Precio, Publ_Visibilidad, Publ_Usuario, Publ_Estado, Publ_Tipo, Publ_permitirPreguntas)
select distinct Publicacion_Cod, Publicacion_Descripcion, Publicacion_Stock, 
	Publicacion_Fecha, Publicacion_Fecha_Venc, 
	Publicacion_Precio, 
	(select visi_ID from visibilidades where visi_ID = Publicacion_Visibilidad_Cod) Publ_Visibilidad, 
	(select Usuario_ID from usuarios 
		where Usuario_UserName = Publ_Empresa_Cuit  or Usuario_UserName = convert(nvarchar,Publ_Cli_Dni)		
		) Publicacion_Usuario, 
	4 Estado, --finalizada
	(select Tipo_ID from Publicacion_tipos where tipo_Descripcion = Publicacion_Tipo) Publicacion_Tipo, 
	0 PermitirPreguntas		
from gd_esquema.Maestra 
--select Publicacion_Cod, * from gd_esquema.Maestra where Publicacion_Cod not in (select Publicacion_Cod from gd_esquema.Maestra where Factura_Nro is not null )


--Compras select * from compras
insert into Compras
select Publicacion_Cod, Compra_Fecha, Compra_Cantidad from gd_esquema.Maestra where Compra_Fecha is not null

--select * from ofertas
insert into ofertas
select Publicacion_Cod, Oferta_Fecha, Oferta_Monto from gd_esquema.Maestra where Oferta_Fecha is not null


--select * from calificaciones
insert into calificaciones
select Calificacion_Codigo, 
	(select Usuario_ID from usuarios 
		where Usuario_UserName = Publ_Empresa_Cuit  or Usuario_UserName = convert(nvarchar,Publ_Cli_Dni)		
		) Cali_Usuario, 
	Publicacion_COd,
	Calificacion_Cant_Estrellas, Calificacion_Descripcion 
	from gd_esquema.Maestra where Calificacion_Codigo is not null
	
	
select * from gd_esquema.Maestra where Factura_Fecha is not null order by Factura_Nro

--select * from facturas_pagos
insert into facturas_pagos
values
('Efectivo'), ('Tarjeta');


--select * from Facturas_Cabecera
insert into Facturas_Cabecera
select distinct Factura_Nro, Factura_Fecha,  
	(select Usuario_ID from usuarios 
		where Usuario_UserName = Publ_Empresa_Cuit  or Usuario_UserName = convert(nvarchar,Publ_Cli_Dni)		
		) Fact_Usuario, 
	1 Fact_pago, --EFECTIVO
	Factura_Total
	from gd_esquema.Maestra where Factura_Nro is not null

select * from Facturas_Items
insert into Facturas_Items
select Factura_Nro, 
	row_number() over (PARTITION BY Publicacion_COD order by Publicacion_Cod) Item_Renglon,
	Publicacion_Cod, 	
	Item_Factura_Cantidad, Item_Factura_Monto
	from gd_esquema.Maestra where Item_Factura_Monto is not null
go---------------------------------
