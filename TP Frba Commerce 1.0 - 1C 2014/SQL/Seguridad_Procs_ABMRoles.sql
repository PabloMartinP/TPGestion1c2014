exec Funcionalidad_BuscarPorRol 1
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
CREATE proc Rol_Agregar
@Nombre nvarchar(50)
as
begin
--select * from i_a_c.Roles

	INSERT INTO Roles
	(Rol_Nombre)
	VALUES	(@Nombre)	
	
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
select Rol_ID, Rol_Nombre from Roles 
where Rol_Eliminado=0
go-------------------------------
CREATE proc [Rol_Filtrar]
@ROl_Nombre nvarchar(50)
--,@tipo_nombre nvarchar(50)
as
begin
	select * from vw_roles r
	--select r.Rol_ID, r.Rol_Nombre, p.Tipo_Nombre from I_A_C.vw_Roles r
	--inner join I_A_C.Tipo p on p.Tipo_ID=r.Tipo_ID
	where 
		r.Rol_Nombre like '%' +@ROl_Nombre + '%'
--		and p.Tipo_Nombre like ''%'' + @tipo_nombre + '%' 
end
go-------------------------------
CREATE proc [Rol_Buscar]
@Rol_ID int
as
begin
	--select * from I_A_C.roles
	--select * from I_A_C.vw_roles r
	select r.Rol_ID, r.Rol_Nombre
		from roles r		
	where r.Rol_ID=@Rol_ID	and r.Rol_Eliminado=0
end
go--------------------------
CREATE proc [Rol_Modificar]
@Rol_ID int, 
@Rol_Nombre nvarchar(50)
as
begin
UPDATE Roles
   SET Rol_Nombre = @Rol_Nombre
 WHERE Rol_ID=@Rol_ID 
    
end
go--------------------------------
create proc [Permiso_EliminarPorRol]
@Rol_ID int
as
begin
	delete from Roles_Funcionalidades
	where Rol_ID=@Rol_ID	
end