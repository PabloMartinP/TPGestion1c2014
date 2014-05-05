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
rfunc_rol_id int not null,
rfunc_func_id int not null
);

/****** Creacion de la tabla TIPO_USUARIO ******/
create table MAS_INSERTIVO.TIPO_USUARIO
(
tusua_id int identity(1,1),
tusua_nombre nvarchar(50) not null
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
usua_tipo int not null,
usua_calific_pendientes int default 0 not null
);

/****** Creacion de la tabla USUARIO_ROL ******/
create table MAS_INSERTIVO.USUARIO_ROL
(
urol_usua_id int not null,
urol_rol_id int not null
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
clie_usua_id int not null,
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
empr_usua_id int not null,
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
visi_descripcion nvarchar(255), 
visi_precio numeric(18,2) default 0 not null, -- prioridad 
visi_porcentaje numeric(18,2) default 0 not null,
visi_duracion_dias smallint default 7 not null -- poner en la estrategia que el default es 7 dias
);

/****** Creacion de la tabla BONIFICACION ******/
create table MAS_INSERTIVO.BONIFICACION
(
boni_usua_id int not null,
boni_visi_id int not null,
boni_cant_publicaciones smallint default 0 not null
);


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
alter table MAS_INSERTIVO.ROL_FUNCIONALIDAD add constraint pk_rol_funcionalidad primary key(rfunc_rol_id, rfunc_func_id);
alter table MAS_INSERTIVO.ROL_FUNCIONALIDAD add constraint fk_rfunc_rol_id foreign key(rfunc_rol_id) references MAS_INSERTIVO.ROL(rol_id);
alter table MAS_INSERTIVO.ROL_FUNCIONALIDAD add constraint fk_rfunc_func_id foreign key(rfunc_func_id) references MAS_INSERTIVO.FUNCIONALIDAD(func_id);

/****** Creacion de constraints para la tabla TIPO_USUARIO ******/
alter table MAS_INSERTIVO.TIPO_USUARIO add constraint pk_tipo_usuario primary key(tusua_id);
alter table MAS_INSERTIVO.TIPO_USUARIO add constraint uq_tusua_nombre unique(tusua_nombre);

/****** Creacion de constraints para la tabla USUARIO ******/
alter table MAS_INSERTIVO.USUARIO add constraint pk_usuario primary key(usua_id);
alter table MAS_INSERTIVO.USUARIO add constraint fk_usua_tipo foreign key(usua_tipo) references MAS_INSERTIVO.TIPO_USUARIO(tusua_id);
alter table MAS_INSERTIVO.USUARIO add constraint uq_usua_username unique(usua_username);

/****** Creacion de constraints para la tabla USUARIO_ROL ******/
alter table MAS_INSERTIVO.USUARIO_ROL add constraint pk_usuario_rol primary key(urol_usua_id, urol_rol_id);
alter table MAS_INSERTIVO.USUARIO_ROL add constraint fk_urol_usua_id foreign key (urol_usua_id) references MAS_INSERTIVO.USUARIO(usua_id);
alter table MAS_INSERTIVO.USUARIO_ROL add constraint fk_urol_rol_id foreign key (urol_rol_id) references MAS_INSERTIVO.ROL(rol_id);

/****** Creacion de constraints para la tabla TIPO_DOCUMENTO ******/
alter table MAS_INSERTIVO.TIPO_DOCUMENTO add constraint pk_tipo_documento primary key(tdoc_id);
alter table MAS_INSERTIVO.TIPO_DOCUMENTO add constraint uq_tdoc_nombre unique(tdoc_nombre);

/****** Creacion de constraints para la tabla CLIENTE ******/
alter table MAS_INSERTIVO.CLIENTE add constraint pk_cliente primary key(clie_usua_id);
alter table MAS_INSERTIVO.CLIENTE add constraint fk_clie_usua_id foreign key(clie_usua_id) references MAS_INSERTIVO.USUARIO(usua_id);
alter table MAS_INSERTIVO.CLIENTE add constraint uq_clie_tipo_num_doc unique(clie_tipo_doc, clie_num_doc);
alter table MAS_INSERTIVO.CLIENTE add constraint fk_clie_tipo_doc foreign key(clie_tipo_doc) references MAS_INSERTIVO.TIPO_DOCUMENTO(tdoc_id);
alter table MAS_INSERTIVO.CLIENTE add constraint ck_clie_puntuacion check(clie_puntuacion >= 0 and clie_puntuacion <= 10);

/****** Creacion de constraints para la tabla EMPRESA ******/
alter table MAS_INSERTIVO.EMPRESA add constraint pk_empresa primary key(empr_usua_id);
alter table MAS_INSERTIVO.EMPRESA add constraint fk_empr_usua_id foreign key (empr_usua_id) references MAS_INSERTIVO.USUARIO(usua_id);
alter table MAS_INSERTIVO.EMPRESA add constraint uq_empr_cuit unique(empr_cuit);
alter table MAS_INSERTIVO.EMPRESA add constraint uq_empr_razon_social unique(empr_razon_social);
alter table MAS_INSERTIVO.EMPRESA add constraint ck_empr_puntuacion check(empr_puntuacion >= 0 and empr_puntuacion <= 10 );

/****** Creacion de constraints para la tabla RUBRO ******/
alter table MAS_INSERTIVO.RUBRO add constraint pk_rubro primary key(rubr_id);
alter table MAS_INSERTIVO.RUBRO add constraint uq_rubr_codigo unique(rubr_codigo);

