use [GD1C2014];

/****** Creacion del esquema MAS_INSERTIVO ******/
if not exists (
	select	name
	from	sys.schemas
	where	name = 'MAS_INSERTIVO' )
begin
	exec ('create schema [MAS_INSERTIVO] authorization [gd]');
end

/********************************/
/****** CREACION DE TABLAS ******/
/********************************/

/****** Creacion de la tabla ROL ******/
create table MAS_INSERTIVO.ROL
(
rol_id int identity(1,1),
rol_nombre nvarchar(50) not null,
rol_habilitado bit default 1 not null
);

/****** Creacion de la tabla FUNCIONALIDAD ******/
create table MAS_INSERTIVO.FUNCIONALIDAD
(
func_id int identity(1,1),
func_nombre nvarchar(50) not null
);

/****** Creacion de la tabla ROL_FUNCIONALIDAD ******/
create table MAS_INSERTIVO.ROL_FUNCIONALIDAD
(
rfunc_rol int not null,
rfunc_funcionalidad int not null
);

/****** Creacion de la tabla USUARIO ******/
create table MAS_INSERTIVO.USUARIO
(
usua_id int identity(1,1),
usua_username nvarchar(50) not null,
usua_password nvarchar(64) not null,
usua_habilitado bit default 1 not null,
usua_eliminado bit default 0 not null,
usua_cant_intentos int default 0 not null,
usua_primer_login bit default 1 not null,
usua_calific_pendientes int default 0 not null,
usua_suma_calificaciones int default 0 not null,
usua_cant_calificaciones int default 0 not null,
usua_rendiciones_pendientes int default 0 not null  -- Rendiciones pendientes de compras facturadas
);

/****** Creacion de la tabla USUARIO_ROL ******/
create table MAS_INSERTIVO.USUARIO_ROL
(
urol_usuario int not null,
urol_rol int not null
);

/****** Creacion de la tabla TIPO_DOCUMENTO ******/
create table MAS_INSERTIVO.TIPO_DOCUMENTO
(
tdoc_id int identity(1,1),
tdoc_nombre nvarchar(10) not null
);

/****** Creacion de la tabla CLIENTE ******/
create table MAS_INSERTIVO.CLIENTE
(
clie_usuario int not null,
clie_tipo_doc int not null,
clie_num_doc numeric(18,0) not null,
clie_apellido nvarchar(255),
clie_nombre nvarchar(255),
clie_mail nvarchar(255),
clie_telefono nvarchar(50),
clie_dom_calle nvarchar(255),
clie_num_calle numeric(18,0),
clie_piso numeric(18,0),
clie_depto nvarchar(50),
clie_localidad nvarchar(255),
clie_cod_postal nvarchar(50),
clie_fecha_nac datetime,
clie_cuil nvarchar(50)
);

/****** Creacion de la tabla EMPRESA ******/
create table MAS_INSERTIVO.EMPRESA
(
empr_usuario int not null,
empr_razon_social nvarchar(255) not null,
empr_mail nvarchar(50),
empr_telefono nvarchar(50),
empr_dom_calle nvarchar(255),
empr_num_calle numeric(18,0),
empr_piso  numeric(18,0),
empr_depto nvarchar(50),
empr_localidad nvarchar(255),
empr_cod_postal nvarchar(50),
empr_ciudad nvarchar(255),
empr_cuit nvarchar(50) not null,
empr_nombre_contacto nvarchar(255),
empr_fecha_creacion datetime
);

/****** Creacion de la tabla RUBRO ******/
create table MAS_INSERTIVO.RUBRO
(
rubr_id int identity(1,1),
rubr_codigo nvarchar(50) not null,
rubr_descripcion nvarchar(255)
);

/****** Creacion de la tabla VISIBILIDAD ******/
create table MAS_INSERTIVO.VISIBILIDAD
(
visi_id int identity(1,1),
visi_codigo numeric(18,0) not null,
visi_descripcion nvarchar(255) not null,
visi_precio numeric(18,2) default 0 not null, -- prioridad
visi_porcentaje numeric(18,2) default 0 not null,
visi_duracion_dias smallint default 7 not null, -- poner en la estrategia que el default es 7 dias
visi_prioridad smallint default 1 not null
);

/****** Creacion de la tabla BONIFICACION ******/
create table MAS_INSERTIVO.BONIFICACION
(
boni_usuario int not null,
boni_visibilidad int not null,
boni_cant_publicaciones smallint default 0 not null
);

/****** Creacion de la tabla TIPO_PUBLICACION ******/
create table MAS_INSERTIVO.TIPO_PUBLICACION
(
tpub_id int identity(1,1),
tpub_descripcion nvarchar(255) not null
);

/****** Creacion de la tabla ESTADO_PUBLICACION ******/
create table MAS_INSERTIVO.ESTADO_PUBLICACION
(
epub_id int identity(1,1),
epub_descripcion nvarchar(255) not null
);

/****** Creacion de la tabla PUBLICACION ******/
create table MAS_INSERTIVO.PUBLICACION
(
publ_id numeric(18,0) identity(1,1) not null,
publ_descripcion nvarchar(255),
publ_stock numeric(18,0),
publ_fecha datetime,
publ_fecha_venc datetime,
publ_precio numeric(18,2),
publ_visibilidad int not null,
publ_visi_precio numeric(18,2) not null,
publ_visi_porcentaje numeric(18,2) not null,
publ_usuario int not null, -- El que publico
publ_estado int not null,
publ_tipo int not null,
publ_permitir_preguntas bit default 1 not null, 
publ_pagado bit default 0 not null
);

/****** Creacion de la tabla PUBLICACION_RUBRO ******/
create table MAS_INSERTIVO.PUBLICACION_RUBRO
(
prubr_publicacion numeric(18,0) not null, 
prubr_rubro int not null,
);

/****** Creacion de la tabla COMPRA ******/
create table MAS_INSERTIVO.COMPRA
(
comp_id int identity(1,1),
comp_publicacion numeric(18,0), 
comp_fecha datetime, 
comp_cantidad numeric(18,0),
comp_usuario int not null, -- El que compro
comp_pagado bit default 0 not null,
comp_calificacion numeric(18,0)
);

/****** Creacion de la tabla OFERTA ******/
create table MAS_INSERTIVO.OFERTA
(
ofer_id int identity(1,1),
ofer_publicacion numeric(18,0),
ofer_fecha datetime, 
ofer_monto numeric(18,2), 
ofer_usuario int not null, -- El que oferto
ofer_ganadora bit default 0 not null
);

/****** Creacion de la tabla CALIFICACION ******/
create table MAS_INSERTIVO.CALIFICACION
(
cali_id numeric(18,0) identity(1,1),
cali_usuario_calificado int not null, -- El que publico
cali_usuario_calificador int not null, -- El que califico
cali_cant_estrellas tinyint not null, 
cali_descripcion nvarchar(255),
cali_fecha datetime not null  -- Seleccionamos la fecha de compra como fecha de calificacion para los datos migrados
);

/****** Creacion de la tabla TIPO_PAGO ******/
create table MAS_INSERTIVO.TIPO_PAGO
(
tpago_id int identity(1,1), 
tpago_descripcion nvarchar(255)
);

/****** Creacion de la tabla DETALLE_TARJETA ******/
create table MAS_INSERTIVO.DETALLE_TARJETA
(
tarj_numero numeric(16,0) not null,
tarj_usuario int not null,
tarj_fecha_vencimiento datetime not null,
tarj_nombre nvarchar(255) not null,
tarj_codigo_ver tinyint not null
);

/****** Creacion de la tabla FACTURA_CABECERA ******/
create table MAS_INSERTIVO.FACTURA_CABECERA
(
fact_id int identity(1,1), 
fact_fecha datetime,
fact_usuario int not null, 
fact_tipo_pago int not null, 
fact_total numeric(18,2) not null
);

/****** Creacion de la tabla FACTURA_ITEM ******/
create table MAS_INSERTIVO.FACTURA_ITEM
(
item_factura int not null, 
item_renglon int not null, 
item_publicacion numeric(18,0) not null,
item_cantidad numeric(18,0), 
item_monto numeric(18,2)
);

/****** Creacion de la tabla PREGUNTA ******/
create table MAS_INSERTIVO.PREGUNTA
(
preg_id int identity(1,1), 
preg_publicacion numeric(18,0) not null, 
preg_usuario int not null, 
preg_descripcion nvarchar(255), 
preg_respuesta nvarchar(255) , 
preg_fecha datetime
);


/********************************/
/****** MIGRACION DE DATOS ******/
/********************************/

/****** Insercion de datos en la tabla ROL ******/
insert into MAS_INSERTIVO.ROL
(rol_nombre)
values
('Empresa'),
('Administrativo'),
('Cliente');

/****** Insercion de datos en la tabla FUNCIONALIDAD ******/
insert into MAS_INSERTIVO.FUNCIONALIDAD
(func_nombre)
values
--('Login y seguridad'),
('ABM de Rol'),
('Registro de Usuario'),
('ABM de Cliente'),
('ABM de Empresa'),
('ABM de Rubro'),
('ABM Visibilidad De Publicación'),
('Generar Publicación'),
('Editar Publicación'),
('Gestión de Preguntas'),
('Comprar/Ofertar'),
('Historial del Cliente'),
('Calificar al Vendedor'),
('Facturar Publicaciones'),
('Listado Estadístico');

/****** Insercion de datos en la tabla ROL_FUNCIONALIDAD ******/





/****** Insercion de datos en la tabla USUARIO ******/
-- Password w23e en SHA-256
declare @sha_password nvarchar(64) = 'E6B87050BFCB8143FCB8DB170A4DC9ED0D904DDD3E2A4AD1B1E8DCFDC9BE7';

-- Usuarios de clientes
insert into MAS_INSERTIVO.USUARIO
(usua_username, usua_password)
select distinct convert(nvarchar,Cli_Dni), @sha_password
from gd_esquema.Maestra
where Cli_Dni is not null;
-- Todos los Clientes que vendieron tambien compraron
-- Ya estan todos insertados
/*
union
select distinct convert(nvarchar,Publ_Cli_Dni), @sha_password
from gd_esquema.Maestra
where Publ_Cli_Dni is not null;
*/

