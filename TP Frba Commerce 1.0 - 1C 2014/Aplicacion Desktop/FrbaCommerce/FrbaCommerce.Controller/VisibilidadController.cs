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

        public List<Visibilidad> Visibilidades()
        {
            SqlConexion sql = new SqlConexion("Visibilidades");

            return _cargarTodos(sql.Ejecutar());
        }

        private List<Visibilidad> _cargarTodos(DataTable dt)
        {
            List<Visibilidad> lista = new List<Visibilidad>();
            Visibilidad v;
            foreach (DataRow dr in dt.Rows)
            {
                v = _cargarUnaSola(dr);
                lista.Add(v);
            }

            return lista;
        }

        public FrbaCommerce.Entity.Visibilidad Buscar(int codigo)
        {
            SqlConexion sql = new SqlConexion("Visi_Buscar");

            sql.Command.Parameters.Add("@Codigo", SqlDbType.Int).Value = codigo;

            return _cargar(sql.Ejecutar());
        }

        private Visibilidad _cargarUnaSola(DataRow dr)
        {
            Visibilidad v = new Visibilidad();

            v.Id = int.Parse(dr["visi_id"].ToString());
            v.Codigo = int.Parse(dr["visi_codigo"].ToString());
            v.Descripcion = dr["visi_descripcion"].ToString();
            v.Precio = decimal.Parse(dr["visi_precio"].ToString());
            v.DuracionDias = int.Parse(dr["visi_duracion_dias"].ToString());
            v.Prioridad = int.Parse(dr["visi_prioridad"].ToString());
            v.Porcentaje = decimal.Parse(dr["visi_porcentaje"].ToString());

            return v;
        }

        private Visibilidad _cargar(DataTable dt)
        {
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Visibilidad v = _cargarUnaSola(dr);

                return v;
            }
            else
                return null;
        }

        public void Agregar(Visibilidad v)
        {
            SqlConexion sql = new SqlConexion("visi_agregar");

            sql.Command.Parameters.Add("@codigo", SqlDbType.Decimal).Value = v.Codigo;
            sql.Command.Parameters["@codigo"].Scale = 0;
            sql.Command.Parameters["@codigo"].Precision = 18;

            sql.Command.Parameters.Add("@descripcion", SqlDbType.NVarChar, 255).Value = v.Descripcion;

            sql.Command.Parameters.Add("@precio", SqlDbType.Decimal).Value = v.Precio;
            sql.Command.Parameters["@precio"].Scale = 0;
            sql.Command.Parameters["@precio"].Precision = 18;

            sql.Command.Parameters.Add("@porcentaje", SqlDbType.Decimal).Value = v.Porcentaje;
            sql.Command.Parameters["@porcentaje"].Scale = 0;
            sql.Command.Parameters["@porcentaje"].Precision = 18;

            sql.Command.Parameters.Add("@duracionDias", SqlDbType.Decimal).Value = v.DuracionDias;
            sql.Command.Parameters["@duracionDias"].Scale = 0;
            sql.Command.Parameters["@duracionDias"].Precision = 18;

            sql.Command.Parameters.Add("@Prioridad", SqlDbType.Decimal).Value = v.Prioridad;
            sql.Command.Parameters["@Prioridad"].Scale = 0;
            sql.Command.Parameters["@Prioridad"].Precision = 18;

            sql.EjecutarSolo();

        }

        public void Modificar(Visibilidad v)
        {
            SqlConexion sql = new SqlConexion("visi_Editar");

            sql.Command.Parameters.Add("@id", SqlDbType.Int).Value = v.Id;

            sql.Command.Parameters.Add("@codigo", SqlDbType.Decimal).Value = v.Codigo;
            sql.Command.Parameters["@codigo"].Scale = 0;
            sql.Command.Parameters["@codigo"].Precision = 18;

            sql.Command.Parameters.Add("@descripcion", SqlDbType.NVarChar, 255).Value = v.Descripcion;

            sql.Command.Parameters.Add("@precio", SqlDbType.Decimal).Value = v.Precio;
            sql.Command.Parameters["@precio"].Scale = 0;
            sql.Command.Parameters["@precio"].Precision = 18;

            sql.Command.Parameters.Add("@porcentaje", SqlDbType.Decimal).Value = v.Porcentaje;
            sql.Command.Parameters["@porcentaje"].Scale = 0;
            sql.Command.Parameters["@porcentaje"].Precision = 18;

            sql.Command.Parameters.Add("@duracionDias", SqlDbType.Decimal).Value = v.DuracionDias;
            sql.Command.Parameters["@duracionDias"].Scale = 0;
            sql.Command.Parameters["@duracionDias"].Precision = 18;

            sql.Command.Parameters.Add("@Prioridad", SqlDbType.Decimal).Value = v.Prioridad;
            sql.Command.Parameters["@Prioridad"].Scale = 0;
            sql.Command.Parameters["@Prioridad"].Precision = 18;

            sql.EjecutarSolo();
        }

        public DataTable Filtrar(string descripcion)
        {
            SqlConexion sql = new SqlConexion("Visi_Filtrar");

            sql.Command.Parameters.Add("@descripcion", SqlDbType.NVarChar, 255).Value = descripcion;
            return sql.Ejecutar();
        }

        public void Eliminar(int visi_id)
        {
            SqlConexion sql = new SqlConexion("visi_eliminar");
            sql.Command.Parameters.Add("@id", SqlDbType.Int).Value = visi_id;

            sql.EjecutarSolo();
        }
    }
}
