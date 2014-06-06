using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controller
{
    public class PreguntaController
    {

        public DataTable Respuestas(int usuario)
        {
            SqlConexion sql = new SqlConexion("Respuestas");
            sql.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = usuario;


            return sql.Ejecutar();
        }

        public DataTable Preguntas(int usuario)
        {
            SqlConexion sql = new SqlConexion("Preguntas");
            sql.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = usuario;


            return sql.Ejecutar();
        }
        
        public void Responder(int preg_id, int usuario, string respuesta)
        {
            SqlConexion sql = new SqlConexion("Pregunta_Responder");
            sql.Command.Parameters.Add("@id", SqlDbType.Int).Value = preg_id;
            sql.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = usuario;
            sql.Command.Parameters.Add("@respuesta", SqlDbType.NVarChar, 255).Value = respuesta;
            
            sql.Command.Parameters.Add("@Fecha", SqlDbType.DateTime).Value = Config.FechaSistema;
            
            sql.EjecutarSolo();
        }
    }
}