-- Usuarios de empresas
insert into MAS_INSERTIVO.USUARIO
(usua_username, usua_password)
select distinct Publ_Empresa_Cuit, @sha_password
from gd_esquema.Maestra
where Publ_Empresa_Cuit is not null;

-- Usuario administrador
insert into MAS_INSERTIVO.USUARIO
(usua_username, usua_password, usua_primer_login)
values
('admin', @sha_password, 0); -- Password w23e en SHA-256, No es el primer intento

/****** Insercion de datos en la tabla TIPO_DOCUMENTO ******/
insert into MAS_INSERTIVO.TIPO_DOCUMENTO
(tdoc_nombre)
values
('DNI'),
('CI'),
('LC'),
('LE'),
('PASAPORTE');

/****** Insercion de datos en la tabla CLIENTE ******/
-- Habia 28 clientes en la tabla Maestra
declare @var_tipo_doc int;
set @var_tipo_doc = (select tdoc_id from MAS_INSERTIVO.TIPO_DOCUMENTO where tdoc_nombre = 'DNI');

insert into MAS_INSERTIVO.CLIENTE
(clie_usuario, clie_tipo_doc, clie_num_doc, clie_apellido, clie_nombre,
clie_mail, clie_dom_calle, clie_num_calle, clie_piso,
clie_depto, clie_cod_postal, clie_fecha_nac)
select distinct usua_id, @var_tipo_doc, Cli_Dni, Cli_Apeliido, Cli_Nombre,
Cli_Mail, Cli_Dom_Calle, Cli_Nro_Calle, Cli_Piso,
Cli_Depto, Cli_Cod_Postal, Cli_Fecha_Nac
from gd_esquema.Maestra, MAS_INSERTIVO.USUARIO
where Cli_Dni is not null
and convert(nvarchar, Cli_Dni) = usua_username;
-- Todos los Clientes que vendieron tambien compraron
-- Ya estan todos insertados
/*
union
select distinct usua_id, @var_tipo_doc, Publ_Cli_Dni, Publ_Cli_Apeliido, Publ_Cli_Nombre,
Publ_Cli_Mail, Publ_Cli_Dom_Calle, Publ_Cli_Nro_Calle, Publ_Cli_Piso,
Publ_Cli_Depto, Publ_Cli_Cod_Postal, Publ_Cli_Fecha_Nac
from gd_esquema.Maestra, MAS_INSERTIVO.USUARIO
where Publ_Cli_Dni is not null
and convert(nvarchar, Publ_Cli_Dni) = usua_username
;
*/

/****** Insercion de datos en la tabla EMPRESA ******/
-- Habia 64 empresas en la tabla Maestra
insert into MAS_INSERTIVO.EMPRESA
(empr_usuario, empr_razon_social, empr_mail,
empr_dom_calle, empr_num_calle, empr_piso,
empr_depto, empr_cod_postal, empr_cuit, empr_fecha_creacion)
select distinct usua_id, Publ_Empresa_Razon_Social, Publ_Empresa_Mail,
Publ_Empresa_Dom_Calle, Publ_Empresa_Nro_Calle, Publ_Empresa_Piso,
Publ_Empresa_Depto, Publ_Empresa_Cod_Postal, Publ_Empresa_Cuit, Publ_Empresa_Fecha_Creacion
from gd_esquema.Maestra, MAS_INSERTIVO.USUARIO
where Publ_Empresa_Cuit is not null
and Publ_Empresa_Cuit = usua_username;

/****** Insercion de datos en la tabla USUARIO_ROL ******/
-- Rol de clientes
insert into MAS_INSERTIVO.USUARIO_ROL
(urol_usuario, urol_rol)
select clie_usuario, 3 -- Cliente
from MAS_INSERTIVO.CLIENTE;

-- Rol de empresas
insert into MAS_INSERTIVO.USUARIO_ROL
(urol_usuario, urol_rol)
select empr_usuario, 1 -- Empresa
from MAS_INSERTIVO.EMPRESA;

-- Rol del usuario administrador
insert into MAS_INSERTIVO.USUARIO_ROL
(urol_usuario, urol_rol)
select usua_id, 2 -- Administrativo
from MAS_INSERTIVO.USUARIO
where usua_username = 'admin';

/****** Insercion de datos en la tabla RUBRO ******/
-- Habia 25 rubros en la tabla Maestra
insert into MAS_INSERTIVO.RUBRO
(rubr_codigo, rubr_descripcion)
select distinct 0, Publicacion_Rubro_Descripcion
from gd_esquema.Maestra;

-- Elijo el id como el codigo default
update MAS_INSERTIVO.RUBRO
set
	rubr_codigo = rubr_id;

/****** Insercion de datos en la tabla VISIBILIDAD ******/
insert into MAS_INSERTIVO.VISIBILIDAD
(visi_codigo, visi_descripcion, visi_precio, visi_porcentaje)
select distinct Publicacion_Visibilidad_Cod, Publicacion_Visibilidad_Desc,
	Publicacion_Visibilidad_Precio, Publicacion_Visibilidad_Porcentaje	
from gd_esquema.Maestra 
where Publicacion_Visibilidad_Cod is not null;

/********ACTUALIZACION DEL CAMPO PRIORIDAD********/
update v1
	set visi_prioridad = v2.Prioridad
	from MAS_INSERTIVO.VISIBILIDAD v1
	inner join (select top 5 *, 
				row_number() over (order by visi_precio) Prioridad
				from  MAS_INSERTIVO.VISIBILIDAD
				order by visi_precio) v2 on v1.visi_id = v2.visi_id

/****** Insercion de datos en la tabla BONIFICACION ******/
-- Todas las publicaciones estan finalizadas y facturadas al migrar
-- Lo manejamos en el trigger, que se crea al final

/****** Insercion de datos en la tabla TIPO_PUBLICACION ******/
insert into MAS_INSERTIVO.TIPO_PUBLICACION
(tpub_descripcion)
select distinct Publicacion_Tipo
from gd_esquema.Maestra
where Publicacion_Tipo is not null;

/****** Insercion de datos en la tabla ESTADO_PUBLICACION ******/
insert into MAS_INSERTIVO.ESTADO_PUBLICACION
(epub_descripcion)
values
('Borrador'),
('Activa'),
('Pausada'),
('Finalizada');

/****** Insercion de datos en la tabla COMPRA ******/
-- En la tabla Maestra habia 92750 compras
-- Las ofertas ganadas se tratan como compras
-- Todas las compras (ofertas ganadas) estan calificadas
insert into MAS_INSERTIVO.COMPRA
(comp_publicacion, comp_fecha, comp_cantidad, comp_usuario, comp_calificacion, comp_pagado)
select Publicacion_Cod, Compra_Fecha, Compra_Cantidad, clie_usuario, Calificacion_Codigo, 1
from gd_esquema.Maestra, MAS_INSERTIVO.CLIENTE
where Compra_Fecha is not null
and Calificacion_Codigo is not null  -- TODAS las compras estan calificadas
and Cli_Dni = clie_num_doc;

/****** Insercion de datos en la tabla PUBLICACION ******/
-- Habia 56028 publicaciones en la tabla Maestra
set identity_insert MAS_INSERTIVO.PUBLICACION ON;

insert into MAS_INSERTIVO.PUBLICACION
(publ_id, publ_descripcion,
publ_stock,
publ_fecha, publ_fecha_venc, publ_precio,
publ_visibilidad,
publ_visi_precio,
publ_visi_porcentaje,
publ_usuario,
publ_estado,
publ_tipo, 
publ_pagado
)
select distinct Publicacion_Cod, Publicacion_Descripcion,
Publicacion_Stock - ISNULL((select SUM(comp_cantidad) from MAS_INSERTIVO.COMPRA where comp_publicacion = Publicacion_Cod), 0),
Publicacion_Fecha, Publicacion_Fecha_Venc, Publicacion_Precio,
	(select visi_id from MAS_INSERTIVO.VISIBILIDAD
	where visi_codigo = Publicacion_Visibilidad_Cod),
0,0, -- visi_precio, visi_porcentaje
(select usua_id from MAS_INSERTIVO.USUARIO
	where (usua_username = CONVERT(nvarchar, Publ_Cli_Dni) and Publ_Cli_Dni is not null)
	or (usua_username = Publ_Empresa_Cuit and Publ_Empresa_Cuit is not null)),
4, -- Estado Finalizado
(select tpub_id from MAS_INSERTIVO.TIPO_PUBLICACION
	where tpub_descripcion = Publicacion_Tipo)
	,1 --pagado
from gd_esquema.Maestra;

-- Update visi_precio, visi_porcentaje
update MAS_INSERTIVO.PUBLICACION
set
	publ_visi_precio = visi_precio,
	publ_visi_porcentaje = visi_porcentaje
from
	MAS_INSERTIVO.PUBLICACION
inner join
	MAS_INSERTIVO.VISIBILIDAD
on publ_visibilidad = visi_id;

set identity_insert MAS_INSERTIVO.PUBLICACION off;

declare @var_next_publ_id numeric(18, 0);
set @var_next_publ_id = (select MAX(publ_id) from MAS_INSERTIVO.PUBLICACION);
DBCC CHECKIDENT('MAS_INSERTIVO.PUBLICACION', RESEED, @var_next_publ_id );

/****** Insercion de datos en la tabla PUBLICACION_RUBRO ******/
insert into MAS_INSERTIVO.PUBLICACION_RUBRO
(prubr_publicacion, prubr_rubro)
select distinct Publicacion_Cod, rubr_id
from gd_esquema.Maestra, MAS_INSERTIVO.RUBRO
where Publicacion_Rubro_Descripcion = rubr_descripcion;

