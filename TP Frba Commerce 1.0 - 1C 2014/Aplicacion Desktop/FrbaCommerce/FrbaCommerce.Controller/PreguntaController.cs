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

        public DataTable Respuestas()
        {
            SqlConexion sql = new SqlConexion("Respuestas");
            sql.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = Sesion.Usuario.ID;
            
            return sql.Ejecutar();
        }

        public DataTable Preguntas()
        {
            SqlConexion sql = new SqlConexion("Preguntas");
            sql.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = Sesion.Usuario.ID;
            
            return sql.Ejecutar();
        }
        
        public void Responder(int preg_id, string respuesta)
        {
            SqlConexion sql = new SqlConexion("Pregunta_Responder");
            sql.Command.Parameters.Add("@id", SqlDbType.Int).Value = preg_id;
            sql.Command.Parameters.Add("@respuesta", SqlDbType.NVarChar, 255).Value = respuesta;

            //sql.Command.Parameters.Add("@Fecha", SqlDbType.DateTime).Value = Config.FechaSistema;
            
            sql.EjecutarSolo();
        }

        public void Preguntar(int publicacion_id, int usuario, string p_3)
        {
            throw new NotImplementedException();
        }

        public void Preguntar(int publ_id, string pregunta)
        {
            SqlConexion sql = new SqlConexion("Preguntar");
            sql.Command.Parameters.Add("@publicacion", SqlDbType.Int).Value = publ_id;
            sql.Command.Parameters.Add("@pregunta", SqlDbType.NVarChar, 255).Value = pregunta;
            sql.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = Sesion.Usuario.ID;

            sql.Command.Parameters.Add("@Fecha", SqlDbType.DateTime).Value = Config.FechaSistema;

            sql.EjecutarSolo();
        }

        public bool Validar(Publicacion publicacion, out string mensaje)
        {
            mensaje = string.Empty;

            if (Sesion.Usuario.ID == publicacion.Usuario.ID)
                mensaje += "\nNo se puede autopreguntarse. ";

            return mensaje == string.Empty;
        }
        
    }
}
