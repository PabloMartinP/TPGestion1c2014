create table mas_insertivo.Rol
(
rol_id int identity(1,1), 
rol_nombre nvarchar(50) not null, 
rol_habilitado bit default 1 not null
);
create table mas_insertivo.Funcionalidad
(
func_id int identity(1,1), 
func_nombre nvarchar(50) not null
);
create table mas_insertivo.Rol_Funcionalidad
(
rol_id int not null, 
func_id int not null
);

create table mas_insertivo.Tipo_Usuario
(
tusr_id tinyint not null,
tusr_descripcion nvarchar(50)
);

create table mas_insertivo.Usuario
(
usua_id int identity(1,1), 
usua_name nvarchar(50)  not null, 
usua_password nvarchar(64) not null, 
usua_habilitado bit default 1 not null, 
usua_eliminado bit default 0 not null, 
usua_cantidadDeIntentos smallint default 0 not null,
usua_primera_vez bit default 1 not null, 
usua_tipo tinyint not null
);

create table mas_insertivo.Cliente
(
clie_usuario int not null,
clie_nombre nvarchar(255),
clie_apellido nvarchar(255),
clie_tipo_doc int not null,
clie_num_doc numeric(18,0) not null,
clie_mail nvarchar(255),
clie_telefono nvarchar(50),
clie_calle nvarchar(255),
clie_num_calle numeric(18,0),
clie_piso  numeric(18,0),
clie_depto nvarchar(50),
clie_localidad nvarchar(255),
clie_cod_postal nvarchar(50),
clie_fecha_nac datetime,
clie_cuil nvarchar(50), 
clie_puntuacion tinyint default 0 not null
);

create table mas_insertivo.Tipo_Documento
(
tdoc_id int identity(1,1),
tdoc_nombre char(3) not null
);

create table mas_insertivo.Empresa
(
empr_usuario int not null,
empr_razon_social nvarchar(255),
empr_mail nvarchar(50),
empr_telefono nvarchar(50),
empr_calle nvarchar(255),
empr_num_calle numeric(18,0),
empr_piso  numeric(18,0),
empr_depto nvarchar(50),
empr_localidad nvarchar(255),
empr_cod_postal nvarchar(50),
empr_ciudad nvarchar(255),
empr_cuit nvarchar(50),
empr_nombre_contacto nvarchar(255),
empr_fecha_creacion datetime,
empr_puntuacion tinyint default 0 not null  
);

create table mas_insertivo.Usuario_Rol
(
usua_id int not null, 
rol_id int not null
);

create table mas_insertivo.Rubro --drop table mas_insertivo.Rubros
(
rubr_id int identity(1,1),
rubr_codigo nvarchar(50), 
rubr_descripcion nvarchar(255)
);

create table mas_insertivo.Bonificacion
(
boni_usuario int not null, 
boni_visibilidad tinyint not null, 
boni_cant_publicaciones smallint default 0 not null
);

create table mas_insertivo.Visibilidad--drop table mas_insertivo.Visibilidad alter table mas_insertivo.Visibilidad drop constraint pk_visibilidad
(
visi_id tinyint not null, 
visi_descripcion nvarchar(255), 
visi_precio numeric(18,2), 
visi_porcentaje numeric(18,2),
visi_prioridad smallint not null,
visi_duracion_dias smallint not null default 7 -- poner en la estrategia que el default es 7 dias
);

create table mas_insertivo.Publicacion_Estado
(
epub_id int identity(1,1), 
epub_descripcion nvarchar(255)
);

create table mas_insertivo.Tipo_Publicacion
(
tpub_id int identity(1,1), 
tpub_descripcion nvarchar(255)
);

create table mas_insertivo.Publicacion --drop table mas_insertivo.Publicaciones
(
publ_id numeric(18,0) identity(1,1) not null, -- identity que inicia con el max de la migracion de publicacion_cod. DBCC CHECKIDENT('tableName', RESEED, NEW_RESEED_VALUE)http://stackoverflow.com/questions/19155775/how-to-update-identity-column-in-sql-server
publ_descripcion nvarchar(255), 
publ_stock numeric(18,0), 
publ_fecha datetime, 
publ_fecha_vencimiento datetime, 
publ_precio numeric(18,2), 
publ_visibilidad tinyint,--fk
publ_usuario int, --fk
publ_estado int, --fk
publ_tipo int, --fk
publ_permitir_preguntas bit default 1 
);

create table mas_insertivo.Publicacion_Rubro
(
publ_id numeric(18,0)not null, 
rubr_id int not null,
);

create table mas_insertivo.Compra
(
comp_id int identity(1,1),
comp_publicacion numeric(18,0), 
comp_fecha datetime, 
comp_cantidad numeric(18,0),
comp_usuario int not null,
comp_pagado bit default 0 not null
);

create table mas_insertivo.Oferta
(
ofer_id int identity(1,1), 
ofer_publicacion numeric(18,0),
ofer_fecha datetime, 
ofer_monto numeric(18,2), 
ofer_usuario int not null,
ofer_ganadora bit default 0 not null,
ofer_pagado bit default 0 not null
);

create table mas_insertivo.Calificacion -- drop table mas_insertivo.Calificaciones
(
cali_publicacion numeric(18,0) not null,
cali_usuario int, 
cali_cant_estrellas smallint, 
cali_descripcion nvarchar(255)
);

create table mas_insertivo.Tipo_Pago
(
pago_id int identity(1,1), 
pago_descripcion nvarchar(255)
);

create table mas_insertivo.Detalle_Tarjeta(
tarj_numero numeric(16,0) not null, --pk
tarj_usuario int, --fk
tarj_fecha_vencimiento datetime not null,
tarj_nombre nvarchar(255) not null,
tarj_codigo_ver tinyint not null
);

create table mas_insertivo.Factura_Cabecera
(
fact_id int not null, 
fact_fecha datetime, 
fact_usuario int, 
--fact_pago int, 
fact_total numeric(18,2)
);

create table mas_insertivo.Factura_Item
(
item_factura int not null, 
item_renglon int not null, 
item_publicacion numeric(18,0),
item_cantidad numeric(18,0), 
item_monto numeric(18,2)
);

create table mas_insertivo.Pregunta
(
preg_id int identity(1,1), 
preg_publicacion numeric(18,0) not null, 
preg_usuario int, 
preg_descripcion nvarchar(255), 
preg_respuesta nvarchar(255) , 
preg_fecha datetime
);
 
