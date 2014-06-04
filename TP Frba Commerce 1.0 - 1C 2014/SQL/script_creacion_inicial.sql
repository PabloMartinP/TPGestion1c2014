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
usua_cant_calificaciones int default 0 not null
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
publ_usuario int not null, -- El que publico
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
ofer_ganadora bit default 0 not null,
ofer_pagado bit default 0 not null,
ofer_calificacion numeric(18,0)
);

/****** Creacion de la tabla CALIFICACION ******/
create table MAS_INSERTIVO.CALIFICACION
(
cali_id numeric(18,0) identity(1,1),
cali_usuario_calificado int not null, -- El que publico
cali_usuario_calificador int not null, -- El que califico
cali_cant_estrellas tinyint not null, 
cali_descripcion nvarchar(255)
);

/****** Creacion de la tabla TIPO_PAGO ******/
create table MAS_INSERTIVO.TIPO_PAGO
(
tpago_id int identity(1,1), 
tpago_descripcion nvarchar(255)
);

/****** Creacion de la tabla DETALLE_TARJETA ******/
/*
create table MAS_INSERTIVO.DETALLE_TARJETA
(
tarj_numero numeric(16,0) not null,
tarj_usuario int not null,
tarj_fecha_vencimiento datetime not null,
tarj_nombre nvarchar(255) not null,
tarj_codigo_ver tinyint not null
);
*/

