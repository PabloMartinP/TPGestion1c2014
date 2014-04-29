create table Roles
(
Rol_ID int identity(1,1), 
Rol_Nombre nvarchar(50) not null, 
Rol_Habilitado bit default 1,
Rol_Eliminado bit default 0, 
);
alter table roles add constraint pk_roles primary key(Rol_ID);
insert into Roles
(Rol_Nombre)
values
('Empresa'),('Administrativo'),('Cliente');
create table Funcionalidades
(
Fun_ID int identity(1,1), 
Fun_Nombre nvarchar(50)
);
alter table Funcionalidades
add constraint pk_Funcionalidades primary key(Fun_ID);
insert into funcionalidades
(Fun_Nombre)
values
('ABM Rol'),
('ABM Cliente'),
('ABM Empresa'),
('ABM Rubro'),
('ABM Visibilidad De Publicación'),
('Generar Publicació'),
('Editar Publicación'),
('Gestion de Preguntas'),
('Comprar/Ofertar'),
('Historial del Cliente'),
('Calificar al Vendedor'),
('Facturar Publicaciones'),
('Listado Estadistico')
go--------------------------
create table Roles_Funcionalidades
(
Rol_ID int not null, 
Fun_ID int not null
);
alter table Roles_Funcionalidades 
add constraint pk_Roles_Funcionalidades primary key(Rol_ID, Fun_ID);
alter table Roles_Funcionalidades 
add constraint fk_Roles_Funcionalidades_Roles  foreign key(Rol_ID) references Roles(Rol_ID);
alter table Roles_Funcionalidades 
add constraint fk_Roles_Funcionalidades_Funcionalidades foreign key(Fun_ID) references Funcionalidades(Fun_ID)
go--------------------------
create table Usuarios
(
Usuario_ID int identity(1,1), 
Usuario_UserName nvarchar(50), 
Usuario_Password nvarchar(100), 
Usuario_Habilitado bit default 1, 
Usuario_Eliminado bit default 0, 
Usuario_CantidadDeIntentos int default 0
);
alter table Usuarios 
add constraint pk_Usuarios primary key(Usuario_ID);
alter table usuarios
add constraint uq_Usuarios_UserName unique(Usuario_UserName);
go--------------------------
create table Usuarios_Roles
(
Usuario_ID int not null, 
Rol_ID int not null
);
alter table Usuarios_Roles 
add constraint pk_Usuarios_Roles primary key(Usuario_ID, Rol_ID);
alter table Usuarios_Roles
add constraint fk_Usuarios_Roles_Usuarios foreign key(Usuario_ID) references Usuarios(Usuario_ID);
alter table Usuarios_Roles
add constraint fk_Usuarios_Roles_Roles foreign key(Rol_ID) references Roles(Rol_ID);
go--------------------------
create table Rubros --drop table Rubros
(
Rubro_ID int identity(1,1), 
Rubro_Descripcion nvarchar(255)
);
alter table rubros add constraint pk_rubros primary key(Rubro_ID);
go--------------------------
create table Visibilidades--drop table Visibilidad alter table Visibilidad drop constraint pk_visibilidad
(
Visi_ID numeric(18,0) not null, 
Visi_Descripcion nvarchar(255), 
Visi_Precio numeric(18,2), 
Visi_Porcentaje numeric(18,2)
);
alter table Visibilidades add constraint pk_visibilidades primary key(Visi_ID)
go--------------------------
create table Publicacion_Estados
(
Estado_ID int identity(1,1), 
Estado_Descripcion nvarchar(255)
);
alter table Publicacion_Estados add constraint pk_Publicacion_Estados primary key(Estado_ID);
go--------------------------
create table Publicacion_Tipos
(
Tipo_ID int identity(1,1), 
Tipo_Descripcion nvarchar(255)
);
alter table Publicacion_Tipos add constraint pk_Publicacion_Tipos primary key(Tipo_ID)
go----------------------------
create table Publicaciones --drop table Publicaciones
(
Publ_ID numeric(18,0) not null, 
Publ_Descripcion nvarchar(255), 
Publ_Stock numeric(18,0), 
Publ_Fecha datetime, 
Publ_Fecha_Vencimiento datetime, 
Publ_Precio numeric(18,2), 
Publ_Visibilidad numeric(18,0),--fk
Publ_Usuario int, --fk
Publ_Estado int, --fk
Publ_Tipo int, --fk
Publ_PermitirPreguntas bit
);
alter table publicaciones add constraint pk_publicaciones primary key(Publ_ID);
alter table publicaciones add constraint fk_Publicaciones_Visibilidades foreign key(Publ_Visibilidad)
references Visibilidades(Visi_ID);
alter table publicaciones add constraint fk_Publicaciones_Usuarios foreign key(Publ_usuario)
references Usuarios(Usuario_ID);
alter table publicaciones add constraint fk_Publicaciones_Tipos foreign key(Publ_Tipo)
references Publicacion_Tipos(Tipo_ID);
alter table publicaciones add constraint fk_Publicaciones_Estados foreign key(Publ_Estado)
references Publicacion_Estados(Estado_ID);
go------------------------------
create table Publicaciones_Rubros
(
Publ_ID numeric(18,0)not null, 
Rubro_ID int not null,
);
alter table Publicaciones_Rubros add constraint pk_Publicaciones_Rubros primary key(Publ_ID, Rubro_ID);
alter table Publicaciones_Rubros add constraint fk_Publicaciones_Rubros_Publicaciones foreign key(Publ_ID)
references Publicaciones(Publ_ID);
alter table Publicaciones_Rubros add constraint fk_Publicaciones_Rubros_Rubros foreign key(Rubro_ID)
references RUbros(Rubro_ID);
go--------------------------
create table Compras
(
Compra_ID int identity(1,1),
Compra_Publicacion numeric(18,0), 
Compra_Fecha datetime, 
Compra_Cantidad numeric(18,0)
);
alter table Compras add constraint pk_compras primary key(Compra_ID);
alter table COmpras add constraint fk_Compras_Publicaciones foreign key(Compra_Publicacion)
references Publicaciones(Publ_ID);
create table Ofertas
(Oferta_ID int identity(1,1), 
Oferta_Publicacion numeric(18,0),
Oferta_Fecha datetime, 
Oferta_Monto numeric(18,2)
);
alter table Ofertas add constraint pk_ofertas primary key(Oferta_ID);
alter table Ofertas add constraint fk_ofertas_Publicaciones foreign key(Oferta_Publicacion)
references Publicaciones(Publ_ID);
go--------------------------
create table Calificaciones -- drop table Calificaciones
(
Cali_ID int not null,
Cali_Usuario int, 
Cali_Publicacion numeric(18,0),
Cali_Cant_Estrellas smallint, 
Cali_Descripcion nvarchar(255)
);
alter table Calificaciones add constraint pk_Calificaciones primary key(Cali_ID);
alter table Calificaciones add constraint fk_Calificaciones_Publicacion foreign key(Cali_Publicacion)
references Publicaciones(Publ_ID);
go--------------------------
create table Facturas_Pagos
(
Pago_ID int identity(1,1), 
Pago_Descripcion nvarchar(255)
);
alter table Facturas_Pagos add constraint pk_Facturas_Pagos primary key(Pago_ID);
create table Facturas_Cabecera
(
Fact_ID int not null, 
Fact_Fecha datetime, 
Fact_Usuario int, 
Fact_Pago int, 
Fact_Total numeric(18,2)
);
alter table Facturas_Cabecera add constraint pk_Facturas_Cabecera primary key(Fact_ID);
alter table Facturas_Cabecera add constraint fk_Facturas_Cabecera_Usuario foreign key(Fact_Usuario) 
references Usuarios(Usuario_ID);
alter table Facturas_Cabecera add constraint fk_Facturas_Cabecera_Pago foreign key(Fact_Pago) 
references Facturas_Pagos(Pago_ID);
create table Facturas_Items
(
Item_Factura int not null, 
Item_Renglon int not null, 
Item_Publicacion numeric(18,0),
Item_Cantidad numeric(18,0), 
Item_Monto numeric(18,2)
);
alter table Facturas_items add constraint pk_Facturas_Items primary key(Item_Factura, Item_Renglon);
alter table Facturas_items add constraint fk_Facturas_items_Facturas foreign key(Item_Factura)
references Facturas_Cabecera(Fact_ID); 
alter table Facturas_items add constraint fk_Facturas_items_Publicacion foreign key(Item_Publicacion)
references Publicaciones(Publ_ID); --select * from Publicaciones
go--------------------------
create table Preguntas
(
Preg_ID int identity(1,1), 
Preg_Publicacion numeric(18,0), 
Preg_Descripcion nvarchar(255), 
Preg_Usuario int, 
Preg_Respuesta nvarchar(255), 
Preg_Respuesta_Fecha datetime
);
alter Table Preguntas add constraint pk_Pregunta primary key(Preg_ID);
alter table Preguntas add constraint fk_Pregunta_Publicacion_Publicacion foreign key(Preg_Publicacion) 
references Publicaciones(Publ_ID);
alter table Preguntas add constraint fk_Pregunta_Publicacion_Usuarios foreign key(Preg_Usuario) 
references Usuarios(Usuario_ID);

go--------------------------
go--------------------------
go--------------------------
go--------------------------
go--------------------------
go--------------------------
go--------------------------
go--------------------------