/****** Insercion de datos en la tabla OFERTA ******/
insert into MAS_INSERTIVO.OFERTA
(ofer_publicacion, ofer_fecha, ofer_monto, ofer_usuario)
select distinct Publicacion_Cod, Oferta_Fecha, Oferta_Monto, clie_usuario
from gd_esquema.Maestra, MAS_INSERTIVO.CLIENTE
where Oferta_Fecha is not null
and Cli_Dni = clie_num_doc;

-- Update de las ofertas ganadoras
-- Las ofertas del viejo sistema se consideraron ganadoras si su monto es maximo y esta calificada (aunque no supere el precio de publicacion)
-- Para el nuevo sistema, se consideran ganadores segun condiciones del enunciado.
-- Declaración de variables
update MAS_INSERTIVO.OFERTA
set
	ofer_ganadora = 1
where ofer_id in (
select OFER1.ofer_id
from MAS_INSERTIVO.OFERTA OFER1
left outer join MAS_INSERTIVO.OFERTA OFER2
on (OFER1.ofer_publicacion = OFER2.ofer_publicacion and OFER1.ofer_monto < OFER2.ofer_monto)
where OFER2.ofer_publicacion is null);

/****** Insercion de datos en la tabla CALIFICACION ******/
-- En la tabla Maestra habia 92750 calificaciones
-- Todas las compras (ofertas ganadoras) estan calificadas
set identity_insert MAS_INSERTIVO.CALIFICACION ON;

insert into MAS_INSERTIVO.CALIFICACION
(cali_id, cali_usuario_calificado, cali_usuario_calificador, cali_cant_estrellas, cali_descripcion, cali_fecha)
select Calificacion_Codigo, 
	(select usua_id from MAS_INSERTIVO.USUARIO
		where (usua_username = CONVERT(nvarchar, Publ_Cli_Dni) and Publ_Cli_Dni is not null)
		or (usua_username = Publ_Empresa_Cuit and Publ_Empresa_Cuit is not null)), -- Calificado
	(select usua_id from MAS_INSERTIVO.USUARIO
		where (usua_username = CONVERT(nvarchar, Cli_Dni) and Cli_Dni is not null)), -- Calificador
	Calificacion_Cant_Estrellas, Calificacion_Descripcion,
	Compra_Fecha  -- Seleccionamos la fecha de compra como fecha de calificacion para los datos migrados
	from gd_esquema.maestra
	where Calificacion_Codigo is not null;

set identity_insert MAS_INSERTIVO.CALIFICACION off;

declare @var_next_cali_id numeric(18, 0);
set @var_next_cali_id = (select MAX(cali_id) from MAS_INSERTIVO.CALIFICACION);
DBCC CHECKIDENT('MAS_INSERTIVO.CALIFICACION', RESEED, @var_next_cali_id );

-- Update USUARIO - usua_suma_calificaciones, usua_cant_calificaciones
update A
set A.usua_suma_calificaciones = B.SUMA,
	A.usua_cant_calificaciones = B.CANT
from MAS_INSERTIVO.USUARIO A
join (select cali_usuario_calificado,
		SUM(cali_cant_estrellas) SUMA,
		COUNT(*) CANT
	from MAS_INSERTIVO.CALIFICACION
	group by cali_usuario_calificado) B
on B.cali_usuario_calificado = A.usua_id

/****** Insercion de datos en la tabla TIPO_PAGO ******/
insert into MAS_INSERTIVO.TIPO_PAGO
(tpago_descripcion)
values
('Efectivo'),
('Tarjeta');

/****** Insercion de datos en la tabla DETALLE_TARJETA ******/
-- No habia detalles de tarjeta en la tabla Maestra

/****** Insercion de datos en la tabla FACTURA_CABECERA ******/
-- Habia 56028 cabeceras de factura en la tabla Maestra
set identity_insert MAS_INSERTIVO.FACTURA_CABECERA ON;

insert into MAS_INSERTIVO.FACTURA_CABECERA
(fact_id, fact_fecha, fact_usuario, fact_tipo_pago, fact_total)
select distinct Factura_Nro, Factura_Fecha,
	(select usua_id from MAS_INSERTIVO.USUARIO
		where (usua_username = CONVERT(nvarchar, Publ_Cli_Dni) and Publ_Cli_Dni is not null)
		or (usua_username = Publ_Empresa_Cuit and Publ_Empresa_Cuit is not null)), tpago_id, Factura_Total
from gd_esquema.Maestra, MAS_INSERTIVO.TIPO_PAGO
where tpago_descripcion = Forma_Pago_Desc;

set identity_insert MAS_INSERTIVO.FACTURA_CABECERA off;

declare @var_next_fact_id int;
set @var_next_fact_id = (select MAX(fact_id) from MAS_INSERTIVO.FACTURA_CABECERA);
DBCC CHECKIDENT('MAS_INSERTIVO.FACTURA_CABECERA', RESEED, @var_next_fact_id );

/****** Insercion de datos en la tabla FACTURA_ITEM ******/
-- Habia 148778 items factura en la tabla Maestra
insert into MAS_INSERTIVO.FACTURA_ITEM
(item_factura, item_renglon, item_publicacion, item_cantidad, item_monto)
select Factura_Nro,
row_number() over (PARTITION BY Publicacion_COD order by Publicacion_Cod) Item_Renglon,
Publicacion_Cod, Item_Factura_Cantidad, Item_Factura_Monto
from gd_esquema.Maestra
where Item_Factura_Monto is not null;

/****** Insercion de datos en la tabla PREGUNTA ******/
-- No habia preguntas en la tabla Maestra
                                                                                                                                                                                          
/*************************************/
/****** CREACION DE CONSTRAINTS ******/
/*************************************/

/****** Creacion de constraints para la tabla ROL ******/
alter table MAS_INSERTIVO.ROL add constraint pk_rol primary key(rol_id);
alter table MAS_INSERTIVO.ROL add constraint uq_rol_nombre unique(rol_nombre);

/****** Creacion de constraints para la tabla FUNCIONALIDAD ******/
alter table MAS_INSERTIVO.FUNCIONALIDAD add constraint pk_funcionalidad primary key(func_id);
alter table MAS_INSERTIVO.FUNCIONALIDAD add constraint uq_func_nombre unique(func_nombre);

/****** Creacion de constraints para la tabla ROL_FUNCIONALIDAD ******/
alter table MAS_INSERTIVO.ROL_FUNCIONALIDAD add constraint pk_rol_funcionalidad primary key(rfunc_rol, rfunc_funcionalidad);
alter table MAS_INSERTIVO.ROL_FUNCIONALIDAD add constraint fk_rfunc_rol foreign key(rfunc_rol) references MAS_INSERTIVO.ROL(rol_id);
alter table MAS_INSERTIVO.ROL_FUNCIONALIDAD add constraint fk_rfunc_funcionalidad foreign key(rfunc_funcionalidad) references MAS_INSERTIVO.FUNCIONALIDAD(func_id);

/****** Creacion de constraints para la tabla USUARIO ******/
alter table MAS_INSERTIVO.USUARIO add constraint pk_usuario primary key(usua_id);
alter table MAS_INSERTIVO.USUARIO add constraint uq_usua_username unique(usua_username);

/****** Creacion de constraints para la tabla USUARIO_ROL ******/
alter table MAS_INSERTIVO.USUARIO_ROL add constraint pk_usuario_rol primary key(urol_usuario, urol_rol);
alter table MAS_INSERTIVO.USUARIO_ROL add constraint fk_urol_usuario foreign key (urol_usuario) references MAS_INSERTIVO.USUARIO(usua_id);
alter table MAS_INSERTIVO.USUARIO_ROL add constraint fk_urol_rol foreign key (urol_rol) references MAS_INSERTIVO.ROL(rol_id);

/****** Creacion de constraints para la tabla TIPO_DOCUMENTO ******/
alter table MAS_INSERTIVO.TIPO_DOCUMENTO add constraint pk_tipo_documento primary key(tdoc_id);
alter table MAS_INSERTIVO.TIPO_DOCUMENTO add constraint uq_tdoc_nombre unique(tdoc_nombre);

/****** Creacion de constraints para la tabla CLIENTE ******/
alter table MAS_INSERTIVO.CLIENTE add constraint pk_cliente primary key(clie_usuario);
alter table MAS_INSERTIVO.CLIENTE add constraint uq_clie_tipo_num_doc unique(clie_tipo_doc, clie_num_doc);
alter table MAS_INSERTIVO.CLIENTE add constraint fk_clie_tipo_doc foreign key(clie_tipo_doc) references MAS_INSERTIVO.TIPO_DOCUMENTO(tdoc_id);
alter table MAS_INSERTIVO.CLIENTE add constraint fk_clie_usuario foreign key(clie_usuario) references MAS_INSERTIVO.USUARIO(usua_id);

/****** Creacion de constraints para la tabla EMPRESA ******/
alter table MAS_INSERTIVO.EMPRESA add constraint pk_empresa primary key(empr_usuario);
alter table MAS_INSERTIVO.EMPRESA add constraint uq_empr_cuit unique(empr_cuit);
alter table MAS_INSERTIVO.EMPRESA add constraint uq_empr_razon_social unique(empr_razon_social);
alter table MAS_INSERTIVO.EMPRESA add constraint fk_empr_usuario foreign key (empr_usuario) references MAS_INSERTIVO.USUARIO(usua_id);

/****** Creacion de constraints para la tabla RUBRO ******/
alter table MAS_INSERTIVO.RUBRO add constraint pk_rubro primary key(rubr_id);
alter table MAS_INSERTIVO.RUBRO add constraint uq_rubr_codigo unique(rubr_codigo);

/****** Creacion de constraints para la tabla VISIBILIDAD ******/
alter table MAS_INSERTIVO.VISIBILIDAD add constraint pk_visibilidad primary key(visi_id);
alter table MAS_INSERTIVO.VISIBILIDAD add constraint uq_visi_codigo unique(visi_codigo);