/****** Creacion de constraints para la tabla VISIBILIDAD ******/
alter table MAS_INSERTIVO.VISIBILIDAD add constraint pk_visibilidad primary key(visi_id);
alter table MAS_INSERTIVO.VISIBILIDAD add constraint uq_visi_codigo unique(visi_codigo);

/****** Creacion de constraints para la tabla BONIFICACION ******/
alter table MAS_INSERTIVO.BONIFICACION add constraint pk_bonificacion primary key(boni_usua_id, boni_visi_id );
alter table MAS_INSERTIVO.BONIFICACION add constraint fk_boni_usua_id foreign key(boni_usua_id) references MAS_INSERTIVO.USUARIO(usua_id);
alter table MAS_INSERTIVO.BONIFICACION add constraint fk_boni_visi_id foreign key(boni_visi_id) references MAS_INSERTIVO.VISIBILIDAD(visi_id);


/**************************************************/
/****** CREACION DE TRIGGERS - PRE MIGRACION ******/
/**************************************************/

--TRIGGER before insert CLIENTE, CREAR USUARIO
-- BOSQUEJO. Revisar @@IDENTITY y que pasa con multiples insert.
-- http://technet.microsoft.com/en-us/library/ms191300(v=sql.100).aspx
/*
create trigger crear_usuario_antes_que_clie
on MAS_INSERTIVO.CLIENTE
instead of insert
as
begin
	
	declare @var_usua_tipo int;
	set @var_usua_tipo = (select tusua_id from MAS_INSERTIVO.TIPO_USUARIO where tusua_nombre = 'Cliente');
	
	insert into MAS_INSERTIVO.USUARIO
	(usua_username, usua_password, usua_tipo)
	values ('NOMBRE4', 'PASS4', @var_usua_tipo);
		
	insert into MAS_INSERTIVO.CLIENTE
	(clie_tipo_doc, clie_num_doc, clie_usua_id, clie_apellido, clie_nombre,
	 clie_mail, clie_telefono, clie_dom_calle, clie_num_calle, clie_piso, clie_depto,
	 clie_localidad, clie_cod_postal, clie_fecha_nac, clie_cuil, clie_puntuacion)
	SELECT clie_tipo_doc, clie_num_doc, @@IDENTITY, clie_apellido, clie_nombre,
	 clie_mail, clie_telefono, clie_dom_calle, clie_num_calle, clie_piso, clie_depto,
	 clie_localidad, clie_cod_postal, clie_fecha_nac, clie_cuil, clie_puntuacion FROM inserted;
	
end;
go
*/

--TRIGGER before insert EMPRESA, CREAR USUARIO


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


/****** Insercion de datos en la tabla TIPO_USUARIO ******/
insert into MAS_INSERTIVO.TIPO_USUARIO
(tusua_nombre)
values
('Empresa'),
('Administrativo'),
('Cliente');

/****** Insercion de datos en la tabla USUARIO ******/


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
/******
declare @var_tipo_doc int;
set @var_tipo_doc = (select tdoc_id from MAS_INSERTIVO.TIPO_DOCUMENTO where tdoc_nombre = 'DNI');

insert into MAS_INSERTIVO.CLIENTE
(clie_tipo_doc, clie_num_doc, clie_apellido, clie_nombre,
clie_mail, clie_dom_calle, clie_num_calle, clie_piso,
clie_depto, clie_cod_postal, clie_fecha_nac)
select distinct @var_tipo_doc, Cli_Dni, Cli_Apeliido, Cli_Nombre,
Cli_Mail, Cli_Dom_Calle, Cli_Nro_Calle, Cli_Piso,
Cli_Depto, Cli_Cod_Postal, Cli_Fecha_Nac
from gd_esquema.Maestra
where Cli_Dni is not null;
******/

/****** Insercion de datos en la tabla EMPRESA ******/
-- Habia 64 empresas en la tabla Maestra
/******
insert into MAS_INSERTIVO.EMPRESA
(empr_razon_social, empr_mail, empr_dom_calle, empr_num_calle, empr_piso,
empr_depto, empr_cod_postal, empr_cuit, empr_fecha_creacion)
SELECT DISTINCT Publ_Empresa_Razon_Social, Publ_Empresa_Mail, Publ_Empresa_Dom_Calle, Publ_Empresa_Nro_Calle, Publ_Empresa_Piso,
Publ_Empresa_Depto, Publ_Empresa_Cod_Postal, Publ_Empresa_Cuit, Publ_Empresa_Fecha_Creacion
FROM gd_esquema.Maestra
where Publ_Empresa_Cuit is not null;
******/

/****** Insercion de datos en la tabla RUBRO ******/
-- NO habia rubros en la tabla Maestra (Publicacion_Rubro_Descripcion es NULL en todos los registros)
-- Ver implementacion de codigo ABM

/****** Insercion de datos en la tabla VISIBILIDAD ******/
insert into MAS_INSERTIVO.VISIBILIDAD
(visi_codigo, visi_descripcion, visi_precio, visi_porcentaje)
select distinct Publicacion_Visibilidad_Cod, Publicacion_Visibilidad_Desc,
	Publicacion_Visibilidad_Precio, Publicacion_Visibilidad_Porcentaje
from gd_esquema.Maestra
where Publicacion_Visibilidad_Cod is not null
order by Publicacion_Visibilidad_Precio;

/****** Insercion de datos en la tabla BONIFICACION ******/


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

/*********************************/
/****** CREACION DE INDICES ******/
/*********************************/

