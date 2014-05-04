
---------------------------Inserts--------------------------
insert into mas_insertivo.rol
(Rol_Nombre)
values
('Empresa'),('Administrativo'),('Cliente');


insert into mas_insertivo.Funcionalidad
(func_nombre)
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
('Listado Estadistico');

--------------------------Rol--------------------------

alter table mas_insertivo.Rol add constraint pk_rol primary key(rol_id);

--------------------------Funcionalidad--------------------------

alter table mas_insertivo.Funcionalidad
add constraint pk_funcionalidad primary key(func_id);
alter table mas_insertivo.rol_Funcionalidad
add constraint pk_rol_funcionalidad primary key(rol_id, func_id);
alter table mas_insertivo.rol_Funcionalidad 
add constraint fk_rol_funcionalidad_rol  foreign key(rol_id) references mas_insertivo.rol(rol_id) on delete cascade;
alter table mas_insertivo.rol_Funcionalidad 
add constraint fk_rol_funcionalidad_func foreign key(func_id) references mas_insertivo.funcionalidad(func_id);
 
--------------------------Tipo_Usuario--------------------------

alter table mas_insertivo.Tipo_Usuario
add constraint pk_usuario_tipo primary key (tusr_id);


--------------------------Usuario--------------------------

alter table mas_insertivo.Usuario
add constraint pk_usuario primary key(usua_id);
alter table mas_insertivo.Usuario
add constraint uq_usuario_name unique(usua_name);
alter table mas_insertivo.Usuario
add constraint fk_usuario_tipo foreign key (usua_tipo) references mas_insertivo.Tipo_Usuario (tusr_id);
 
--------------------------Tipo_Documento--------------------------
 
alter table mas_insertivo.Tipo_Documento
add constraint pk_tipo_documento primary key (tdoc_id);

--------------------------Cliente--------------------------

alter table mas_insertivo.Cliente
add constraint pk_cliente primary key(clie_usuario);
alter table mas_insertivo.Cliente
add constraint fk_cliente_usuario foreign key (clie_usuario) references mas_insertivo.Usuario(usua_id);
alter table mas_insertivo.Cliente
add constraint fk_cliente_tipoDoc foreign key (clie_tipo_doc) references mas_insertivo.Tipo_Documento(tdoc_id);
--alter table mas_insertivo.Cliente
--add constraint uq_cliente_telefono unique (clie_telefono); Vamos a usar un trigger porque para migrar los telefonos vienen en null.
alter table mas_insertivo.Cliente
add constraint uq_cliente_tipo_num_doc unique (clie_tipo_doc, clie_num_doc); 
alter table mas_insertivo.Cliente
add constraint ck_cliente_puntuacion check(clie_puntuacion >= 0 and clie_puntuacion <= 10 );


--------------------------Empresa--------------------------

alter table mas_insertivo.Empresa
add constraint pk_empresa primary key(empr_usuario);
alter table mas_insertivo.Empresa
add constraint fk_empresa_usuario foreign key (empr_usuario) references mas_insertivo.Usuario(usua_id);
alter table mas_insertivo.Empresa
add constraint uq_empresa_cuit unique(empr_cuit);
alter table mas_insertivo.Empresa
add constraint uq_empresa_razon_social unique(empr_razon_social);
alter table mas_insertivo.Empresa
add constraint ck_empresa_puntuacion check(empr_puntuacion >= 0 and empr_puntuacion <= 10 );


--------------------------Usuario_Rol--------------------------

alter table mas_insertivo.Usuario_Rol 
add constraint pk_usuario_rol primary key(usua_id, rol_id);
alter table mas_insertivo.Usuario_Rol
add constraint fk_usuario_rol_usua foreign key(usua_id) references mas_insertivo.Usuario(usua_id);
alter table mas_insertivo.Usuario_Rol
add constraint fk_usuario_rol_rol foreign key(rol_id) references mas_insertivo.Rol(rol_id);

--------------------------Rubro--------------------------

alter table mas_insertivo.Rubro add constraint pk_rubro primary key(rubr_id);
alter table mas_insertivo.Rubro add constraint uq_rubro unique(rubr_codigo);

--------------------------Visibilidad--------------------------

alter table mas_insertivo.Visibilidad add constraint pk_visibilidad primary key(visi_id);

--------------------------Bonificacion--------------------------
 
alter table mas_insertivo.Bonificacion
add constraint pk_bonificacion primary key(boni_usuario, boni_visibilidad );
alter table mas_insertivo.Bonificacion
add constraint fk_bonificacion_usuario foreign key(boni_usuario) references mas_insertivo.Usuario(usua_id);
alter table mas_insertivo.Bonificacion
add constraint fk_bonificacion_visibilidad foreign key(boni_visibilidad) references mas_insertivo.Visibilidad(visi_id);

--------------------------Publicacion_Estado--------------------------