/****** Creacion de constraints para la tabla BONIFICACION ******/
alter table MAS_INSERTIVO.BONIFICACION add constraint pk_bonificacion primary key(boni_usuario, boni_visibilidad );
alter table MAS_INSERTIVO.BONIFICACION add constraint fk_boni_usuario foreign key(boni_usuario) references MAS_INSERTIVO.USUARIO(usua_id);
alter table MAS_INSERTIVO.BONIFICACION add constraint fk_boni_visibilidad foreign key(boni_visibilidad) references MAS_INSERTIVO.VISIBILIDAD(visi_id);

/****** Creacion de constraints para la tabla TIPO_PUBLICACION ******/
alter table MAS_INSERTIVO.TIPO_PUBLICACION add constraint pk_tipo_publicacion primary key(tpub_id);

/****** Creacion de constraints para la tabla ESTADO_PUBLICACION ******/
alter table MAS_INSERTIVO.ESTADO_PUBLICACION add constraint pk_estado_publicacion primary key(epub_id);

/****** Creacion de constraints para la tabla PUBLICACION ******/
alter table MAS_INSERTIVO.PUBLICACION add constraint pk_publicacion primary key(publ_id);
alter table MAS_INSERTIVO.PUBLICACION add constraint fk_publ_visibilidad foreign key(publ_visibilidad) references MAS_INSERTIVO.VISIBILIDAD(visi_id);
alter table MAS_INSERTIVO.PUBLICACION add constraint fk_publ_usuario foreign key(publ_usuario) references MAS_INSERTIVO.USUARIO(usua_id);
alter table MAS_INSERTIVO.PUBLICACION add constraint fk_publ_tipo foreign key(publ_tipo) references MAS_INSERTIVO.TIPO_PUBLICACION(tpub_id);
alter table MAS_INSERTIVO.PUBLICACION add constraint fk_publ_estado foreign key(publ_estado) references MAS_INSERTIVO.ESTADO_PUBLICACION(epub_id);

/****** Creacion de constraints para la tabla PUBLICACION_RUBRO ******/
alter table MAS_INSERTIVO.PUBLICACION_RUBRO add constraint pk_publicacion_rubro primary key(prubr_publicacion, prubr_rubro);
alter table MAS_INSERTIVO.PUBLICACION_RUBRO add constraint fk_prubr_publicacion foreign key(prubr_publicacion) references MAS_INSERTIVO.PUBLICACION(publ_id);
alter table MAS_INSERTIVO.PUBLICACION_RUBRO add constraint fk_prubr_rubro foreign key(prubr_rubro) references MAS_INSERTIVO.RUBRO(rubr_id);

/****** Creacion de constraints para la tabla CALIFICACION ******/
alter table MAS_INSERTIVO.CALIFICACION add constraint pk_calificacion primary key(cali_id);
alter table MAS_INSERTIVO.CALIFICACION add constraint fk_cali_usuario_calificado foreign key(cali_usuario_calificado) references MAS_INSERTIVO.USUARIO(usua_id);
alter table MAS_INSERTIVO.CALIFICACION add constraint fk_cali_usuario_calificador foreign key(cali_usuario_calificador) references MAS_INSERTIVO.USUARIO(usua_id);

/****** Creacion de constraints para la tabla COMPRA ******/
alter table MAS_INSERTIVO.COMPRA add constraint pk_compra primary key(comp_id);
alter table MAS_INSERTIVO.COMPRA add constraint fk_comp_calificacion foreign key(comp_calificacion) references MAS_INSERTIVO.CALIFICACION(cali_id);
alter table MAS_INSERTIVO.COMPRA add constraint fk_comp_usuario foreign key(comp_usuario) references MAS_INSERTIVO.CLIENTE(clie_usuario);
alter table MAS_INSERTIVO.COMPRA add constraint fk_comp_publicacion foreign key(comp_publicacion) references MAS_INSERTIVO.PUBLICACION(publ_id);

/****** Creacion de constraints para la tabla OFERTA ******/
alter table MAS_INSERTIVO.OFERTA add constraint pk_oferta primary key(ofer_id);
alter table MAS_INSERTIVO.OFERTA add constraint fk_ofer_usuario foreign key(ofer_usuario) references MAS_INSERTIVO.CLIENTE(clie_usuario);
alter table MAS_INSERTIVO.OFERTA add constraint fk_ofer_publicacion foreign key(ofer_publicacion) references MAS_INSERTIVO.PUBLICACION(publ_id);

/****** Creacion de constraints para la tabla TIPO_PAGO ******/
alter table MAS_INSERTIVO.TIPO_PAGO add constraint pk_tipo_pago primary key(tpago_id);

/****** Creacion de constraints para la tabla DETALLE_TARJETA ******/
alter table MAS_INSERTIVO.DETALLE_TARJETA add constraint pk_detalle_tarjeta primary key(tarj_numero);
alter table MAS_INSERTIVO.DETALLE_TARJETA add constraint fk_tarj_usuario foreign key(tarj_usuario) references MAS_INSERTIVO.CLIENTE(clie_usuario);

/****** Creacion de constraints para la tabla FACTURA_CABECERA ******/
alter table MAS_INSERTIVO.FACTURA_CABECERA add constraint pk_factura_cabecera primary key(fact_id);
alter table MAS_INSERTIVO.FACTURA_CABECERA add constraint fk_fact_usuario foreign key(fact_usuario) references MAS_INSERTIVO.USUARIO(usua_id);
alter table MAS_INSERTIVO.FACTURA_CABECERA add constraint fk_fact_tipo_pago foreign key(fact_tipo_pago) references MAS_INSERTIVO.TIPO_PAGO(tpago_id);

/****** Creacion de constraints para la tabla FACTURA_ITEM ******/
alter table MAS_INSERTIVO.FACTURA_ITEM add constraint pk_factura_item primary key(item_factura, item_renglon);
alter table MAS_INSERTIVO.FACTURA_ITEM add constraint fk_item_factura foreign key(item_factura) references MAS_INSERTIVO.FACTURA_CABECERA(fact_id); 
alter table MAS_INSERTIVO.FACTURA_ITEM add constraint fk_item_publicacion foreign key(item_publicacion) references MAS_INSERTIVO.PUBLICACION(publ_id);

/****** Creacion de constraints para la tabla PREGUNTA ******/
alter table MAS_INSERTIVO.PREGUNTA add constraint pk_pregunta primary key(preg_id);
alter table MAS_INSERTIVO.PREGUNTA add constraint fk_preg_publicacion foreign key(preg_publicacion) references MAS_INSERTIVO.PUBLICACION(publ_id);
alter table MAS_INSERTIVO.PREGUNTA add constraint fk_preg_usuario foreign key(preg_usuario) references MAS_INSERTIVO.CLIENTE(clie_usuario);


/***************************************************/
/****** CREACION DE TRIGGERS - POST MIGRACION ******/
/***************************************************/

/****** Creacion de triggers para la tabla COMPRA ******/
-- Este trigger actualiza el stock luego de una compra
-- aumenta la cantidad de calificaciones pendientes del usuario que compro
-- y aumenta la cantidad de rendiciones pendientes del usuario que compro
go
create trigger MAS_INSERTIVO.TR_COMPRA_STOCK on MAS_INSERTIVO.COMPRA
after insert
as
begin
	
	update A
	set A.publ_stock = A.publ_stock - B.CANT
	from MAS_INSERTIVO.PUBLICACION A
	join (select comp_publicacion, SUM(comp_cantidad) CANT
		from INSERTED
		group by comp_publicacion) B
	on A.publ_id = B.comp_publicacion;
	
	update A
	set
		usua_calific_pendientes = usua_calific_pendientes + CANT
	from MAS_INSERTIVO.USUARIO A
	join (select comp_usuario, COUNT(*) CANT
		from INSERTED
		group by comp_usuario) B
	on A.usua_id = B.comp_usuario;
	
	update A
	set
		usua_rendiciones_pendientes = usua_rendiciones_pendientes + B.CANT
	from MAS_INSERTIVO.USUARIO A
	join (select publ_usuario, COUNT(*) CANT
		from INSERTED, MAS_INSERTIVO.PUBLICACION
		where comp_publicacion = publ_id
		group by publ_usuario) B
	on A.usua_id = B.publ_usuario;

end;

-- Este trigger decrementa la cantidad de rendiciones pendientes al pagar una compra
go
create trigger MAS_INSERTIVO.TR_COMPRA_DEC_RENDICION on MAS_INSERTIVO.COMPRA
after update
as
begin

	if update(comp_pagado)
	begin

		update A
		set A.usua_rendiciones_pendientes = usua_rendiciones_pendientes - B.CANT
		from MAS_INSERTIVO.USUARIO A
		join (select publ_usuario, COUNT(*) CANT
			from INSERTED, MAS_INSERTIVO.PUBLICACION
			where comp_publicacion = publ_id
			and comp_pagado = 1
			group by publ_usuario) B
		on A.usua_id = B.publ_usuario;
	
	end; -- end if

end;

/****** Creacion de triggers para la tabla PUBLICACION ******/
-- Este trigger finaliza las publicaciones cuando su stock llega a cero
go
create trigger MAS_INSERTIVO.TR_PUBLICACION_FINALIZADA on MAS_INSERTIVO.PUBLICACION
after update
as
begin
	if update(publ_stock)
	begin

		update A
		set A.publ_estado = 4 -- ESTADO_PUBLICACION -> Finalizada
		from MAS_INSERTIVO.PUBLICACION A
		join (select publ_id
			from INSERTED) B
		on A.publ_id = B.publ_id
		and A.publ_stock = 0;
	
	end; -- end if

end;

