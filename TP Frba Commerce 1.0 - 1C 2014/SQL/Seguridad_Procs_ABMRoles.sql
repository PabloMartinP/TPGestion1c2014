--exec Funcionalidad_BuscarPorRol 1
create proc MAS_INSERTIVO.funcionalidad_BuscarPorRol
@Rol_ID int
as
begin	
	select f.func_ID, 
		f.func_nombre, 
		(CASe p.Rol_id when @Rol_ID then '1' else '0' end ) as Permitido 
		  from MAS_INSERTIVO.Funcionalidad f 
	left join (select * from MAS_INSERTIVO.rol_funcionalidad where rol_id=@Rol_ID) p on f.func_id=p.func_id
	
end
go-------------------------------------
create proc MAS_INSERTIVO.Rol_Agregar  
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
	where Rol_ID=@Rol_ID	
end