--exec Funcionalidad_BuscarPorRol 1
create proc Funcionalidad_BuscarPorRol
@Rol_ID int
as
begin	
	select f.fun_ID, 
		f.fun_nombre, 
		(CASe p.Rol_id when @Rol_ID then '1' else '0' end ) as Permitido 
		  from funcionalidades f 
	left join (select * from Roles_Funcionalidades where rol_id=@Rol_ID) p on f.fun_id=p.fun_id
	
end
go-------------------------------------
create proc Rol_Agregar  
@Nombre nvarchar(50), 
@Habilitado bit
as  
begin  
--select * from Roles  
  
 INSERT INTO Roles  
 (Rol_Nombre, Rol_Habilitado)
 VALUES (@Nombre, @Habilitado)   
   
 select @@IDENTITY as 'ID'  
end  
go--------------------------
create proc [Permiso_Agregar]
@Rol_ID int, 
@Fun_ID int
as
begin
	insert into Roles_Funcionalidades
	values
	(@Rol_ID, @Fun_ID)
	
end
go------------------------------
CREATE view [vw_roles]
as
select Rol_ID, Rol_Nombre, Rol_Habilitado from Roles 
where Rol_Eliminado=0
go-------------------------------
CREATE proc [Rol_Filtrar]  
@ROl_Nombre nvarchar(50)  
as  
begin  
 select * from vw_roles r   
 where   
  r.Rol_Nombre like '%' +@ROl_Nombre + '%'  
--  and p.Tipo_Nombre like ''%'' + @tipo_nombre + '%'   
end  
go-------------------------------
create proc [Rol_Buscar]  
@Rol_ID int  
as  
begin   
 select r.Rol_ID, r.Rol_Nombre, Rol_Habilitado
  from roles r
 where r.Rol_ID=@Rol_ID and r.Rol_Eliminado=0
end  
go--------------------------
create proc [Rol_Modificar]  
@ID int,   
@Nombre nvarchar(50), 
@Habilitado bit
as  
begin  
UPDATE Roles  
   SET Rol_Nombre = @Nombre, 
	Rol_Habilitado = @Habilitado
 WHERE Rol_ID=@ID
 
end
go--------------------------------
create proc [Permiso_EliminarPorRol]
@Rol_ID int
as
begin
	delete from Roles_Funcionalidades
	where Rol_ID=@Rol_ID	
end