/****** Creacion de triggers para la tabla CALIFICACION ******/
go
create trigger MAS_INSERTIVO.TR_CALIFICACION on MAS_INSERTIVO.CALIFICACION
after insert
as
begin
	declare @nueva_calificacion int;
	declare @usuario_calificado int;
	declare @usuario_calificador int;
	
	declare cur cursor
	for select cali_cant_estrellas, cali_usuario_calificado, cali_usuario_calificador from INSERTED;

	-- apertura del cursor
	open cur
	-- Lectura de la primera fila del cursor
	fetch cur into @nueva_calificacion, @usuario_calificado, @usuario_calificador
	while (@@FETCH_STATUS = 0)
	begin
	-- Lectura de la siguiente fila de un cursor	
	update MAS_INSERTIVO.USUARIO
		set usua_cant_calificaciones = usua_cant_calificaciones + 1,
			usua_suma_calificaciones = usua_suma_calificaciones + @nueva_calificacion
			where usua_id = @usuario_calificado;
		    
	update MAS_INSERTIVO.USUARIO
		set usua_calific_pendientes = usua_calific_pendientes - 1
		where usua_id = @usuario_calificador;	    
		         
	fetch cur into @nueva_calificacion, @usuario_calificado, @usuario_calificador

	end; -- Fin del bucle WHILE
	-- Cierra el cursor
	close cur
	-- Libera los recursos del cursor
	deallocate cur

end;

/****** Creacion de triggers para la tabla ROL ******/
-- Al inhabilitar un rol,  se le debe quitar el rol a todos aquellos usuarios que lo posean
go
create trigger MAS_INSERTIVO.TR_INHABILITAR_ROL on MAS_INSERTIVO.ROL
after update
as
begin
	if update(rol_habilitado)
	begin
	
		delete from MAS_INSERTIVO.USUARIO_ROL
		where urol_rol in (select rol_id from INSERTED where rol_habilitado = 0);
	
	end; -- end if

end;

/****** Creacion de triggers para la tabla USUARIO ******/
go
create trigger MAS_INSERTIVO.tr_Usuario_cantidadDeIntentos
on MAS_INSERTIVO.USUARIO
after update
as
begin
	if update(usua_cant_intentos)
	begin
	
	update MAS_INSERTIVO.USUARIO
		set usua_habilitado = 0
	where usua_id in
	(select usua_id from INSERTED where usua_cant_intentos >= 3);
	
	end; -- end if

end;

-------------------------------------------------------------------------------
/*
go
-- TRIGGER de FACTURACION
-- Este trigger actualiza las rendiciones de compras pendientes de un usuario
create trigger MAS_INSERTIVO.TR_RENDICION_COMPRA on MAS_INSERTIVO.FACTURA_ITEM
after insert
as
begin
	declare @nueva_calificacion int;
	
	end;

go
*/
--*******************************************************************

-- TRIGGER inhabilitar rol

-- TRIGGER inhabilitar usuario (3 intentos fallidos de login)

-- TRIGGER unicidad del telefono CLIENTE (hay muchos NULL, asi que verificar por trigger)

-- TRIGGER BONIFICACION: creacion por insercion de usuario
-- creacion por insercion de visibilidad
-- aumento por publicacion
-- reset a 0 luego de 10

-- TRIGGER PUBLICACION stock 0 -> finalizada

-- TRIGGER VISIBILIDAD: Un vendedor no puede tener mas de 3 publicaciones activas simultaneamente en forma gratuita.

-- TRIGGER PREGUNTA: No puede preguntar el mismo que creo la aplicacion

-- TRIGGER OFERTA: Oferta_Monto debe ser >= a la Publicacion_Precio;
-- (OPCIONAL: las ofertas ganadoras se copian en la tabla COMPRA)

-- 3 TRIGGERS CALIFICACIONES: Total calificaciones, cant calificaciones, restar calificaciones pendientes;


go

/*********************************/
/****** CREACION DE INDICES ******/
/*********************************/
CREATE INDEX idx_usuario ON mas_insertivo.usuario(usua_username);
--select * from mas_insertivo.cliente
CREATE INDEX idx_cliente_nombre ON mas_insertivo.cliente(clie_Nombre)
CREATE INDEX idx_cliente_apellido ON mas_insertivo.cliente(clie_Apellido)
CREATE INDEX idx_cliente_doc ON mas_insertivo.cliente(clie_tipo_doc, clie_num_doc)
CREATE INDEX idx_cliente_mail ON mas_insertivo.cliente(clie_mail)

--select * from mas_insertivo.empresa
CREATE INDEX idx_empresa_razonsocial ON mas_insertivo.empresa(empr_razon_social)
CREATE INDEX idx_empresa_cuit ON mas_insertivo.empresa(empr_cuit)
CREATE INDEX idx_empresa_mail ON mas_insertivo.empresa(empr_mail)

--select * from mas_insertivo.publicacion
CREATE INDEX idx_publicacion_fecha_venc ON mas_insertivo.publicacion(publ_fecha_venc);
CREATE INDEX idx_publicacion_descripcion ON mas_insertivo.publicacion(publ_descripcion);
--CREATE INDEX idx_publicacion_estado ON mas_insertivo.publicacion(publ_estado);
--CREATE INDEX idx_publicacion_tipo ON mas_insertivo.publicacion(publ_tipo);
CREATE INDEX idx_publicacion_pagado ON mas_insertivo.publicacion(publ_pagado);

--select * from mas_insertivo.pregunta
CREATE INDEX idx_pregunta_respuesta ON mas_insertivo.pregunta(preg_respuesta);
go
--select * from mas_insertivo.calificacion
----------------------------------------
-- Historial estadistico
--declare @anio int;
--declare @cuarto int;

--set @anio = 2013;
--set @cuarto = 1;

-- Clientes con mayor cantidad de publicaciones sin calificar
--select top 5 usua_username, COUNT(comp_id) as calificaciones_pendientes
--from mas_insertivo.USUARIO, mas_insertivo.COMPRA
--where usua_id = comp_usuario
--and comp_calificacion is null
--and DATEPART(YEAR, comp_fecha) = @anio
--and DATEPART(QUARTER, comp_fecha) = @cuarto
--group by usua_username
--order by 2 desc;

-- Vendedores con mayores calificaciones
--select top 5 usua_username, SUM(cali_cant_estrellas) / COUNT(*) as calificacion
--from mas_insertivo.USUARIO, mas_insertivo.CALIFICACION
--where usua_id = cali_usuario_calificado
--and DATEPART(YEAR, cali_fecha) = @anio
--and DATEPART(QUARTER, cali_fecha) = @cuarto
--group by usua_username
--order by 2 desc, COUNT(*) desc; -- Si tiene mas votos, deberia tener prioridad

-- Vendedores con mayor facturacion
--select top 5 usua_username, SUM(fact_total) as facturacion_total
--from MAS_INSERTIVO.USUARIO, MAS_INSERTIVO.FACTURA_CABECERA
--where usua_id = fact_usuario
--and DATEPART(YEAR, fact_fecha) = @anio
--and DATEPART(QUARTER, fact_fecha) = @cuarto
--group by usua_username
--order by 2 desc;

-- Punto uno
--select top 5 usua_username,
--DATEPART(YEAR, publ_fecha) as año,
--DATEPART(MONTH, publ_fecha) as mes,
--publ_visibilidad as visibilidad,
--SUM(publ_stock) as productos_no_vendidos
--from MAS_INSERTIVO.USUARIO, MAS_INSERTIVO.PUBLICACION
--where usua_id = publ_usuario
--and DATEPART(YEAR, publ_fecha) = @anio
--and DATEPART(QUARTER, publ_fecha) = @cuarto
--and publ_stock > 0
--group by usua_username, DATEPART(YEAR, publ_fecha), DATEPART(MONTH, publ_fecha), publ_visibilidad
--order by 2 desc, 3 desc, 4 desc;  -- año, mes, visibilidad
go


go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
go-------inicio 1_Seguridad_Procs_ABMRoles.sql
--exec Funcionalidad_BuscarPorRol 1
create proc MAS_INSERTIVO.funcionalidad_BuscarPorRol
@Rol_ID int
as
begin	
	select f.func_ID, 
		f.func_nombre, 
		(CASe p.rfunc_rol when @Rol_ID then '1' else '0' end ) as Permitido --select * 
		  from MAS_INSERTIVO.Funcionalidad f 
	left join (select * from MAS_INSERTIVO.rol_funcionalidad where rfunc_rol=@Rol_ID) p on f.func_id=p.rfunc_funcionalidad
	
end
go-------------------------------------
create proc MAS_INSERTIVO.Rol_Agregar--select * from MAS_INSERTIVO.rol  
@Nombre nvarchar(50), 
@Habilitado bit
as  
begin  
 INSERT into MAS_INSERTIVO.rol  
 (Rol_Nombre, Rol_Habilitado)
 VALUES (@Nombre, @Habilitado)   
   
 select @@IDENTITY as 'ID'  
end  
go--------------------------
create proc MAS_INSERTIVO.[Permiso_Agregar]
@Rol_ID int, 
@Fun_ID int
as
begin
	insert into MAS_INSERTIVO.rol_funcionalidad
	values
	(@Rol_ID, @Fun_ID)
	
end
go------------------------------
CREATE view MAS_INSERTIVO.vw_rol
as
select Rol_ID, Rol_Nombre, Rol_Habilitado from MAS_INSERTIVO.rol 
--where Rol_Eliminado=0
go-------------------------------
CREATE proc MAS_INSERTIVO.[Rol_Filtrar]  
@ROl_Nombre nvarchar(50)
as  
begin  
 select * from MAS_INSERTIVO.vw_rol r   
 where   
  r.Rol_Nombre like '%' +@ROl_Nombre + '%'  
--  and p.Tipo_Nombre like ''%'' + @tipo_nombre + '%'   
end  
go-------------------------------
create proc MAS_INSERTIVO.[Rol_Buscar]  
@Rol_ID int  
as  
begin   
 select r.Rol_ID, r.Rol_Nombre, Rol_Habilitado
  from MAS_INSERTIVO.rol r
 where r.Rol_ID=@Rol_ID --and r.Rol_Eliminado=0
end  
go--------------------------
create proc MAS_INSERTIVO.[Rol_Modificar]  
@ID int,   
@Nombre nvarchar(50), 
@Habilitado bit
as  
begin  
update MAS_INSERTIVO.rol  
   SET Rol_Nombre = @Nombre, 
	Rol_Habilitado = @Habilitado
 WHERE Rol_ID=@ID
 
end
go--------------------------------
create proc MAS_INSERTIVO.[Permiso_EliminarPorRol]
@Rol_ID int
as
begin
	delete from MAS_INSERTIVO.rol_funcionalidad
	where rfunc_rol=@Rol_ID	
