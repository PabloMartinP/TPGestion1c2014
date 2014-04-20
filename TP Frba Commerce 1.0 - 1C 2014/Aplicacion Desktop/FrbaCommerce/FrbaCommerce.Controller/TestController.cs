using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace FrbaCommerce.Controller
{
    public class TestController
    {
        public void insert_t1()
        {
            SqlConexion sql = new SqlConexion("insert_t1");
            //sql.Command.Parameters.Add("@parametrodesql", SqlDbType.NVarChar, 50).Value = "hola";            
            sql.EjecutarSolo();

            //SqlCommand cmd = ConexionController.SqlCommand_Inicializar("insert_t1");
            //cmd.ExecuteNonQuery();

            /*
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();

            da.Fill(dt);
            */
        }
        public void insert_t2()
        {
            SqlCommand cmd = ConexionController.SqlCommand_Inicializar("insert_t2");
            cmd.ExecuteNonQuery();            
        }
    }
}
