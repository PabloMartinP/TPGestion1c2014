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
        public SqlCommand Command { get; set; }
        
        

        public SqlConexion(string sp)
        {
            Command = ConexionController.SqlCommand_Inicializar(sp);
        }

        /// <summary>
        /// ejecuta solo, no devuelve nada
        /// </summary>
        public void EjecutarSolo()
        {
            try
            {
                Command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {                
                throw ex;
            }
            
        }
        
        /// <summary>
        /// ejecuta y devuelve el resultado de la consulta en un dataTable
        /// </summary>
        /// <returns></returns>
        public DataTable Ejecutar()
        {
            try
            {                
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = Command;
                DataTable dt = new DataTable();

                da.Fill(dt);

                return dt; 
            }
            catch (Exception ex)
            {                
                throw ex;
            }
        }
    }
}
