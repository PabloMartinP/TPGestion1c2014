using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controller
{
    public class PermisoController
    {
        public void Agregar(Permiso permiso)
        {
            SqlConexion cnn = new SqlConexion("Permiso_Agregar");

            cnn.Command.Parameters.Add("Rol_ID", System.Data.SqlDbType.Int).Value = permiso.Rol.ID;
            cnn.Command.Parameters.Add("Fun_ID", System.Data.SqlDbType.Int).Value = permiso.Funcionalidad.ID;

            cnn.EjecutarSolo();
        }

        public void Borrar(int idRol)
        {
            SqlConexion cnn = new SqlConexion("Permiso_EliminarPorRol");
            cnn.Command.Parameters.Add("Rol_ID", System.Data.SqlDbType.Int).Value = idRol;

            cnn.EjecutarSolo();

        }
    }
}
