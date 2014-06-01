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
usua_calific_pendientes int default 0 not null
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
clie_cuil nvarchar(50),
clie_puntuacion tinyint default 0 not null
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
empr_fecha_creacion datetime,
empr_puntuacion tinyint default 0 not null
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
visi_duracion_dias smallint default 7 not null -- poner en la estrategia que el default es 7 dias
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
publ_id numeric(18,0) not null, --  identity(1,1) identity que inicia con el max de la migracion de publicacion_cod. DBCC CHECKIDENT('tableName', RESEED, NEW_RESEED_VALUE)http://stackoverflow.com/questions/19155775/how-to-update-identity-column-in-sql-server
publ_descripcion nvarchar(255),
publ_stock numeric(18,0),
publ_fecha datetime,
publ_fecha_venc datetime,
publ_precio numeric(18,2),
publ_visibilidad int not null,
publ_usuario int not null,
publ_estado int not null,
publ_tipo int not null,
publ_permitir_preguntas bit default 1 not null
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
comp_usuario int not null,
comp_pagado bit default 0 not null
);

/****** Creacion de la tabla OFERTA ******/
create table MAS_INSERTIVO.OFERTA
(
ofer_id int identity(1,1), 
ofer_publicacion numeric(18,0),
ofer_fecha datetime, 
ofer_monto numeric(18,2), 
ofer_usuario int not null,
ofer_ganadora bit default 0 not null,
ofer_pagado bit default 0 not null
);


/*****************************************************/
/****** CREACION DE CONSTRAINTS - PRE MIGRACION ******/
/*****************************************************/

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
alter table MAS_INSERTIVO.CLIENTE add constraint uq_clie_tipo_num_doc unique(clie_tipo_doc, clie_num_doc);
alter table MAS_INSERTIVO.CLIENTE add constraint fk_clie_tipo_doc foreign key(clie_tipo_doc) references MAS_INSERTIVO.TIPO_DOCUMENTO(tdoc_id);
alter table MAS_INSERTIVO.CLIENTE add constraint ck_clie_puntuacion check(clie_puntuacion >= 0 and clie_puntuacion <= 10);

/****** Creacion de constraints para la tabla EMPRESA ******/
alter table MAS_INSERTIVO.EMPRESA add constraint uq_empr_cuit unique(empr_cuit);
alter table MAS_INSERTIVO.EMPRESA add constraint uq_empr_razon_social unique(empr_razon_social);
alter table MAS_INSERTIVO.EMPRESA add constraint ck_empr_puntuacion check(empr_puntuacion >= 0 and empr_puntuacion <= 10 );

/****** Creacion de constraints para la tabla RUBRO ******/
alter table MAS_INSERTIVO.RUBRO add constraint pk_rubro primary key(rubr_id);

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

/****** Creacion de constraints para la tabla COMPRA ******/
alter table MAS_INSERTIVO.COMPRA add constraint pk_compra primary key(comp_id);
alter table MAS_INSERTIVO.COMPRA add constraint fk_comp_publicacion foreign key(comp_publicacion) references MAS_INSERTIVO.PUBLICACION(publ_id);
alter table MAS_INSERTIVO.COMPRA add constraint fk_comp_usuario foreign key(comp_usuario) references MAS_INSERTIVO.USUARIO(usua_id);

/****** Creacion de constraints para la tabla OFERTA ******/
alter table MAS_INSERTIVO.OFERTA add constraint pk_oferta primary key(ofer_id);
alter table MAS_INSERTIVO.OFERTA add constraint fk_ofer_publicacion foreign key(ofer_publicacion) references MAS_INSERTIVO.PUBLICACION(publ_id);
alter table MAS_INSERTIVO.OFERTA add constraint fk_ofer_usuario foreign key(ofer_usuario) references MAS_INSERTIVO.USUARIO(usua_id);


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
-- Usuarios de clientes
insert into MAS_INSERTIVO.USUARIO
(usua_username, usua_password)
select distinct convert(nvarchar,Cli_Dni), '1234'
from gd_esquema.Maestra
where Cli_Dni is not null
union
select distinct convert(nvarchar,Publ_Cli_Dni), '1234'
from gd_esquema.Maestra
where Publ_Cli_Dni is not null;

-- Usuarios de empresas
insert into MAS_INSERTIVO.USUARIO
(usua_username, usua_password)
select distinct Publ_Empresa_Cuit, '5678'
from gd_esquema.Maestra
where Publ_Empresa_Cuit is not null;

-- Usuario administrador
-- Insertar el usuario administrador que pide el enunciado del TP


/****** Insercion de datos en la tabla USUARIO_ROL ******/


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
and convert(nvarchar, Cli_Dni) = usua_username
union
select distinct usua_id, @var_tipo_doc, Publ_Cli_Dni, Publ_Cli_Apeliido, Publ_Cli_Nombre,
Publ_Cli_Mail, Publ_Cli_Dom_Calle, Publ_Cli_Nro_Calle, Publ_Cli_Piso,
Publ_Cli_Depto, Publ_Cli_Cod_Postal, Publ_Cli_Fecha_Nac
from gd_esquema.Maestra, MAS_INSERTIVO.USUARIO
where Publ_Cli_Dni is not null
and convert(nvarchar, Publ_Cli_Dni) = usua_username
;

