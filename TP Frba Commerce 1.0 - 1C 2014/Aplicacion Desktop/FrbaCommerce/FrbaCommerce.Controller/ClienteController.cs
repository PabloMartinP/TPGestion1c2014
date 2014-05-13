using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FrbaCommerce.Entity;
using System.Data;

namespace FrbaCommerce.Controller
{
    public class ClienteController
    {
        public void Agregar(Cliente cliente)
        {

            //agrego el usuario
            UsuarioController uc = new UsuarioController();            
            uc.Agregar(cliente.Usuario);
            cliente.Usuario = uc.Buscar(cliente.Usuario.UserName);


            //agrego el cliente

            SqlConexion sql = new SqlConexion("Cliente_Agregar");

            sql.Command.Parameters.Add("@usuario", System.Data.SqlDbType.Int).Value = cliente.Usuario.ID;
            sql.Command.Parameters.Add("@nombre", System.Data.SqlDbType.NVarChar, 255).Value = cliente.Nombre;
            sql.Command.Parameters.Add("@apellido", System.Data.SqlDbType.NVarChar, 255).Value = cliente.Apellido;
            sql.Command.Parameters.Add("@tipo_doc", System.Data.SqlDbType.Int).Value = cliente.TipoDoc;
            sql.Command.Parameters.Add("@num_doc", System.Data.SqlDbType.Decimal).Value = cliente.Doc;
            sql.Command.Parameters["@num_doc"].Scale = 0;
            sql.Command.Parameters["@num_doc"].Precision = 18;
            sql.Command.Parameters.Add("@mail", System.Data.SqlDbType.NVarChar, 255).Value = cliente.Mail;
            sql.Command.Parameters.Add("@telefono", System.Data.SqlDbType.Decimal).Value = cliente.Telefono;
            sql.Command.Parameters["@telefono"].Scale = 0;
            sql.Command.Parameters["@telefono"].Precision = 18;
            sql.Command.Parameters.Add("@calle", System.Data.SqlDbType.NVarChar, 255).Value = cliente.Calle;
            sql.Command.Parameters.Add("@num_calle", System.Data.SqlDbType.Decimal).Value = cliente.Numero;
            sql.Command.Parameters["@num_calle"].Scale = 0;
            sql.Command.Parameters["@num_calle"].Precision = 18;
            sql.Command.Parameters.Add("@piso", System.Data.SqlDbType.Decimal).Value = cliente.Piso;
            sql.Command.Parameters["@piso"].Scale = 0;
            sql.Command.Parameters["@piso"].Precision = 18;
            sql.Command.Parameters.Add("@depto", System.Data.SqlDbType.NVarChar, 50).Value = cliente.Depto;
            sql.Command.Parameters.Add("@localidad", System.Data.SqlDbType.NVarChar, 255).Value = cliente.Localidad;
            sql.Command.Parameters.Add("@cod_postal", System.Data.SqlDbType.NVarChar, 255).Value = cliente.CodPostal;
            sql.Command.Parameters.Add("@fecha_nac", System.Data.SqlDbType.DateTime).Value = cliente.FechaNac;
            sql.Command.Parameters.Add("@cuil", System.Data.SqlDbType.NVarChar, 50).Value = cliente.CUIL;

            sql.EjecutarSolo();


        }



        /// <summary>
        /// verifica si ya existe el telefono en la db
        /// </summary>
        public bool TelefonoExistente(string telefono)
        {
            SqlConexion sql = new SqlConexion("cliente_buscarPorTelefono");
            
            sql.Command.Parameters.Add("@telefono", System.Data.SqlDbType.Decimal).Value = telefono;
            sql.Command.Parameters["@telefono"].Scale = 0;
            sql.Command.Parameters["@telefono"].Precision = 18;
            return sql.Ejecutar().Rows.Count > 0;
        }

        /// <summary>
        /// verifica si existe el tipo-doc en la db
        /// </summary>
        public bool DocumentoExistente(int tipo, string documento)
        {
            SqlConexion sql = new SqlConexion("cliente_buscarPorDocumento");
            sql.Command.Parameters.Add("@tipo_doc", System.Data.SqlDbType.Int).Value = tipo;
            sql.Command.Parameters.Add("@num_doc", System.Data.SqlDbType.Decimal).Value = documento;
            sql.Command.Parameters["@num_doc"].Scale = 0;
            sql.Command.Parameters["@num_doc"].Precision = 18;

            return sql.Ejecutar().Rows.Count > 0;
        }

        public DataTable ObtenerTiposDocumento()
        {
            SqlConexion sql = new SqlConexion("cliente_tipos_doc");
            return sql.Ejecutar();
        }
    }
}
