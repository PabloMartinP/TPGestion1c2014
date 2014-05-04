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
rolfunc_rol_id int not null, 
rolfunc_func_id int not null
);

/****** Creacion de la tabla TIPO_USUARIO ******/
create table MAS_INSERTIVO.TIPO_USUARIO
(
tipousua_id int identity(1,1),
tipousua_nombre nvarchar(50) not null
);

/****** Creacion de la tabla USUARIO ******/
-------- VERIFICAR CAMPOS - TIPO DE DATO
create table MAS_INSERTIVO.USUARIO
(
usua_id int identity(1,1),
usua_username nvarchar(50) not null,
usua_password nvarchar(64) not null,
usua_tipo int not null,
usua_habilitado bit default 1 not null,
usua_eliminado bit default 0 not null,
usua_cant_intentos int default 0 not null,
usua_primer_login bit default 1 not null,
usua_calific_pendientes int default 0 not null
);

/****** Creacion de la tabla USUARIO_ROL ******/
create table MAS_INSERTIVO.USUARIO_ROL
(
usuarol_usua_id int not null,
usuarol_rol_id int not null
);

/****** Creacion de la tabla TIPO_DOCUMENTO ******/
create table MAS_INSERTIVO.TIPO_DOCUMENTO
(
tipodoc_id int identity(1,1),
tipodoc_nombre nvarchar(50) not null
);

/****** Creacion de la tabla CLIENTE ******/
-------- VERIFICAR CAMPOS - TIPO DE DATO
create table MAS_INSERTIVO.CLIENTE
(
clie_tipo_doc int not null,
clie_nro_doc numeric(18,0) not null,
clie_usua_id int not null,
clie_apellido nvarchar(255),
clie_nombre nvarchar(255),
clie_mail nvarchar(255),
clie_telefono nvarchar(50),
clie_dom_calle nvarchar(255),
clie_nro_calle numeric(18,0),
clie_piso numeric(18,0),
clie_depto nvarchar(50),
clie_localidad nvarchar(50),
clie_cod_postal nvarchar(50),
clie_fecha_nac datetime,
clie_cuil nvarchar(50)
);


/*************************************/
/****** CREACION DE CONSTRAINTS ******/
/*************************************/

/****** Creacion de constraints para la tabla ROL ******/
alter table MAS_INSERTIVO.ROL add constraint pk_rol primary key(rol_id);
alter table MAS_INSERTIVO.ROL add constraint uc_rol_nombre unique(rol_nombre);

/****** Creacion de constraints para la tabla FUNCIONALIDAD ******/
alter table MAS_INSERTIVO.FUNCIONALIDAD add constraint pk_funcionalidad primary key(func_id);
alter table MAS_INSERTIVO.FUNCIONALIDAD add constraint uc_func_nombre unique(func_nombre);

/****** Creacion de constraints para la tabla ROL_FUNCIONALIDAD ******/
alter table MAS_INSERTIVO.ROL_FUNCIONALIDAD add constraint pk_rol_funcionalidad primary key(rolfunc_rol_id, rolfunc_func_id);
alter table MAS_INSERTIVO.ROL_FUNCIONALIDAD add constraint fk_rolfunc_rol_id foreign key(rolfunc_rol_id) references MAS_INSERTIVO.ROL(rol_id);
alter table MAS_INSERTIVO.ROL_FUNCIONALIDAD add constraint fk_rolfunc_func_id foreign key(rolfunc_func_id) references MAS_INSERTIVO.FUNCIONALIDAD(func_id);

/****** Creacion de constraints para la tabla TIPO_USUARIO ******/
alter table MAS_INSERTIVO.TIPO_USUARIO add constraint pk_tipo_usuario primary key(tipousua_id);
alter table MAS_INSERTIVO.TIPO_USUARIO add constraint uc_tipousua_nombre unique(tipousua_nombre);

/****** Creacion de constraints para la tabla USUARIO ******/
alter table MAS_INSERTIVO.USUARIO add constraint pk_usuario primary key(usua_id);
alter table MAS_INSERTIVO.USUARIO add constraint fk_usua_tipo foreign key(usua_tipo) references MAS_INSERTIVO.TIPO_USUARIO(tipousua_id);
alter table MAS_INSERTIVO.USUARIO add constraint uc_usua_username unique(usua_username);

