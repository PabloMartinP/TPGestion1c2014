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

        private const int PUBLICACION = 0;
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
        public DataTable ComprasParaFacturar(int cantidad, bool incluirPublicaciones)
        {
            SqlConexion sql = new SqlConexion("ComprasParaFacturar");
            sql.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = Sesion.Usuario.ID;
            sql.Command.Parameters.Add("@cantidad", SqlDbType.TinyInt).Value = cantidad;
            sql.Command.Parameters.Add("@incluirPublicacion", SqlDbType.Bit).Value = incluirPublicaciones;

            return sql.Ejecutar();
        }

        public void Facturar(Factura f)
        {
            int numero = InsertarCabecera(f.Cabecera);

            InsertarItems(f.Items, numero);

            MarcarComoPagado(f.Items);
        }

        private void MarcarComoPagado(List<Detalle> lista)
        {
            SqlConexion sql = new SqlConexion("Fact_MarcarComoPagado");
            foreach (Detalle d in lista)
            {
                if (d.Comp_Id == PUBLICACION)
                {
                    sql.Command.Parameters.Add("@comp_id", SqlDbType.Int).Value = DBNull.Value;
                    sql.Command.Parameters.Add("@publ_id", SqlDbType.Int).Value = d.Publicacion;
                }
                else
                {
                    //si es compra
                    sql.Command.Parameters.Add("@comp_id", SqlDbType.Int).Value = d.Comp_Id;
                    sql.Command.Parameters.Add("@publ_id", SqlDbType.Int).Value = DBNull.Value;
                }
                
                sql.EjecutarSolo();
                sql.Command.Parameters.Clear();
            }
        }

        private void InsertarItems(List<Detalle> lista, int factura)
        {
            SqlConexion sql = new SqlConexion("Fact_InsertarItem");
            int i =1;
            foreach (Detalle d in lista)
            {
                sql.Command.Parameters.Add("@factura", SqlDbType.Int).Value = factura;
                sql.Command.Parameters.Add("@renglon", SqlDbType.Int).Value = i;
                sql.Command.Parameters.Add("@publicacion", SqlDbType.Int).Value = d.Publicacion;
                sql.Command.Parameters.Add("@Cantidad", SqlDbType.Int).Value = d.Cantidad;
                sql.Command.Parameters.Add("@Monto", SqlDbType.Decimal).Value = d.Monto;
                sql.Command.Parameters["@Monto"].Scale = 0;
                sql.Command.Parameters["@Monto"].Precision = 18;

                sql.EjecutarSolo();
                sql.Command.Parameters.Clear();
                i++;

            }
        }

        private int InsertarCabecera(Cabecera cabecera)
        {
            SqlConexion sql = new SqlConexion("Fact_InsertarCabecera");

            sql.Command.Parameters.Add("@fecha", SqlDbType.DateTime).Value = cabecera.Fecha;
            sql.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = cabecera.Usuario;
            sql.Command.Parameters.Add("@tipoPago", SqlDbType.Int).Value = cabecera.TipoPago;
            sql.Command.Parameters.Add("@total", SqlDbType.Decimal).Value = cabecera.Total;
            sql.Command.Parameters["@total"].Scale = 0;
            sql.Command.Parameters["@total"].Precision = 18;
            
            return int.Parse(sql.Ejecutar().Rows[0][0].ToString());
        }
    }
}