/****** Creacion de la tabla FACTURA_CABECERA ******/
create table MAS_INSERTIVO.FACTURA_CABECERA
(
fact_id int not null, 
fact_fecha datetime, 
fact_usuario int not null, 
fact_tipo_pago int not null, 
fact_total numeric(18,2)
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
('ABM Visibilidad De Publicaci�n'),
('Generar Publicaci�n'),
('Editar Publicaci�n'),
('Gesti�n de Preguntas'),
('Comprar/Ofertar'),
('Historial del Cliente'),
('Calificar al Vendedor'),
('Facturar Publicaciones'),
('Listado Estad�stico');

/****** Insercion de datos en la tabla ROL_FUNCIONALIDAD ******/





/****** Insercion de datos en la tabla USUARIO ******/
-- Password en SHA-256
declare @sha_password nvarchar(64) ='03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'; -- Password 1234

-- Usuarios de clientes
insert into MAS_INSERTIVO.USUARIO
(usua_username, usua_password)
select distinct convert(nvarchar,Cli_Dni), @sha_password
from gd_esquema.Maestra
where Cli_Dni is not null
union
select distinct convert(nvarchar,Publ_Cli_Dni), @sha_password
from gd_esquema.Maestra
where Publ_Cli_Dni is not null;

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
('admin', 'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7', 0); -- Password w23e en SHA-256, No es el primer intento

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
select distinct 0, Publicacion_Rubro_Descripcion -- esto no falla porque la constraint unique se crea al final.
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

/****** Insercion de datos en la tabla BONIFICACION ******/
-- Lo manejamos por el trigger, como todas las pub estan finalizadas al migrar, se crea al final.

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
insert into MAS_INSERTIVO.COMPRA
(comp_publicacion, comp_fecha, comp_cantidad, comp_usuario)
select distinct Publicacion_Cod, Compra_Fecha, Compra_Cantidad, clie_usuario
from gd_esquema.Maestra, MAS_INSERTIVO.CLIENTE
where Compra_Fecha is not null
and Cli_Dni = clie_num_doc;

-- Update de la tabla USUARIO - Campo usua_calific_pendientes
-- Declaraci�n de variables
declare @var_comp_usuario int;
declare @var_comp_count int;

-- Declaraci�n del cursor
declare cur_compra_count cursor
for
select comp_usuario, COUNT(*)
from MAS_INSERTIVO.COMPRA
group by comp_usuario;

-- apertura del cursor
open cur_compra_count;

-- Lectura de la primera fila del cursor
fetch cur_compra_count into @var_comp_usuario, @var_comp_count;
while (@@FETCH_STATUS = 0)
begin
		
	update MAS_INSERTIVO.USUARIO
	set
		usua_calific_pendientes = usua_calific_pendientes + @var_comp_count
	where usua_id = @var_comp_usuario;
	
	-- Lectura de la siguiente fila de un cursor
	fetch cur_compra_count into @var_comp_usuario, @var_comp_count;

end -- Fin del bucle WHILE

-- Cierra el cursor
close cur_compra_count;

-- Libera los recursos del cursor
deallocate cur_compra_count;

/****** Insercion de datos en la tabla PUBLICACION ******/
-- Habia 56028 publicaciones en la tabla Maestra
set identity_insert MAS_INSERTIVO.PUBLICACION ON;

insert into MAS_INSERTIVO.PUBLICACION
(publ_id, publ_descripcion,
publ_stock,
publ_fecha, publ_fecha_venc, publ_precio,
publ_visibilidad,
publ_usuario,
publ_estado,
publ_tipo)
select distinct Publicacion_Cod, Publicacion_Descripcion,
Publicacion_Stock - ISNULL((select SUM(comp_cantidad) from MAS_INSERTIVO.COMPRA where comp_publicacion = Publicacion_Cod), 0),
Publicacion_Fecha, Publicacion_Fecha_Venc, Publicacion_Precio,
(select visi_id from MAS_INSERTIVO.VISIBILIDAD
	where visi_codigo = Publicacion_Visibilidad_Cod),
(select usua_id from MAS_INSERTIVO.USUARIO
	where (usua_username = CONVERT(nvarchar, Publ_Cli_Dni) and Publ_Cli_Dni is not null)
	or (usua_username = Publ_Empresa_Cuit and Publ_Empresa_Cuit is not null)),
4, -- Estado Finalizado
(select tpub_id from MAS_INSERTIVO.TIPO_PUBLICACION
	where tpub_descripcion = Publicacion_Tipo)
from gd_esquema.Maestra;

set identity_insert MAS_INSERTIVO.PUBLICACION off;

declare @var_next_publ_id numeric(18, 0);
set @var_next_publ_id = (select MAX(publ_id) from MAS_INSERTIVO.PUBLICACION);
DBCC CHECKIDENT('MAS_INSERTIVO.PUBLICACION', RESEED, @var_next_publ_id )

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
-- Update de la tabla USUARIO - Campo usua_calific_pendientes
-- Declaraci�n de variables
declare @var_publ_id numeric(18,0);
declare @var_publ_precio numeric(18,2);
declare @var_ofer_monto numeric(18,2);
declare @var_ofer_usuario int;

-- Declaraci�n del cursor
declare cur_oferta_max cursor
for
select publ_id, publ_precio, ofer_usuario, MAX(ofer_monto)
from MAS_INSERTIVO.PUBLICACION, MAS_INSERTIVO.OFERTA
where ofer_publicacion = publ_id
and ofer_monto >= publ_precio
and ofer_monto is not null
group by publ_id, publ_precio, ofer_usuario;

-- apertura del cursor
open cur_oferta_max;

-- Lectura de la primera fila del cursor
fetch cur_oferta_max into @var_publ_id, @var_publ_precio, @var_ofer_usuario, @var_ofer_monto;
while (@@FETCH_STATUS = 0)
begin
	
	update MAS_INSERTIVO.OFERTA
	set
		ofer_ganadora = 1
	where ofer_publicacion = @var_publ_id
	and ofer_monto = @var_ofer_monto;
	
	update MAS_INSERTIVO.USUARIO
	set
		usua_calific_pendientes = usua_calific_pendientes + 1
	where usua_id = @var_ofer_usuario;
	
	-- Lectura de la siguiente fila de un cursor
	fetch cur_oferta_max into @var_publ_id, @var_publ_precio, @var_ofer_usuario, @var_ofer_monto;

end -- Fin del bucle WHILE

-- Cierra el cursor
close cur_oferta_max;

-- Libera los recursos del cursor
deallocate cur_oferta_max;


/****** Insercion de datos en la tabla CALIFICACION ******/
set identity_insert MAS_INSERTIVO.CALIFICACION ON;

insert into MAS_INSERTIVO.CALIFICACION
(cali_id, cali_usuario_calificado, cali_usuario_calificador, cali_cant_estrellas, cali_descripcion)
select Calificacion_Codigo, 
	(select usua_id from MAS_INSERTIVO.USUARIO
	where (usua_username = CONVERT(nvarchar, Publ_Cli_Dni) and Publ_Cli_Dni is not null)
	or (usua_username = Publ_Empresa_Cuit and Publ_Empresa_Cuit is not null)), -- Calificado
	(select usua_id from MAS_INSERTIVO.USUARIO
	where (usua_username = CONVERT(nvarchar, Cli_Dni) and Cli_Dni is not null)), -- Calificador
	Calificacion_Cant_Estrellas, Calificacion_Descripcion 
	from gd_esquema.maestra
	where Calificacion_Codigo is not null;

set identity_insert MAS_INSERTIVO.CALIFICACION off;

declare @var_next_cali_id numeric(18, 0);
set @var_next_cali_id = (select MAX(cali_id) from MAS_INSERTIVO.CALIFICACION);
DBCC CHECKIDENT('MAS_INSERTIVO.CALIFICACION', RESEED, @var_next_cali_id );

-- Update de la tabla USUARIO - Campo usua_calific_pendientes
-- TO DO
-- revisar TRIGGER - esta abajo


/****** Insercion de datos en la tabla TIPO_PAGO ******/
insert into MAS_INSERTIVO.TIPO_PAGO
(tpago_descripcion)
values
('Efectivo'),
('Tarjeta');

/****** Insercion de datos en la tabla DETALLE_TARJETA ******/


/****** Insercion de datos en la tabla FACTURA_CABECERA ******/


/****** Insercion de datos en la tabla FACTURA_ITEM ******/


/****** Insercion de datos en la tabla PREGUNTA ******/


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
alter table MAS_INSERTIVO.USUARIO add constraint ck_usua_cant_intentos check(usua_cant_intentos < 4);
-- Dar de alta despues de realizar la migracion correcta de calificaciones
--alter table MAS_INSERTIVO.USUARIO add constraint ck_usua_calific_pendientes check(usua_calific_pendientes <= 5);

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
alter table MAS_INSERTIVO.OFERTA add constraint fk_ofer_calificacion foreign key(ofer_calificacion) references MAS_INSERTIVO.CALIFICACION(cali_id);
alter table MAS_INSERTIVO.OFERTA add constraint fk_ofer_usuario foreign key(ofer_usuario) references MAS_INSERTIVO.CLIENTE(clie_usuario);
alter table MAS_INSERTIVO.OFERTA add constraint fk_ofer_publicacion foreign key(ofer_publicacion) references MAS_INSERTIVO.PUBLICACION(publ_id);

/****** Creacion de constraints para la tabla TIPO_PAGO ******/
alter table MAS_INSERTIVO.TIPO_PAGO add constraint pk_tipo_pago primary key(tpago_id);

/****** Creacion de constraints para la tabla DETALLE_TARJETA ******/
--alter table MAS_INSERTIVO.DETALLE_TARJETA add constraint pk_detalle_tarjeta primary key(tarj_numero);
--alter table MAS_INSERTIVO.DETALLE_TARJETA add constraint fk_tarj_usuario foreign key(tarj_usuario) references MAS_INSERTIVO.CLIENTE(clie_usuario);

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

-- 3 TRIGGERS CALIFICACIONES: Total calificaciones, cant calificaciones, restar calificaciones pendientes;
/*
go
create trigger MAS_INSERTIVO.TR_CALIFICACION on mas_insertivo.calificacion
after insert
as
begin
	declare @nueva_calificacion int;
	declare @usuario_calificado int;
	declare @usuario_calificador int;
	
	declare cur cursor

	for
		select cali_cant_estrellas, cali_usuario_calificado, cali_usuario_calificador  from inserted

	-- apertura del cursor
	open cur
	-- Lectura de la primera fila del cursor

	fetch cur into @nueva_calificacion,@usuario_calificado, @usuario_calificador
	while (@@FETCH_STATUS = 0)
	begin
	-- Lectura de la siguiente fila de un cursor	
	update mas_insertivo.usuario
		set usua_cant_calificaciones = usua_cant_calificaciones + 1,
			usua_suma_calificaciones = usua_suma_calificaciones + @nueva_calificacion
			where usua_id = @usuario_calificado;
		    
	update mas_insertivo.usuario
		set usua_calific_pendientes = usua_calific_pendientes - 1
		where usua_id = @usuario_calificador;	    
		         
	fetch cur into @nueva_calificacion,@usuario_calificado,  @usuario_calificador

	end -- Fin del bucle WHILE

	-- Cierra el cursor
	close cur

	-- Libera los recursos del cursor
	deallocate cur

end
*/

/*********************************/
/****** CREACION DE INDICES ******/
/*********************************/