end
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql
go-----------fin 1_Seguridad_Procs_ABMRoles.sql

go-------inicio usuarios
go-------inicio usuarios
go-------inicio usuarios
go-------inicio usuarios
go-------inicio usuarios

--declare @resultado bit
--exec MAS_INSERTIVO.Usuario_ValidarLogin '33','234', @resultado out
--select @resultado;
go
create proc MAS_INSERTIVO.Usuario_ValidarLogin
@UserName nvarchar(50), 
@Password nvarchar(64), 
@resultado bit output
as
begin
	set @resultado = 0--NO EXISTE EL USUARIO

	if (exists(select * from MAS_INSERTIVO.Usuario 
		where usua_username=@username and usua_eliminado = 0)) --si existe
	begin	
		if(exists(select * from MAS_INSERTIVO.Usuario 
			where usua_username=@UserName and usua_password=@Password ))		
		begin
			--logueo OK				
			--actualizo la cantidad de intentos a cero
			update MAS_INSERTIVO.Usuario 
				set usua_cant_intentos = 0
			where usua_username=@UserName
						
			set @resultado = 1
		end
		else
		begin
			--actualizo la cantidad de intentos
			update MAS_INSERTIVO.Usuario
				set usua_cant_intentos=usua_cant_intentos + 1 --trigger que verifica que sea <3
			where usua_username=@UserName		
		end		
	end	
end
go---------------------------------------
create proc MAS_INSERTIVO.Usuario_Buscar  
@username nvarchar(50)  
as  
begin  
/*
 declare @tipo int
 if(exists(select * from MAS_INSERTIVO.CLIENTE))
	set @tipo = 1 --cliente
 else
	set @tipo = 2 
*/
 --select *, @tipo usua_tipo_usuario from MAS_INSERTIVO.usuario   
 select * from MAS_INSERTIVO.usuario   
 where usua_username = @username and usua_eliminado = 0  
end  
go------------------------------

go-------fin usuarios
go-------fin usuarios
go-------fin usuarios
go-------fin usuarios
go-------fin usuarios
go-------fin usuarios

create  proc mas_insertivo.usuario_agregar  
@name nvarchar(50),   
@password nvarchar(64),   
@primera_vez bit, 
@rol int
as  
begin  
 --select * from MAS_INSERTIVO.Usuario  
 insert into MAS_INSERTIVO.Usuario  
 (usua_username, usua_password, usua_primer_login)  
 values  
 (@name, @password, @primera_vez)   
 
 insert into MAS_INSERTIVO.USUARIO_ROL
 (urol_rol, urol_usuario)
 values
 (@rol, @@IDENTITY)
end  
go----------------------------------------------------
create proc mas_insertivo.RolesDeUsuario
@usuario int
as
begin
	select r.rol_id, r.rol_nombre from MAS_INSERTIVO.USUARIO_ROL
	inner join Mas_insertivo.vw_rol r on urol_rol = rol_id
	where urol_usuario = @usuario
end
go
go----------------------------
create proc mas_insertivo.cliente_agregar
@usuario int,
@nombre nvarchar(255), 
@apellido nvarchar(255), 
@tipo_doc int, 
@num_doc numeric(18,0), 
@mail nvarchar(255), 
@telefono nvarchar(50), 
@calle nvarchar(255), 
@num_calle numeric(18,0), 
@piso numeric(18,0), 
@depto nvarchar(50), 
@localidad nvarchar(255), 
@cod_postal nvarchar(50), 
@fecha_nac datetime, 
@cuil nvarchar(50)
as
begin
	--select * from MAS_INSERTIVO.Cliente
	insert into MAS_INSERTIVO.Cliente
	(clie_usuario, clie_nombre, clie_apellido, clie_tipo_doc, clie_num_doc, clie_mail, clie_telefono, 
	clie_dom_calle, clie_num_calle, clie_piso, clie_depto, clie_localidad, clie_cod_postal, clie_fecha_nac, 
	clie_cuil)
	values
	(@usuario, @nombre, @apellido, @tipo_doc, @num_doc, @mail, @telefono, 
	@calle, @num_calle, @piso, @depto, @localidad, @cod_postal, @fecha_nac, @cuil)
end
go----------------------------------
create proc MAS_INSERTIVO.cliente_buscarPorTelefono
@telefono nvarchar(50)
as
begin
	select * from MAS_INSERTIVO.Cliente
	where clie_telefono = @telefono
end
go---------------------------
create proc MAS_INSERTIVO.cliente_buscarPorDocumento
@tipo_doc int, 
@num_doc numeric(18,0)
as
begin
	select * from MAS_INSERTIVO.Cliente
	where clie_tipo_doc = @tipo_doc and clie_num_doc = @num_doc
end
go------------
create proc mas_insertivo.cliente_tipos_doc
as
begin
	select tdoc_id codigo, tdoc_nombre descripcion from MAS_INSERTIVO.Tipo_Documento	
end
go----------------------------
create proc mas_insertivo.Cliente_Existe
@codigo int
as
begin
	select * from MAS_INSERTIVO.CLIENTE
	where clie_usuario = @codigo
end
go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------

create proc [MAS_INSERTIVO].[empresa_agregar]
@usuario int,
@razon_social nvarchar(255),
@mail nvarchar(255), 
@telefono nvarchar(50), 
@calle nvarchar(255), 
@num_calle numeric(18,0), 
@piso numeric(18,0), 
@depto nvarchar(50), 
@localidad nvarchar(255), 
@cod_postal nvarchar(50), 
@ciudad nvarchar(255),
@cuit nvarchar(50), 
@fechaCreacion datetime, 
@NombreContacto nvarchar(255)
as
begin
	--select * from MAS_INSERTIVO.empresa
	insert into MAS_INSERTIVO.empresa
	(empr_usuario, empr_razon_social, empr_mail, empr_telefono, 
	empr_dom_calle, empr_num_calle, empr_piso, empr_depto, empr_localidad, empr_cod_postal, 
	empr_ciudad, empr_cuit, empr_nombre_contacto, 
	empr_fecha_creacion)
	values
	(@usuario, @razon_social, @mail, @telefono, 
	@calle, @num_calle, @piso, @depto, @localidad, @cod_postal, 
	@ciudad, @cuit, @NombreContacto, @fechaCreacion)
end
go---------------------------------------
create proc MAS_INSERTIVO.empresa_buscarPorRazonSocial
@razonSocial nvarchar(255)
as
begin
	select * from MAS_INSERTIVO.EMPRESA
	where empr_razon_social = @razonSocial
end
go---------------------
create proc mas_insertivo.empresa_buscarPorCUIT
@cuit nvarchar(50)
as
begin
	select * from MAS_INSERTIVO.EMPRESA
	where empr_cuit = @cuit
end
go----------------------------------------------
--exec Mas_insertivo.cliente_filtrar '','',-1,-1,''
go
create view mas_insertivo.vw_usuario
as
	select * from MAS_INSERTIVO.USUARIO
	where usua_eliminado =0 
go
create proc Mas_insertivo.cliente_filtrar
@nombre nvarchar(255),
@apellido nvarchar(255),
@tipo_doc int,
@num_doc numeric(18,0),
@mail nvarchar(255)
as
begin
	--select * from mas_insertivo.vw_usuario
	select u.usua_username, c.*	
	from MAS_INSERTIVO.CLIENTE c
	inner join MAS_INSERTIVO.vw_usuario u on c.clie_usuario = u.usua_id
	where (clie_nombre = @nombre or @nombre='') and 
		(clie_apellido = @apellido or @apellido='') and
		(clie_tipo_doc = @tipo_doc or @tipo_doc = -1) and
		(clie_num_doc = @num_doc or @num_doc = -1) and
		(clie_mail = @mail or @mail = '')
		
end
go----------------------------------------------
create proc mas_insertivo.Usuario_BuscarPorId
@id int
as
begin
	select * from MAS_INSERTIVO.USUARIO
	where usua_id = @id
end
go----------------------------------------------
create proc mas_insertivo.Cliente_buscar
@id int
as
begin
	select * from MAS_INSERTIVO.CLIENTE
	where clie_usuario = @id
end
go----------------------------------------------
--create proc mas_insertivo.tipo_documento
--@id int
--as
--begin
--	select * from mas_insertivo.tipo_documento
--	where tdoc_id = @id
--end
go----------------------------------------------
create proc mas_insertivo.Cliente_Guardar
@usuario int,
@nombre nvarchar(255), 
@apellido nvarchar(255), 
@tipo_doc int, 
@num_doc numeric(18,0), 
@mail nvarchar(255), 
@telefono nvarchar(50), 
@calle nvarchar(255), 
@num_calle numeric(18,0), 
@piso numeric(18,0), 
@depto nvarchar(50), 
@localidad nvarchar(255), 
@cod_postal nvarchar(50), 
@fecha_nac datetime, 
@cuil nvarchar(50)
as
begin
	--select * from MAS_INSERTIVO.Cliente
	update  MAS_INSERTIVO.Cliente
		set
		clie_usuario = @usuario, 
		clie_nombre = @nombre, 
		clie_apellido = @apellido, 
		clie_tipo_doc = @tipo_doc, 
		clie_num_doc = @num_doc, 
		clie_mail = @mail, 
		clie_telefono = @telefono, 
		clie_dom_calle = @calle, 
		clie_num_calle = @num_calle, 
		clie_piso = @piso, 
		clie_depto = @depto, 
		clie_localidad = @localidad, 
		clie_cod_postal = @cod_postal, 
		clie_fecha_nac = @fecha_nac, 
		clie_cuil = @cuil
	where clie_usuario = @usuario
end


go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------

create proc mas_insertivo.Usuario_Eliminar
@codigo int
as
begin
	select * from MAS_INSERTIVO.USUARIO
	update MAS_INSERTIVO.USUARIO
		set usua_eliminado = 1
	where usua_id = @codigo
