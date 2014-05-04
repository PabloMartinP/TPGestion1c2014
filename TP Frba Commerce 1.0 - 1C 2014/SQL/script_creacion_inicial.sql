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

/**********************************/
/****** CREACION DE TRIGGERS ******/
/**********************************/

/****** Creacion de triggers para la tabla ROL ******/
-- TRIGGER inhabilitar rol


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


/*********************************/
/****** CREACION DE INDICES ******/
/*********************************/

