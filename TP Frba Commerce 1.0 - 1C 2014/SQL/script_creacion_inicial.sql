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
create table MAS_INSERTIVO.USUARIO
(
usua_id int identity(1,1),
usua_username nvarchar(50) not null,
usua_password binary(32) not null,
usua_tipo int not null,
usua_habilitado bit default 1 not null,
usua_eliminado bit default 0 not null,
usua_cant_intentos int default 0 not null,
usua_primer_login bit default 0 not null,
usua_calific_pendientes int default 0 not null
);

/****** Creacion de la tabla USUARIO_ROL ******/
create table MAS_INSERTIVO.USUARIO_ROL
(
usuarol_usua_id int not null,
usuarol_rol_id int not null
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


/**********************************/
/****** CREACION DE TRIGGERS ******/
/**********************************/

/****** Creacion de triggers para la tabla ROL ******/
-- TRIGGER inhabilitar rol

/****** Creacion de triggers para la tabla USUARIO ******/
-- TRIGGER inhabilitar usuario (3 intentos fallidos de login)


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


/*********************************/
/****** CREACION DE INDICES ******/
/*********************************/

