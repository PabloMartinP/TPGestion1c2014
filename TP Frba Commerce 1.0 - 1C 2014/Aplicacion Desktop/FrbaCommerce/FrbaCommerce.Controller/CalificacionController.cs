using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controller
{
    public class CalificacionController
    {
        /// <summary>
        /// califico al vendedor y actualizo la compraOferta (por trigger after insert)
        /// </summary>
        public void Calificar(Calificacion c)
        {
            SqlConexion sql = new SqlConexion("Calificar");

            sql.Command.Parameters.Add("@cant_estrellas", SqlDbType.TinyInt).Value = c.Estrellas;
            sql.Command.Parameters.Add("@descripcion", SqlDbType.NVarChar, 255).Value = c.Descripcion;

            sql.Command.Parameters.Add("@calificado", SqlDbType.Int).Value = c.Publicacion.Usuario.ID;
            sql.Command.Parameters.Add("@calificador", SqlDbType.Int).Value = Sesion.Usuario.ID;

            sql.Command.Parameters.Add("@tipo", SqlDbType.TinyInt).Value = (int)c.Publicacion.Tipo;
            
            sql.Command.Parameters.Add("@compra_oferta", SqlDbType.Int).Value = c.Compra_Oferta_Id;

            sql.EjecutarSolo();
        }
    }
}
