using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FrbaCommerce.Entity;
using System.Data;

namespace FrbaCommerce.Controller
{
    public class UsuarioController
    {

        public Usuario BuscarPorId(int codigo)
        {
            SqlConexion sql = new SqlConexion("Usuario_BuscarPorId");
            sql.Command.Parameters.Add("id", System.Data.SqlDbType.Int).Value = codigo;

            return _cargar(sql.Ejecutar());
        }

        /// <summary>
        /// genero un nuevo cliente con el CUIL como username
        /// </summary>
        /// <param name="cliente"></param>
        /// <returns></returns>
        public Usuario GenerarUsuarioCliente(Cliente cliente)
        {
            Usuario u = new Usuario();
            u.UserName = cliente.CUIL;
            u.Password = string.Empty;
            u.PrimeraVez = true;
            u.Tipo = Usuario.eTipo.Cliente;
            return u;
        }

        public Usuario GenerarUsuarioEmpresa(Empresa empresa)
        {
            Usuario u = new Usuario();
            u.UserName = empresa.Telefono;
            u.Password = string.Empty;
            u.PrimeraVez = true;
            u.Tipo = Usuario.eTipo.Empresa;
            return u;
        }

        public void Agregar(Usuario usuario)
        {
            SqlConexion sql = new SqlConexion("usuario_agregar");
            sql.Command.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = usuario.UserName;
            sql.Command.Parameters.Add("@password", SqlDbType.NVarChar, 64).Value = usuario.Password;
            sql.Command.Parameters.Add("@primera_vez", SqlDbType.Bit).Value = usuario.PrimeraVez;
            
            sql.EjecutarSolo();
        }

        public Usuario Buscar(string userName)
        {
            SqlConexion sql = new SqlConexion("Usuario_Buscar");
            sql.Command.Parameters.Add("username", System.Data.SqlDbType.NVarChar, 50).Value = userName;

            return _cargar(sql.Ejecutar());
        }

        private Usuario _cargar(DataTable dt)
        {
            if (dt.Rows.Count > 0)
            {
                Usuario u = new Usuario();

                u.ID = (int)(dt.Rows[0]["Usua_id"]);
                u.UserName = dt.Rows[0]["Usua_UserName"].ToString();
                u.Password = dt.Rows[0]["Usua_Password"].ToString();
                u.Habilitado = (bool)dt.Rows[0]["Usua_habilitado"];

                ClienteController cc = new ClienteController();


                if (cc.Existe(u.ID))
                    u.Tipo = Usuario.eTipo.Cliente;
                else
                    u.Tipo = Usuario.eTipo.Empresa;
                

                return u;
            }
            else
                return null;
        }

        public bool ValidarLogin(string userName, string password)         
        {
            SqlConexion sql = new SqlConexion("Usuario_ValidarLogin");

            sql.Command.Parameters.Add("username", System.Data.SqlDbType.NVarChar, 50).Value = userName;
            sql.Command.Parameters.Add("password", System.Data.SqlDbType.NVarChar, 64).Value = Usuario.Encriptar(password);
            sql.Command.Parameters.Add("resultado", System.Data.SqlDbType.Bit).Direction = System.Data.ParameterDirection.Output;

            sql.EjecutarSolo();


            return (bool)sql.Command.Parameters["resultado"].Value;
        }

        /// <summary>
        /// eliminacion logica
        /// </summary>
        /// <param name="codigo"></param>
        public void Eliminar(int codigo)
        {
            SqlConexion sql = new SqlConexion("Usuario_Eliminar");

            sql.Command.Parameters.Add("codigo", System.Data.SqlDbType.Int).Value = codigo;
            
            sql.EjecutarSolo();
        }
    }
}