end
go------------------------------select * from mas_insertivo.tipo_documento
create proc [MAS_INSERTIVO].[empresa_guardar]  
@usuario int,  
@razon_social nvarchar(255),  
@mail nvarchar(255),   
@telefono nvarchar(50),   
@calle nvarchar(255),   
@num_calle numeric(18,0),   
@piso numeric(18,0),   
@depto nvarchar(50),   
@localidad nvarchar(255),   
@cod_postal nvarchar(50),   
@ciudad nvarchar(255),  
@cuit nvarchar(50),   
@fechaCreacion datetime,   
@NombreContacto nvarchar(255)  
as  
begin  
 --select * from MAS_INSERTIVO.empresa  
 update MAS_INSERTIVO.empresa  
	set empr_razon_social = @razon_social, 
		empr_mail = @mail, 
		empr_telefono = @telefono,   
		empr_dom_calle = @calle, 
		empr_num_calle = @num_calle, 
		empr_piso = @piso, 
		empr_depto = @depto, 
		empr_localidad = @localidad, 
		empr_cod_postal = @cod_postal,   
		empr_ciudad = @ciudad, 
		empr_cuit = @cuit, 
		empr_nombre_contacto = @NombreContacto,   
		empr_fecha_creacion =  @fechaCreacion
	where empr_usuario = @usuario
  
end 
go-------------------------------
create proc Mas_insertivo.empresa_filtrar
@razonSocial nvarchar(255),
@cuit nvarchar(50),
@mail nvarchar(255)
as
begin
	--select * from mas_insertivo.usuario
	select u.usua_username, c.*	
	from MAS_INSERTIVO.EMPRESA c
	inner join MAS_INSERTIVO.vw_usuario u on c.empr_usuario = u.usua_id
	where (empr_razon_social = @razonSocial or @razonSocial = '') 
		and (EMPR_cuit = @cuit or @cuit = '')
		and (empr_mail = @mail or @mail = '')		
end
go-----------------------------------
create  proc mas_insertivo.Empresa_buscar
@id int
as
begin
	select * from MAS_INSERTIVO.EMPRESA
	where empr_usuario = @id
end
go
create view mas_insertivo.vw_Personas 
as
	select usua_id, (clie_apellido + ', ' + clie_nombre ) as Nombre from MAS_INSERTIVO.vw_usuario
	inner join MAS_INSERTIVO.CLIENTE on usua_id = clie_usuario
	union
	select usua_id, (empr_razon_social ) as Nombre from MAS_INSERTIVO.vw_usuario	
	inner join MAS_INSERTIVO.EMPRESA on usua_id = empr_usuario	
go
go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------

create proc mas_insertivo.Rubros
as
begin
	select * from MAS_INSERTIVO.RUBRO
end
go---------------
create proc mas_insertivo.visibilidades
as
begin
	select * from MAS_INSERTIVO.VISIBILIDAD
end
go--------------------------
create proc mas_insertivo.Publicacion_Estados
as
begin
	select * from MAS_INSERTIVO.ESTADO_PUBLICACION
end
go-----------
create proc mas_insertivo.Publicacion_Tipos
as
begin
	select * from MAS_INSERTIVO.TIPO_PUBLICACION
end
go--------------------------
create proc mas_insertivo.Visi_Buscar
@codigo int
as
begin
	select * from MAS_INSERTIVO.VISIBILIDAD
	where visi_id = @codigo
end
go----------------
create proc mas_insertivo.Publicacion_estado_buscar
@codigo int
as
begin
	select * from MAS_INSERTIVO.ESTADO_PUBLICACION
	where epub_id = @codigo
end
go-----------------------------------
create proc mas_insertivo.Publicacion_tipo_buscar
@codigo int
as
begin
	select * from MAS_INSERTIVO.TIPO_PUBLICACION
	where tpub_id = @codigo
end
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
create proc mas_insertivo.publicacion_generar
@descripcion nvarchar(255), 
@stock numeric(18,0), 
@fecha datetime, 
@fecha_Vencimiento datetime, 
@precio numeric(18,2), 
@visibilidad int, 
@usuario int, 
@estado int, 
@tipo int, 
@preguntas bit,
@visibilidad_precio numeric(18,0),
@visibilidad_porcentaje numeric(18,2)
as
begin
	--select * from MAS_INSERTIVO.PUBLICACION where 
	
	insert into MAS_INSERTIVO.PUBLICACION
	(publ_descripcion, publ_Stock, publ_fecha, publ_fecha_venc, publ_precio, publ_visibilidad, publ_usuario, publ_estado, publ_tipo, publ_permitir_preguntas, publ_visi_precio, publ_visi_porcentaje)
	values
	(@descripcion, @stock, @fecha, @fecha_Vencimiento, @precio, @visibilidad, @usuario, @estado, @tipo, @preguntas, @visibilidad_precio, @visibilidad_porcentaje)
	
	select @@IDENTITY
end
go--=============================================================================???
create proc mas_insertivo.rubro_publicacion_insertar
@publicacion int, 
@rubro int
as
begin
	--select * from MAS_INSERTIVO.publicacion_rubro
	insert into MAS_INSERTIVO.publicacion_rubro
	(prubr_publicacion, prubr_rubro)
	values
	(@publicacion, @rubro)
end
go--=============================================================================???
create proc mas_insertivo.Publicacion_filtrar
@descripcion nvarchar(255), 
@usuario int
as
begin
	select * from MAS_INSERTIVO.PUBLICACION
	where publ_usuario = @usuario and (publ_descripcion = @descripcion or @descripcion ='')
end
go--=============================================================================???
create proc Mas_insertivo.Publicacion_Buscar
@codigo int
as
begin
	select * from MAS_INSERTIVO.PUBLICACION
	where publ_id = @codigo
end
go--=============================================================================???
create proc mas_insertivo.Publicacion_Rubros
@codigo int
as
begin
	select r.* from MAS_INSERTIVO.publicacion_Rubro
	inner join MAS_INSERTIVO.RUBRO r on prubr_rubro = rubr_id
	where prubr_publicacion = @codigo
end
go--=============================================================================???
go--=============================================================================???
create proc mas_insertivo.publicacion_editar
@id int,
@descripcion nvarchar(255), 
@stock numeric(18,0), 
@fecha datetime, 
@fecha_Vencimiento datetime, 
@precio numeric(18,2), 
@visibilidad int, 
@usuario int, 
@estado int, 
@tipo int, 
@preguntas bit, 
@visibilidad_precio numeric(18,2), 
@visibilidad_porcentaje numeric(18,2)
as
begin
	--select * from MAS_INSERTIVO.PUBLICACION 
	update MAS_INSERTIVO.PUBLICACION
		set publ_descripcion = @descripcion, 
		publ_Stock = @stock, 
		publ_fecha = @fecha, 
		publ_fecha_venc = @fecha_Vencimiento, 
		publ_precio = @precio, 
		publ_visibilidad = @visibilidad, 
		publ_usuario = @usuario, 
		publ_estado = @estado, 
		publ_tipo = @tipo, 
		publ_permitir_preguntas = @preguntas, 
		publ_visi_precio = @visibilidad_precio, 
		publ_visi_porcentaje = @visibilidad_porcentaje
	where publ_id = @id
end
go------------------
create proc mas_insertivo.Rubro_publicacion_eliminar
@publicacion int
as
begin
	--select * from MAS_INSERTIVO.publicacion_rubro
	delete from MAS_INSERTIVO.publicacion_rubro
	where prubr_publicacion = @publicacion
end
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???
go--=============================================================================???

--select * from mas_insertivo.pregunta
create proc mas_insertivo.Respuestas
@usuario int
as
begin
	select publ_descripcion, preg_descripcion, preg_respuesta from MAS_INSERTIVO.pregunta  
	inner join MAS_INSERTIVO.PUBLICACION on preg_publicacion = publ_id
	where preg_respuesta is not null and publ_usuario = @usuario
end
go--------
create proc mas_insertivo.Preguntas
@usuario int
as
begin  
 --select * from MAS_INSERTIVO.pregunta
 select preg_id, publ_id, publ_descripcion, preg_descripcion from MAS_INSERTIVO.pregunta    
 inner join MAS_INSERTIVO.PUBLICACION on preg_publicacion = publ_id  
 where preg_respuesta is null and publ_usuario = @usuario  
end  
go-------------------------
create proc mas_insertivo.Pregunta_Responder
@id int, 
@respuesta nvarchar(255)
as
begin
	--select * from MAS_INSERTIVO.PREGUNTA
	update MAS_INSERTIVO.PREGUNTA
		set preg_respuesta = @respuesta
		where preg_id = @id
end
go---------------------------------------------------------
go---------------------------------------------------------
go---------------------------------------------------------


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


go-----------------------
create proc mas_insertivo.Preguntar
@publicacion int, 
@pregunta nvarchar(255), 
@fecha datetime, 
@usuario int
as
begin
	--select * from MAS_INSERTIVO.PREGUNTA
	insert into MAS_INSERTIVO.PREGUNTA
	(preg_publicacion, preg_usuario, preg_descripcion, preg_fecha)
	values
	(@publicacion, @usuario, @pregunta, @fecha)
end

go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------

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



go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------

create view mas_insertivo.vw_ComprasSinCalificar
as
select comp_id, tpub_id, tpub_descripcion Publicacion, 
	publ_id, publ_descripcion, 
	comp_fecha, comp_Cantidad, comp_Usuario, 
	case tpub_id 
			when 1 then publ_precio * comp_cantidad--si es compraInmediata
			else publ_precio --si es subasta
			end as Precio
	from MAS_INSERTIVO.COMPRA
	inner join MAS_INSERTIVO.PUBLICACION on publ_id = comp_publicacion
	inner join MAS_INSERTIVO.TIPO_PUBLICACION on publ_tipo = tpub_id
	where comp_calificacion is null
go-----------------------------------------------------------
create proc mas_insertivo.ComprasSinCalificar
@usuario int
as
begin
	select * from MAS_INSERTIVO.vw_ComprasSinCalificar
	where comp_USUARIO = @usuario
