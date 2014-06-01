using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controller
{
    public class EmpresaController
    {
        public void Agregar(Empresa empresa)
        {

            //agrego el usuario
            UsuarioController uc = new UsuarioController();
            uc.Agregar(empresa.Usuario);
            empresa.Usuario = uc.Buscar(empresa.Usuario.UserName);


            //agrego el cliente

            SqlConexion sql = new SqlConexion("Empresa_Agregar");

            sql.Command.Parameters.Add("@usuario", System.Data.SqlDbType.Int).Value = empresa.Usuario.ID;
            sql.Command.Parameters.Add("@razon_social", System.Data.SqlDbType.NVarChar, 255).Value = empresa.RazonSocial;
            sql.Command.Parameters.Add("@mail", System.Data.SqlDbType.NVarChar, 50).Value = empresa.Mail;
            sql.Command.Parameters.Add("@telefono", System.Data.SqlDbType.NVarChar, 50).Value = empresa.Telefono;
            
            sql.Command.Parameters.Add("@calle", System.Data.SqlDbType.NVarChar, 255).Value = empresa.Calle;
            sql.Command.Parameters.Add("@num_calle", System.Data.SqlDbType.Decimal).Value = empresa.Numero;
            sql.Command.Parameters["@num_calle"].Scale = 0;
            sql.Command.Parameters["@num_calle"].Precision = 18;
            sql.Command.Parameters.Add("@piso", System.Data.SqlDbType.Decimal).Value = empresa.Piso;
            sql.Command.Parameters["@piso"].Scale = 0;
            sql.Command.Parameters["@piso"].Precision = 18;
            sql.Command.Parameters.Add("@depto", System.Data.SqlDbType.NVarChar, 50).Value = empresa.Depto;
            sql.Command.Parameters.Add("@localidad", System.Data.SqlDbType.NVarChar, 255).Value = empresa.Localidad;
            sql.Command.Parameters.Add("@cod_postal", System.Data.SqlDbType.NVarChar, 255).Value = empresa.CodPostal;
            sql.Command.Parameters.Add("@ciudad", System.Data.SqlDbType.NVarChar, 255).Value = empresa.Ciudad;
            

            sql.Command.Parameters.Add("@FechaCreacion", System.Data.SqlDbType.DateTime).Value = empresa.FechaCreacion;
            sql.Command.Parameters.Add("@CUIT", System.Data.SqlDbType.NVarChar, 50).Value = empresa.CUIT;
            sql.Command.Parameters.Add("@NombreContacto", System.Data.SqlDbType.NVarChar, 255).Value = empresa.Contacto;

            sql.EjecutarSolo();

        }


        /// <summary>
        /// verifica si ya existe el razonSocial en la db
        /// </summary>
        public bool RazonSocialExistente(string razonSocial)
        {
            SqlConexion sql = new SqlConexion("empresa_buscarPorRazonSocial");

            sql.Command.Parameters.Add("@razonSocial", System.Data.SqlDbType.NVarChar, 255).Value = razonSocial;
            return sql.Ejecutar().Rows.Count > 0;
        }

        public bool CUITExistente(string cuit)
        {
            SqlConexion sql = new SqlConexion("empresa_buscarPorCUIT");

            sql.Command.Parameters.Add("@cuit", System.Data.SqlDbType.NVarChar, 50).Value = cuit;
            return sql.Ejecutar().Rows.Count > 0;
        }

    }
}
