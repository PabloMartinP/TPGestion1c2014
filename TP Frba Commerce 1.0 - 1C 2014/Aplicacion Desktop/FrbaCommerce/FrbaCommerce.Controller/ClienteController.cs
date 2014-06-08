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
        public Cliente Buscar(int codigo)
        {
            
            SqlConexion sql = new SqlConexion("cliente_buscar");
            sql.Command.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = codigo;

            return _cargarDatos(sql.Ejecutar());
        }

        private Cliente _cargarDatos(DataTable dt)
        {
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Cliente cliente = new Cliente();
                UsuarioController uc = new UsuarioController();
                cliente.Usuario = uc.BuscarPorId(int.Parse(dr["clie_usuario"].ToString()));


                cliente.Documento = new Documento();
                cliente.Documento.Tipo = int.Parse(dr["clie_tipo_doc"].ToString());
                cliente.Documento.Numero = double.Parse(dr["clie_num_doc"].ToString());

                cliente.Apellido = dr["clie_apellido"].ToString();
                cliente.Nombre = dr["clie_nombre"].ToString();
                cliente.Mail = dr["clie_mail"].ToString();
                cliente.Telefono = dr["clie_telefono"].ToString();
                cliente.Calle = dr["clie_dom_calle"].ToString();
                cliente.Numero = int.Parse(dr["clie_num_calle"].ToString());
                cliente.Piso = int.Parse(dr["clie_piso"].ToString());
                cliente.Depto = dr["clie_depto"].ToString();
                cliente.Localidad = dr["clie_localidad"].ToString();
                cliente.CodPostal = dr["clie_cod_postal"].ToString();
                cliente.FechaNac = DateTime.Parse(dr["clie_fecha_nac"].ToString());
                cliente.CUIL = dr["clie_cuil"].ToString();
                //cliente.Puntuacion = int.Parse(dr["clie_puntuacion"].ToString());

                return cliente;
            }
            else
                return null;
        }

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
            sql.Command.Parameters.Add("@tipo_doc", System.Data.SqlDbType.Int).Value = cliente.Documento.Tipo;
            sql.Command.Parameters.Add("@num_doc", System.Data.SqlDbType.Decimal).Value = cliente.Documento.Numero;
            sql.Command.Parameters["@num_doc"].Scale = 0;
            sql.Command.Parameters["@num_doc"].Precision = 18;
            sql.Command.Parameters.Add("@mail", System.Data.SqlDbType.NVarChar, 255).Value = cliente.Mail;
            sql.Command.Parameters.Add("@telefono", System.Data.SqlDbType.NVarChar, 50).Value = cliente.Telefono;
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
        public bool DocumentoExistente(Documento documento)
        {
            SqlConexion sql = new SqlConexion("cliente_buscarPorDocumento");
            sql.Command.Parameters.Add("@tipo_doc", System.Data.SqlDbType.Int).Value = documento.Tipo;
            sql.Command.Parameters.Add("@num_doc", System.Data.SqlDbType.Decimal).Value = documento.Numero;
            sql.Command.Parameters["@num_doc"].Scale = 0;
            sql.Command.Parameters["@num_doc"].Precision = 18;

            return sql.Ejecutar().Rows.Count > 0;
        }

        public DataTable Filtrar(string nombre, string apellido, Documento documento, string mail)
        {
            SqlConexion sql = new SqlConexion("cliente_filtrar");

            sql.Command.Parameters.Add("@nombre", System.Data.SqlDbType.NVarChar, 255).Value = nombre;
            sql.Command.Parameters.Add("@apellido", System.Data.SqlDbType.NVarChar, 255).Value = apellido;
            sql.Command.Parameters.Add("@tipo_doc", System.Data.SqlDbType.Int).Value = documento.Tipo;
            sql.Command.Parameters.Add("@num_doc", System.Data.SqlDbType.Decimal).Value = documento.Numero;
            sql.Command.Parameters["@num_doc"].Scale = 0;
            sql.Command.Parameters["@num_doc"].Precision = 18;
            sql.Command.Parameters.Add("@mail", System.Data.SqlDbType.NVarChar, 255).Value = mail;
            
            return sql.Ejecutar();
        }

        public void Guardar(Cliente cliente)
        {

            SqlConexion sql = new SqlConexion("Cliente_Guardar");

            sql.Command.Parameters.Add("@usuario", System.Data.SqlDbType.Int).Value = cliente.Usuario.ID;
            sql.Command.Parameters.Add("@nombre", System.Data.SqlDbType.NVarChar, 255).Value = cliente.Nombre;
            sql.Command.Parameters.Add("@apellido", System.Data.SqlDbType.NVarChar, 255).Value = cliente.Apellido;
            sql.Command.Parameters.Add("@tipo_doc", System.Data.SqlDbType.Int).Value = cliente.Documento.Tipo;
            sql.Command.Parameters.Add("@num_doc", System.Data.SqlDbType.Decimal).Value = cliente.Documento.Numero;
            sql.Command.Parameters["@num_doc"].Scale = 0;
            sql.Command.Parameters["@num_doc"].Precision = 18;
            sql.Command.Parameters.Add("@mail", System.Data.SqlDbType.NVarChar, 255).Value = cliente.Mail;
            sql.Command.Parameters.Add("@telefono", System.Data.SqlDbType.NVarChar, 50).Value = cliente.Telefono;
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

        public bool Existe(int codigo)
        {
            SqlConexion sql = new SqlConexion("Cliente_Existe");

            sql.Command.Parameters.Add("@codigo", SqlDbType.Int).Value = codigo;

            return sql.Ejecutar().Rows.Count > 0;
        }

        public DataTable Historial(FrbaCommerce.Entity.Enum.eTipoHistorialCliente eTipoHistorialCliente)
        {

            
            switch (eTipoHistorialCliente)
            {
                case FrbaCommerce.Entity.Enum.eTipoHistorialCliente.Compras:
                    break;
                case FrbaCommerce.Entity.Enum.eTipoHistorialCliente.Ofertas:
                    break;
                case FrbaCommerce.Entity.Enum.eTipoHistorialCliente.Calificaciones:
                    break;
                default:
                    break;
            }

            return null;
        }
    }
}
