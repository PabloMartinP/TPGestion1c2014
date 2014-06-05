using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controller
{
    public class RubroController
    {

        /// <summary>
        /// devuelve todos los rubros
        /// </summary>
        /// <returns></returns>
        public IList<Rubro> Rubros()
        {
            SqlConexion sql = new SqlConexion("Rubros");


            return _cargar(sql.Ejecutar());
        }

        private List<Rubro> _cargar(DataTable dt)
        {
            List<Rubro> lista = new List<Rubro>();

            Rubro r;
            foreach (DataRow dr in dt.Rows)
            {
                r = new Rubro();

                r.Codigo = int.Parse(dr["rubr_id"].ToString());
                r.ID = int.Parse(dr["rubr_codigo"].ToString());
                r.Descripcion = dr["rubr_descripcion"].ToString();

                lista.Add(r);
            }

            return lista;
        }

        public List<Rubro> BuscarPorPublicacion(int codigo)
        {
            List<Rubro> lista ;
            SqlConexion sql = new SqlConexion("Publicacion_Rubros");
            sql.Command.Parameters.Add("@codigo", SqlDbType.Int).Value = codigo;
            lista = _cargar(sql.Ejecutar());
            return lista;
        }
    }
}
