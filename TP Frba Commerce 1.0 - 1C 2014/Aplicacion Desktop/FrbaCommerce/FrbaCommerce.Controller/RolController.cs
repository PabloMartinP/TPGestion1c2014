using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controller
{
    public class RolController 
    {
        
        /*
        public Rol BuscarByCliente(Cliente cliente)
        {

            RolDAO rolDAO = new RolDAO();
            return rolDAO.BuscarByUsuario(cliente.Usuario_ID);
        }*/
        
        /*
        public DataTable Funcionalidades(Rol rol)
        {
            RolDAO rolDAO = new RolDAO();
            return rolDAO.Funcionalidades(rol);
        }
         */
        public Rol Buscar(int Rol_ID)
        {
            SqlConexion cnn = new SqlConexion("Rol_Buscar");
            cnn.Command.Parameters.Add("Rol_ID", System.Data.SqlDbType.Int).Value = Rol_ID;

            DataTable dt = cnn.Ejecutar();

            Rol rol = new Rol();
            
            rol.ID = (int)dt.Rows[0][0];
            rol.Nombre = dt.Rows[0][1].ToString();

            FuncionalidadController fc = new FuncionalidadController();
            
            rol.Funcionalidades = fc.Listar(rol.ID);

            return rol; 

        }
        
        /// <summary>
        /// buscar los roles haciendo like por nombre
        /// </summary>
        /// <param name="rol"></param>
        /// <returns></returns>
        public DataTable Filtrar(Rol rol)
        {
            //RolDAO rolDAO = new RolDAO();
            SqlConexion cnn = new SqlConexion("Rol_Filtrar");
            cnn.Command.Parameters.Add("Rol_Nombre", System.Data.SqlDbType.NVarChar, 50).Value = rol.Nombre;

            return cnn.Ejecutar();
        }

        //public void Deshabilitar(Rol unRol)
        //{
        //    RolDAO rolDAO = new RolDAO();
        //    unRol.Habilitado = false;
        //    rolDAO.Habilitado(unRol);
        //}
        //public void Habilitar(Rol unRol)
        //{
        //    RolDAO rolDAO = new RolDAO();
        //    unRol.Habilitado = true;
        //    rolDAO.Habilitado(unRol);
        //}

        /*
        public Rol ObtenerRolCliente()
        {
            //RolDAO rolDao = new RolDAO();
            //return rolDao.ObtenerRolCliente();
            return null;
        }

        public Rol ObtenerRolProveedor()
        {
            /*
            RolDAO rolDao = new RolDAO();
            return rolDao.ObtenerRolProveedor();
            return null;
        }
        
        public DataTable ListarProveedores()
        {
            RolDAO rolDAO = new RolDAO();
            return rolDAO.ListarProveedorDT();
        }

        public DataTable ListarClientes()
        {
            RolDAO rolDAO = new RolDAO();
            return rolDAO.ListarClienteDT();
        }

        public DataTable ListarIncluyendoEliminados()
        {
            RolDAO rolDAO = new RolDAO();
            return rolDAO.ListarDT();

            //return rolDAO.ListarDT(true);
        }

        public DataTable Listar()
        {
            RolDAO rolDAO = new RolDAO();

            return rolDAO.ListarDT();
        }
        */
        /// <summary>
        /// agrego el rol y su listado de funcionalidades para ese rol
        /// </summary>
        /// <param name="unRol"></param>
        public void Agregar(Rol unRol)
        {
            SqlConexion cnn = new SqlConexion("Rol_Agregar");

            cnn.Command.Parameters.Add("Nombre", System.Data.SqlDbType.NVarChar, 50).Value = unRol.Nombre;
            
            //el SP me devulve el nuevo ID
            unRol.ID = int.Parse(cnn.Ejecutar().Rows[0][0].ToString());

            PermisoController cPermiso = new PermisoController();
            //agrego solo las funcionalidades permitidas
            foreach (Funcionalidad unaFuncionalidad in unRol.Funcionalidades.FindAll(f => f.Permitida))
            {
                //cPermiso.Agregar(new Permiso());
                cPermiso.Agregar(new Permiso(unRol, unaFuncionalidad));
            }


        }
        /// <summary>
        /// agrega las funcionalidades permitidas a un rol
        /// </summary>
        /// <param name="unRol"></param>
        protected void AgregarFuncionalidades(Rol unRol)
        {
            PermisoController cPermiso = new PermisoController();
            //agrego solo las funcionalidades permitidas
            foreach (Funcionalidad unaFuncionalidad in unRol.Funcionalidades.FindAll(f => f.Permitida))
            {
                cPermiso.Agregar(new Permiso(unRol, unaFuncionalidad));
            }

        }
        /// <summary>
        /// elimina todos los permisos y el rol
        /// </summary>
        /// <param name="id"></param>
        public void Borrar(int id)
        {
            SqlConexion cnn = new SqlConexion("Rol_BajaLogica");

            cnn.Command.Parameters.Add("Rol_ID", System.Data.SqlDbType.Int).Value = id;
            cnn.EjecutarSolo();

        }

        public void Modificar(Rol unRol)
        {
            SqlConexion cnn = new SqlConexion("Rol_Modificar");
            cnn.Command.Parameters.Add("Rol_ID", System.Data.SqlDbType.Int).Value = unRol.ID;
            cnn.Command.Parameters.Add("Rol_Nombre", System.Data.SqlDbType.NVarChar, 50).Value = unRol.Nombre;

            cnn.EjecutarSolo();

            PermisoController cPermiso = new PermisoController();
            this.ModificarFuncionalidades(unRol);


        }
        protected void ModificarFuncionalidades(Rol unRol)
        {
            PermisoController cPermiso = new PermisoController();
            //elimino todas y despues agrego
            cPermiso.Borrar(unRol.ID);

            AgregarFuncionalidades(unRol);
        }
        

    }
}
