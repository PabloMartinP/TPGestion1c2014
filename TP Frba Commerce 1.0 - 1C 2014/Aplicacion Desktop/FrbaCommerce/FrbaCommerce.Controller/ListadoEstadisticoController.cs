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
            SqlConexion sql = null;
            
            switch (eListadoEstadistico)
            {
                case eListadoEstadistico.VendProdNoVend:
                    sql = new SqlConexion("ListEstad_VendConMayorCantDeProdNoVendidos");
                    break;
                case eListadoEstadistico.VendConFact:
                    sql = new SqlConexion("ListEstad_VendConMayorFacturacion");
                    break;
                case eListadoEstadistico.VendConCalif:
                    sql =  new SqlConexion("ListEstad_VendConMayoresCalif");
                    break;
                case eListadoEstadistico.CliePublSinCalif:
                    sql = new SqlConexion("ListEstad_CliConMayoresPublSinCalif");
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
