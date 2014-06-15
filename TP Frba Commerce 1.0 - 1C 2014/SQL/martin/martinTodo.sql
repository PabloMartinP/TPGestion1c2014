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
	where preg_respuesta is not null and preg_usuario = @usuario
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

create view mas_insertivo.vw_Personas 
as
	select usua_id, (clie_apellido + ', ' + clie_nombre ) as Nombre from MAS_INSERTIVO.vw_usuario
	inner join MAS_INSERTIVO.CLIENTE on usua_id = clie_usuario
	union
	select usua_id, (empr_razon_social ) as Nombre from MAS_INSERTIVO.vw_usuario	
	inner join MAS_INSERTIVO.EMPRESA on usua_id = empr_usuario	
go
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
  round((case publ_tipo when 1 then (comp_cantidad * publ_precio)  
        else ofer_monto end ) * visi_porcentaje ,2) as Precio  
  --, * from MAS_INSERTIVO.compra c  
  from MAS_INSERTIVO.compra c  
 inner join MAS_INSERTIVO.vw_publicacionesFinalizadas on publ_id = comp_publicacion   
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
		publ_precio * comp_cantidad	as Precio	
	from MAS_INSERTIVO.COMPRA
	left join MAS_INSERTIVO.PUBLICACION on comp_publicacion = publ_id
	where publ_tipo = 1 --compraInmediata 
		and comp_usuario = @usuario
end
go
create proc MAS_INSERTIVO.Historial_Oferta
@usuario int
as
begin
	select ofer_publicacion, publ_descripcion, ofer_monto, ofer_ganadora
	from MAS_INSERTIVO.OFERTA
	left join MAS_INSERTIVO.PUBLICACION on ofer_publicacion = publ_id
	where ofer_usuario = @usuario
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
		and publ_usuario = @usuario
end

go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------
go-----------------------------------------------

