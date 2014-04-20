using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace FrbaCommerce.Controller
{
    public class SqlConexion
    {
        private SqlCommand _command;

        public SqlCommand Command { get; set; }


        public SqlConexion(string sp)
        {
            _command = ConexionController.SqlCommand_Inicializar("insert_t1");
        }

        /// <summary>
        /// ejecuta solo, no devuelve nada
        /// </summary>
        public void EjecutarSolo()
        {
            _command.ExecuteNonQuery();
        }
        
        /// <summary>
        /// ejecuta y devuelve el resultado de la consulta en un dataTable
        /// </summary>
        /// <returns></returns>
        public DataTable Ejecutar()
        {
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = _command;
            DataTable dt = new DataTable();

            da.Fill(dt);

            return dt; 
        }
    }
}
