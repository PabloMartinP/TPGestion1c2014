using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace FrbaCommerce.Controller
{
    public class ListadoEstadisticoController
    {

        public enum eListadoEstadistico
        {
            VendProdNoVend,
            VendConFact,
            VendConCalif,
            CliePublSinCalif
        }

        public DataTable getListado(int año, int trimestre, eListadoEstadistico eListadoEstadistico)
        {
            SqlConexion sql = new SqlConexion("");
            
            switch (eListadoEstadistico)
            {
                case eListadoEstadistico.VendProdNoVend:
                    sql.Command.CommandText = "ListEstad_VendConMayorCantDeProdNoVendidos";
                    break;
                case eListadoEstadistico.VendConFact:
                    sql.Command.CommandText = "ListEstad_VendConMayorFacturacion";
                    break;
                case eListadoEstadistico.VendConCalif:
                    sql.Command.CommandText = "ListEstad_VendConMayoresCalif";
                    break;
                case eListadoEstadistico.CliePublSinCalif:
                    sql.Command.CommandText = "ListEstad_CliConMayoresPublSinCalif";
                    break;
                default:
                    break;
            }

            sql.Command.Parameters.Add("@anio", SqlDbType.SmallInt).Value = año;
            sql.Command.Parameters.Add("@cuarto", SqlDbType.TinyInt).Value = trimestre;

            return sql.Ejecutar();
        }
    }
}