/****** Insercion de datos en la tabla EMPRESA ******/
-- Habia 64 empresas en la tabla Maestra
insert into MAS_INSERTIVO.EMPRESA
(empr_usuario, empr_razon_social, empr_mail, empr_dom_calle, empr_num_calle, empr_piso,
empr_depto, empr_cod_postal, empr_cuit, empr_fecha_creacion)
select distinct usua_id, Publ_Empresa_Razon_Social, Publ_Empresa_Mail, Publ_Empresa_Dom_Calle, Publ_Empresa_Nro_Calle, Publ_Empresa_Piso,
Publ_Empresa_Depto, Publ_Empresa_Cod_Postal, Publ_Empresa_Cuit, Publ_Empresa_Fecha_Creacion
from gd_esquema.Maestra, MAS_INSERTIVO.USUARIO
where Publ_Empresa_Cuit is not null
and Publ_Empresa_Cuit = usua_username;

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
where Publicacion_Visibilidad_Cod is not null
order by Publicacion_Visibilidad_Precio;

/****** Insercion de datos en la tabla BONIFICACION ******/


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

/****** Insercion de datos en la tabla PUBLICACION ******/
-- Habia 56028 publicaciones en la tabla Maestra
-- Agrupar por Publicacion_Cod para obtener los stock? y las compras? y los item_factura?
-- publ_id numeric(18,0) not null, --  identity(1,1) identity que inicia con el max de la migracion de publicacion_cod. DBCC CHECKIDENT('tableName', RESEED, NEW_RESEED_VALUE)http://stackoverflow.com/questions/19155775/how-to-update-identity-column-in-sql-server


/****** Insercion de datos en la tabla PUBLICACION_RUBRO ******/


/****** Insercion de datos en la tabla COMPRA ******/
-- Habilitar una vez que este la insercion de PUBLICACION
/*
insert into MAS_INSERTIVO.COMPRA
(comp_publicacion, comp_fecha, comp_cantidad, comp_usuario)
select distinct Publicacion_Cod, Compra_Fecha, Compra_Cantidad, clie_usuario
from gd_esquema.Maestra, MAS_INSERTIVO.CLIENTE
where Compra_Fecha is not null
and Cli_Dni = clie_num_doc;
*/

/****** Insercion de datos en la tabla OFERTA ******/
-- Habilitar una vez que este la insercion de PUBLICACION
/*
insert into MAS_INSERTIVO.OFERTA
(ofer_publicacion, ofer_fecha, ofer_monto, ofer_usuario)
select distinct Publicacion_Cod, Oferta_Fecha, Oferta_Monto, clie_usuario
from gd_esquema.Maestra, MAS_INSERTIVO.CLIENTE
where Oferta_Fecha is not null
and Cli_Dni = clie_num_doc;
*/


/******************************************************/
/****** CREACION DE CONSTRAINTS - POST MIGRACION ******/
/******************************************************/

/****** Creacion de constraints para la tabla CLIENTE ******/
alter table MAS_INSERTIVO.CLIENTE add constraint pk_cliente primary key(clie_usuario);
alter table MAS_INSERTIVO.CLIENTE add constraint fk_clie_usuario foreign key(clie_usuario) references MAS_INSERTIVO.USUARIO(usua_id);

/****** Creacion de constraints para la tabla EMPRESA ******/
alter table MAS_INSERTIVO.EMPRESA add constraint pk_empresa primary key(empr_usuario);
alter table MAS_INSERTIVO.EMPRESA add constraint fk_empr_usuario foreign key (empr_usuario) references MAS_INSERTIVO.USUARIO(usua_id);

/****** Creacion de constraints para la tabla RUBRO ******/
alter table MAS_INSERTIVO.RUBRO add constraint uq_rubr_codigo unique(rubr_codigo);


/***************************************************/
/****** CREACION DE TRIGGERS - POST MIGRACION ******/
/***************************************************/

-- TRIGGER inhabilitar rol

-- TRIGGER inhabilitar usuario (3 intentos fallidos de login)

-- TRIGGER unicidad del telefono CLIENTE (hay muchos NULL, asi que verificar por trigger)

-- TRIGGER BONIFICACION: creacion por insercion de usuario
-- creacion por insercion de visibilidad
-- aumento por publicacion
-- reset a 0 luego de 10

-- TRIGGER PUBLICACION stock 0 -> finalizada

-- TRIGGER VISIBILIDAD: Un vendedor no puede tener mas de 3 publicaciones activas simultaneamente en forma gratuita.

/*********************************/
/****** CREACION DE INDICES ******/
/*********************************/