/****** Creacion de constraints para la tabla USUARIO_ROL ******/
alter table MAS_INSERTIVO.USUARIO_ROL add constraint pk_usuario_rol primary key(usuarol_usua_id, usuarol_rol_id);
alter table MAS_INSERTIVO.USUARIO_ROL add constraint fk_usuarol_usua_id foreign key (usuarol_usua_id) references MAS_INSERTIVO.USUARIO(usua_id);
alter table MAS_INSERTIVO.USUARIO_ROL add constraint fk_usuarol_rol_id foreign key (usuarol_rol_id) references MAS_INSERTIVO.ROL(rol_id);

/****** Creacion de constraints para la tabla TIPO_DOCUMENTO ******/
alter table MAS_INSERTIVO.TIPO_DOCUMENTO add constraint pk_tipo_documento primary key(tipodoc_id);
alter table MAS_INSERTIVO.TIPO_DOCUMENTO add constraint uc_tipodoc_nombre unique(tipodoc_nombre);

/****** Creacion de constraints para la tabla CLIENTE ******/
alter table MAS_INSERTIVO.CLIENTE add constraint pk_cliente primary key(clie_tipo_doc, clie_nro_doc);
alter table MAS_INSERTIVO.CLIENTE add constraint fk_clie_tipo_doc foreign key(clie_tipo_doc) references MAS_INSERTIVO.TIPO_DOCUMENTO(tipodoc_id);
alter table MAS_INSERTIVO.CLIENTE add constraint fk_clie_usua_id foreign key(clie_usua_id) references MAS_INSERTIVO.USUARIO(usua_id);


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
	set @var_usua_tipo = (select tipousua_id from MAS_INSERTIVO.TIPO_USUARIO where tipousua_nombre = 'Cliente');
	
	insert into MAS_INSERTIVO.USUARIO
	(usua_username, usua_password, usua_tipo)
	values ('NOMBRE4', 'PASS4', @var_usua_tipo);
		
	insert into MAS_INSERTIVO.CLIENTE
	(clie_tipo_doc, clie_nro_doc, clie_usua_id, clie_apellido, clie_nombre,
	 clie_mail, clie_telefono, clie_dom_calle, clie_nro_calle, clie_piso, clie_depto,
	 clie_localidad, clie_cod_postal, clie_fecha_nac, clie_cuil)
	SELECT clie_tipo_doc, clie_nro_doc, @@IDENTITY, clie_apellido, clie_nombre,
	 clie_mail, clie_telefono, clie_dom_calle, clie_nro_calle, clie_piso, clie_depto,
	 clie_localidad, clie_cod_postal, clie_fecha_nac, clie_cuil FROM inserted;
	
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
(tipousua_nombre)
values
('Empresa'),
('Administrativo'),
('Cliente');

/****** Insercion de datos en la tabla USUARIO ******/


/****** Insercion de datos en la tabla USUARIO_ROL ******/


/****** Insercion de datos en la tabla TIPO_DOCUMENTO ******/
insert into MAS_INSERTIVO.TIPO_DOCUMENTO
(tipodoc_nombre)
values
('DNI'),
('CI'),
('LC'),
('LE'),
('PASAPORTE');


/****** Insercion de datos en la tabla CLIENTE ******/
-- Existian 28 clientes unicos
-- Modificar 7777 en clie_usua_id una vez que este creado el trigger para insercion de usuario previo al cliente.
/****
declare @var_tipo_doc int;
set @var_tipo_doc = (select tipodoc_id from MAS_INSERTIVO.TIPO_DOCUMENTO where tipodoc_nombre = 'DNI');

insert into MAS_INSERTIVO.CLIENTE
(clie_tipo_doc, clie_nro_doc, clie_usua_id, clie_apellido, clie_nombre,
clie_mail, clie_dom_calle, clie_nro_calle, clie_piso,
clie_depto, clie_cod_postal, clie_fecha_nac)
select distinct @var_tipo_doc, Cli_Dni, 7777, Cli_Apeliido, Cli_Nombre,
Cli_Mail, Cli_Dom_Calle, Cli_Nro_Calle, Cli_Piso,
Cli_Depto, Cli_Cod_Postal, Cli_Fecha_Nac
from gd_esquema.Maestra
where Cli_Dni is not null;
*****/


/***************************************************/
/****** CREACION DE TRIGGERS - POST MIGRACION ******/
/***************************************************/

-- TRIGGER inhabilitar rol

-- TRIGGER inhabilitar usuario (3 intentos fallidos de login)

-- TRIGGER unicidad del telefono CLIENTE (hay muchos NULL, asi que verificar por trigger)


/*********************************/
/****** CREACION DE INDICES ******/
/*********************************/

