using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controller
{
    public class VisibilidadController
    {

        public DataTable Visibilidades()
        {
            SqlConexion sql = new SqlConexion("Visibilidades");

            return sql.Ejecutar();
        }

        public FrbaCommerce.Entity.Visibilidad Buscar(int codigo)
        {
            SqlConexion sql = new SqlConexion("Visi_Buscar");

            sql.Command.Parameters.Add("@Codigo", SqlDbType.Int).Value = codigo;

            return _cargar(sql.Ejecutar());
        }

        private Visibilidad _cargar(DataTable dt)
        {
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Visibilidad v = new Visibilidad();

                v.Id = int.Parse(dr["visi_id"].ToString());
                v.Codigo = int.Parse(dr["visi_codigo"].ToString());
                v.Descripcion = dr["visi_descripcion"].ToString();
                v.Precio = decimal.Parse(dr["visi_precio"].ToString());
                v.DuracionDias = int.Parse(dr["visi_duracion_dias"].ToString());
                v.Prioridad = int.Parse(dr["visi_prioridad"].ToString());

                return v;
            }
            else
                return null;
        }
    }
}