end
go------------------------
create proc mas_insertivo.calificar  
@calificado int, --el usuario califi   
@calificador int,   
@cant_estrellas tinyint,   
@descripcion nvarchar(255),  
@compra_oferta int, 
@fecha datetime
as  
begin  
 --select * from MAS_INSERTIVO.CALIFICACION  
 insert into MAS_INSERTIVO.CALIFICACION  
 (cali_usuario_calificado, cali_usuario_calificador, cali_cant_estrellas, cali_descripcion, cali_fecha)  
 values  
 (@calificado, @calificador, @cant_estrellas, @descripcion, @fecha)  
    
    
 update MAS_INSERTIVO.COMPRA--select * from MAS_INSERTIVO.COMPRA where comp_id = 92672  
  set comp_calificacion = @@IDENTITY  
 where comp_id = @compra_oferta    
    
end  
  


go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------

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

create view mas_insertivo.vw_ofertasGanadoras
as
	select * from MAS_INSERTIVO.oferta where ofer_ganadora = 1
go
create view mas_insertivo.vw_publicacionesFinalizadas
as
	select * from MAS_INSERTIVO.Publicacion
	where publ_estado = 4
go
go
create view mas_insertivo.vw_PublicacionesAFacturar  
as  
	--select * from MAS_INSERTIVO.compra
 select comp_id, publ_usuario Usuario, comP_publicacion Publ_ID, publ_descripcion Descripcion, comp_fecha Fecha,   
  tpub_descripcion Tipo,   
  comp_cantidad Cantidad,   
  round((case publ_tipo when 1 then (publ_precio)  
        else ofer_monto end ) * visi_porcentaje ,2) as Precio  
  --, * from MAS_INSERTIVO.compra c  
  from MAS_INSERTIVO.compra c  
 inner join MAS_INSERTIVO.PUBLICACION on publ_id = comp_publicacion   
 inner join MAS_INSERTIVO.tipo_publicacion on publ_tipo = tpub_id  
 inner join MAS_INSERTIVO.visibilidad on visi_id = publ_visibilidad  
 --joineo con las ofertas ganadoras usar el precio ganador  
 left join MAS_INSERTIVO.vw_ofertasGanadoras on ofer_publicacion = comp_publicacion  
 where comp_pagado = 0   
 union  
 select 0, publ_usuario Usuario, publ_id, 'Comision por publicacion' Publicacion, publ_fecha Fecha, 'Comision' Descripcion, 1 Cantidad, publ_visi_precio  
 from MAS_INSERTIVO.publicacion where publ_pagado = 0
  
  
--select * from MAS_INSERTIVO.USUARIO where usua_id = 38 92-69669713-58
--exec mas_Insertivo.ComprasParaFacturar 38,10,1
go
create proc mas_Insertivo.ComprasParaFacturar
@usuario int, 
@cantidad tinyint, 
@incluirPublicacion bit
as
begin	
	declare @sql nvarchar(4000)
	set @sql = ' select top ' + CONVERT(nvarchar, @cantidad) + ' * from MAS_INSERTIVO.vw_PublicacionesAFacturar '
	set @sql = @sql + ' where USUARIO = ' + CONVERT(nvarchar, @usuario)
	if @incluirPublicacion=0
		 set @sql = @sql + ' and comP_id <>0 ' --si no incluye las publs las saco
	set @sql = @sql + ' order by Publ_id, fecha '
	
	exec (@sql)
	--select @sql
end
go
create proc mas_insertivo.Fact_InsertarCabecera
@fecha datetime, 
@usuario int, 
@tipopago int, 
@total numeric(18,2)
as
begin
	--select * from MAS_INSERTIVO.FACTURA_CABECERA
	insert into MAS_INSERTIVO.FACTURA_CABECERA
	(fact_fecha, fact_usuario, fact_tipo_pago, fact_total)
	values
	(@fecha, @usuario, @tipopago, @total)
	
	select @@IDENTITY
end
go---------------------------
create proc mas_insertivo.Fact_InsertarItem
@factura numeric(18,0), 
@renglon int, 
@publicacion int, 
@cantidad int, 
@monto numeric(18,2)
as
begin
	--select * from MAS_INSERTIVO.FACTURA_ITEM
	insert into MAS_INSERTIVO.FACTURA_ITEM
	(item_factura, item_renglon, item_publicacion, item_cantidad, item_monto)
	values
	(@factura, @renglon, @publicacion, @cantidad, @monto)
	
end
go
create proc mas_insertivo.Fact_MarcarComoPagado
@comp_id int, 
@publ_id numeric(18,0)
as
begin
	if (@comp_id is null) -- si compra_ID es null, significa que es una comision por publicacion
		update MAS_INSERTIVO.PUBLICACION
			set publ_pagado = 1
		where publ_id = @publ_id
	else
		update MAS_INSERTIVO.COMPRA
			set comp_pagado = 1
		where comp_id = @comp_id
end

go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------

create proc mas_insertivo.historial_compras
@usuario int
as
begin
	select comp_publicacion, publ_descripcion, comp_cantidad,   
	  publ_precio * comp_cantidad as Precio, 
	  p.NOmbre Vendedor
	 from MAS_INSERTIVO.COMPRA  
	 left join MAS_INSERTIVO.PUBLICACION on comp_publicacion = publ_id  
	 left join mas_insertivo.vw_Personas p on publ_usuario = usua_id 
	 where publ_tipo = 1 --compraInmediata   
	  and comp_usuario = @usuario  
end
go
create proc MAS_INSERTIVO.Historial_Ofertas
@usuario int
as
begin
	select case ofer_ganadora when 0 then 'No Gano' else 'Gano' end Resultado, 
		ofer_publicacion, publ_descripcion, ofer_monto, 
		p.NOmbre Vendedor
	from MAS_INSERTIVO.OFERTA
	left join MAS_INSERTIVO.PUBLICACION on ofer_publicacion = publ_id
	left join mas_insertivo.vw_Personas p on publ_usuario = usua_id 
	where ofer_usuario = @usuario
end
go
create proc mas_insertivo.Historial_Calificaciones
@usuario int
as
begin	
	select 
		case when cali_usuario_calificador = @usuario then 'Otorgada'
			else 'Recibida' end Tipo,
		publ_id, publ_descripcion, p.nombre Usuario, 
		cali_cant_estrellas, cali_descripcion, cali_fecha, cali_id
		from MAS_INSERTIVO.calificacion
	inner join MAS_INSERTIVO.Compra on cali_id = comp_calificacion
	inner join MAS_INSERTIVO.Publicacion on publ_id = comp_publicacion
	left join mas_insertivo.vw_Personas p on publ_usuario = usua_id 
	where cali_usuario_calificador = @usuario	or cali_usuario_calificado = @usuario
end  
go
create proc mas_insertivo.CalificacionesPendientes
@usuario int
as
begin
	select usua_calific_pendientes from mas_insertivo.USUARIO
	where usua_id = @usuario 
end
go
create proc MAS_INSERTIVO.CantidadPublicacionesGratuitas
@usuario int
as
begin
	select COUNT(*) from MAS_INSERTIVO.publicacion
	where publ_visi_precio = 0 and publ_visi_porcentaje = 0 
		and publ_usuario = @usuario and publ_estado = 2--dos activa
end

go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------m	m	m
create proc mas_insertivo.ListEstad_VendConMayorCantDeProdNoVendidos
@anio smallint, 
@cuarto tinyint
as
begin
	select top 5 p.Nombre,
	DATEPART(YEAR, publ_fecha) as año,
	DATEPART(MONTH, publ_fecha) as mes,
	publ_visibilidad as visibilidad,
	SUM(publ_stock) as productos_no_vendidos
	from MAS_INSERTIVO.PUBLICACION
	inner join MAS_INSERTIVO.vw_personas p on p.usua_id = publ_usuario
	where DATEPART(YEAR, publ_fecha) = @anio
	and DATEPART(QUARTER, publ_fecha) = @cuarto
	and publ_stock > 0
	group by p.Nombre, DATEPART(YEAR, publ_fecha), DATEPART(MONTH, publ_fecha), publ_visibilidad
	order by 2 desc, 3 desc, 4 desc;  -- año, mes, visibilidad
end
go-------------------------------------s--------
--select * from MAS_INSERTIVO.vw_personas
go
create proc mas_insertivo.ListEstad_VendConMayorFacturacion
@anio smallint, 
@cuarto tinyint
as
begin
	select top 5 p.Nombre, SUM(fact_total) as facturacion_total
	from MAS_INSERTIVO.FACTURA_CABECERA
	inner join MAS_INSERTIVO.vw_personas p on p.usua_id = fact_usuario
	where DATEPART(YEAR, fact_fecha) = @anio
	and DATEPART(QUARTER, fact_fecha) = @cuarto
	group by p.Nombre
	order by 2 desc;
end
go---------------------------------------------
create proc mas_insertivo.ListEstad_VendConMayoresCalif
@anio smallint, 
@cuarto tinyint
as
begin
	select top 5 p.Nombre, SUM(cali_cant_estrellas) / COUNT(*) as calificacion
	from mas_insertivo.CALIFICACION
	inner join MAS_INSERTIVO.vw_personas p on p.usua_id = cali_usuario_calificado
	where DATEPART(YEAR, cali_fecha) = @anio
	and DATEPART(QUARTER, cali_fecha) = @cuarto
	group by p.Nombre
	order by 2 desc, COUNT(*) desc; -- Si tiene mas votos, deberia tener prioridad
end
go---------------------------------------------
create proc mas_insertivo.ListEstad_CliConMayoresPublSinCalif
@anio smallint, 
@cuarto tinyint
as
begin
	select top 5 p.Nombre, COUNT(comp_id) as calificaciones_pendientes
	from mas_insertivo.COMPRA
	inner join MAS_INSERTIVO.vw_personas p on p.usua_id = comp_usuario
	where comp_calificacion is null
	and DATEPART(YEAR, comp_fecha) = @anio
	and DATEPART(QUARTER, comp_fecha) = @cuarto
	group by p.Nombre
	order by 2 desc;
end
go---------------------------------------------