alter table mas_insertivo.Publicacion_Estado add constraint pk_epub primary key(epub_id);

--------------------------Tipo_Publicacion--------------------------
 
alter table mas_insertivo.Tipo_Publicacion add constraint pk_tipo_publi primary key(tpub_id)

--------------------------Publicacion--------------------------
 
alter table mas_insertivo.Publicacion add constraint pk_publicacion primary key(publ_id);
alter table mas_insertivo.Publicacion add constraint fk_publicacion_visibilidad foreign key(publ_visibilidad)
references mas_insertivo.Visibilidad(visi_id);
alter table mas_insertivo.Publicacion add constraint fk_publicacion_usuario foreign key(publ_usuario)
references mas_insertivo.Usuario(usua_id);
alter table mas_insertivo.Publicacion add constraint fk_tipo_publicacion foreign key(publ_tipo)
references mas_insertivo.Tipo_Publicacion(tpub_id);
alter table mas_insertivo.Publicacion add constraint fk_publicacion_estado foreign key(publ_estado)
references mas_insertivo.Publicacion_Estado(epub_id);

--------------------------Publicacion_Rubro--------------------------

alter table mas_insertivo.Publicacion_Rubro add constraint pk_publicacion_rubro primary key(publ_id, rubr_id);
alter table mas_insertivo.Publicacion_Rubro add constraint fk_publicacion_rubro_publ foreign key(publ_id)
references mas_insertivo.Publicacion(publ_id);
alter table mas_insertivo.Publicacion_Rubro add constraint fk_publicacion_rubro_rubro foreign key(rubr_id)
references mas_insertivo.Rubro(rubr_id);

--------------------------Compra--------------------------

alter table mas_insertivo.Compra add constraint pk_compra primary key(comp_id);
alter table mas_insertivo.Compra add constraint fk_compra_publicacion foreign key(comp_publicacion)
references mas_insertivo.Publicacion(publ_id);
alter table mas_insertivo.Compra add constraint fk_compra_usuario foreign key(comp_usuario)
references mas_insertivo.Usuario(usua_id);

--------------------------Oferta--------------------------

alter table mas_insertivo.Oferta add constraint pk_oferta primary key(ofer_id);
alter table mas_insertivo.Oferta add constraint fk_oferta_publicacion foreign key(ofer_publicacion)
references mas_insertivo.Publicacion(publ_id);
alter table mas_insertivo.Oferta add constraint fk_oferta_usuario foreign key(ofer_usuario)
references mas_insertivo.Usuario(usua_id);

--------------------------Calificacion--------------------------
 
alter table mas_insertivo.Calificacion add constraint pk_calificacion primary key(cali_publicacion);
alter table mas_insertivo.Calificacion add constraint fk_calificacion_publicacion foreign key(cali_publicacion)
references mas_insertivo.Publicacion(publ_id);

--------------------------Factura_Pago--------------------------

--alter table mas_insertivo.Facturas_Pagos add constraint pk_Facturas_Pagos primary key(Pago_ID);

--------------------------Factura_Cabecera--------------------------

alter table mas_insertivo.Factura_Cabecera add constraint pk_factura_cabecera primary key(fact_id);
alter table mas_insertivo.Factura_Cabecera add constraint fk_factura_cabecera_usua foreign key(fact_usuario) 
references mas_insertivo.Usuario(usua_id);
--alter table mas_insertivo.Factura_Cabecera add constraint fk_factura_cabecera_pago foreign key(fact_pago) 
--references mas_insertivo.Factura_Pago(pago_id);

--------------------------Factura_Item--------------------------

alter table mas_insertivo.Factura_Item add constraint pk_factura_item primary key(item_factura, item_renglon);
alter table mas_insertivo.Factura_Item add constraint fk_factura_item_fact foreign key(item_factura)
references mas_insertivo.Factura_Cabecera(fact_id); 
alter table mas_insertivo.Factura_Item add constraint fk_factura_item_publ foreign key(item_publicacion)
references mas_insertivo.Publicacion(publ_id); --select * from Publicaciones

--------------------------Pregunta--------------------------

alter table mas_insertivo.Pregunta add constraint pk_pregunta primary key(preg_id);
alter table mas_insertivo.Pregunta add constraint fk_pregunta_publicacion_publ foreign key(preg_publicacion) 
references mas_insertivo.Publicacion(publ_id);
alter table mas_insertivo.Pregunta add constraint fk_pregunta_publicacion_usua foreign key(preg_usuario) 
references mas_insertivo.Usuario(usua_id);


--------------------------Detalle_Tarjeta--------------------------
 
alter table mas_insertivo.Detalle_Tarjeta add constraint pk_detalle_tarjeta_numero primary key(tarj_numero);
alter table mas_insertivo.Detalle_Tarjeta add constraint fk_detalle_tarjeta_num_usua foreign key(tarj_usuario) 
references mas_insertivo.usuario (usua_id);
