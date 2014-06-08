using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controller
{
    public class FacturaController
    {

        public DataTable Pagos()
        {
            SqlConexion sql = new SqlConexion("");
            sql.Command.CommandText = "select * from MAS_INSERTIVO.TIPO_PAGO";
            sql.Command.CommandType = System.Data.CommandType.Text;
            
            return sql.Ejecutar();
        }

        /// <summary>
        /// devuelvo el top cantidad de las compras sin facturar para el user actual
        /// </summary>
        public DataTable ComprasAFacturar(int cantidad)
        {
            SqlConexion sql = new SqlConexion("ComprasParaFacturar");
            sql.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = Sesion.Usuario.ID;
            sql.Command.Parameters.Add("@cantidad", SqlDbType.TinyInt).Value = cantidad;

            return sql.Ejecutar();
        }
    }
}
