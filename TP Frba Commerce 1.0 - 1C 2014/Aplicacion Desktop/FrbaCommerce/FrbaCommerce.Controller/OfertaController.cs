using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FrbaCommerce.Entity;
using System.Data;

namespace FrbaCommerce.Controller
{
    public class OfertaController
    {

        public void Ofertar(int publicacion, decimal monto)
        {
            SqlConexion sql = new SqlConexion("Ofertar");
            sql.Command.Parameters.Add("@publicacion", SqlDbType.Int).Value = publicacion;

            sql.Command.Parameters.Add("@monto", SqlDbType.Decimal).Value = monto;
            sql.Command.Parameters["@monto"].Precision = 18;
            sql.Command.Parameters["@monto"].Scale = 0;

            sql.Command.Parameters.Add("@fecha", SqlDbType.DateTime).Value = Config.FechaSistema;

            sql.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = Sesion.Usuario.ID;
            

            sql.EjecutarSolo();
        }
    }
}
