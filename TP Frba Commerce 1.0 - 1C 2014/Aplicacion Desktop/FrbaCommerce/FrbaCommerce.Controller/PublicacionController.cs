﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controller
{
    public class PublicacionController
    {

        public DataTable Estados()
        {
            SqlConexion sql = new SqlConexion("Publicacion_Estados");
            return sql.Ejecutar();
        }

        public DataTable Tipos()
        {
            SqlConexion sql = new SqlConexion("Publicacion_Tipos");
            return sql.Ejecutar();
        }

        public Publicacion.eEstado BuscarEstado(int codigo)
        {
            FrbaCommerce.Entity.Publicacion.eEstado e = (Publicacion.eEstado)codigo;

            return e;
            /*
            SqlConexion sql = new SqlConexion("Publicacion_estado_buscar");
            sql.Command.Parameters.Add("@Codigo", SqlDbType.Int).Value = codigo;
            return _cargarEstado(sql.Ejecutar());
            */
        }

        /*
        private Publicacion.eEstado _cargarEstado(DataTable dt)
        {
            int codigo = int.Parse(dt.Rows[0][0].ToString());
            FrbaCommerce.Entity.Publicacion.eEstado e = (Publicacion.eEstado)codigo;

            return e;
        }*/

        public Publicacion.eTipo BuscarTipo(int codigo)
        {
            FrbaCommerce.Entity.Publicacion.eTipo e = (Publicacion.eTipo)codigo;
            return e;
            /*
            SqlConexion sql = new SqlConexion("Publicacion_tipo_buscar");
            sql.Command.Parameters.Add("@Codigo", SqlDbType.Int).Value = codigo;
            return _cargarTipo(sql.Ejecutar());
             * */
        }
        /*
        private Publicacion.eTipo _cargarTipo(DataTable dt)
        {
            int codigo = int.Parse(dt.Rows[0][0].ToString());
            FrbaCommerce.Entity.Publicacion.eTipo e = (Publicacion.eTipo)codigo;

            return e;
        }*/

        public void Generar(Publicacion p)
        {
            SqlConexion sqlp = new SqlConexion("publicacion_generar");
            sqlp.Command.Parameters.Add("@descripcion", SqlDbType.NVarChar, 255).Value = p.Descripcion;
            sqlp.Command.Parameters.Add("@stock", SqlDbType.Decimal).Value = p.Stock;
            sqlp.Command.Parameters["@stock"].Precision = 18;
            sqlp.Command.Parameters["@stock"].Scale = 0;

            sqlp.Command.Parameters.Add("@fecha", SqlDbType.DateTime).Value = p.Fecha;
            sqlp.Command.Parameters.Add("@fecha_Vencimiento", SqlDbType.DateTime).Value = p.Vencimiento;
            sqlp.Command.Parameters.Add("@precio", SqlDbType.Decimal).Value = p.Precio;
            sqlp.Command.Parameters["@precio"].Precision = 18;
            sqlp.Command.Parameters["@precio"].Scale = 2;

            sqlp.Command.Parameters.Add("@visibilidad", SqlDbType.Int).Value = p.Visibilidad.Id;
            sqlp.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = p.Usuario.ID;
            sqlp.Command.Parameters.Add("@estado", SqlDbType.Int).Value = p.Estado;
            sqlp.Command.Parameters.Add("@tipo", SqlDbType.Int).Value = p.Tipo;
            sqlp.Command.Parameters.Add("@preguntas", SqlDbType.Bit).Value = p.Preguntas;

            ////////////////////////////////////////////////////////////////////////
            ///////////////////////////////////////////////////////////////////////
            int publicacion_codigo;
            publicacion_codigo = int.Parse(sqlp.Ejecutar().Rows[0][0].ToString());

            SqlConexion sqlr;
            //inserto los rubros

            foreach (Rubro r in p.Rubros)
            {
                sqlr = new SqlConexion("rubro_publicacion_insertar");
                sqlr.Command.Parameters.Add("@rubro", SqlDbType.Int).Value = r.ID;
                sqlr.Command.Parameters.Add("@publicacion", SqlDbType.Int).Value = publicacion_codigo;

                sqlr.EjecutarSolo();
            }


        }

        public DataTable Filtrar(string descripcion, int usuario)
        {
            SqlConexion sql = new SqlConexion("Publicacion_filtrar");
            sql.Command.Parameters.Add("@descripcion", SqlDbType.NVarChar, 255).Value = descripcion;
            sql.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = usuario;


            return sql.Ejecutar();
        }

        public Publicacion Buscar(int codigo)
        {
            SqlConexion sql = new SqlConexion("Publicacion_Buscar");
            sql.Command.Parameters.Add("@codigo", SqlDbType.Int).Value = codigo;
            return _cargar(sql.Ejecutar());

        }

        private Publicacion _cargar(DataTable dt)
        {
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Publicacion p = new Publicacion();

                p.Id = int.Parse(dr["publ_id"].ToString());
                p.Descripcion = dr["publ_Descripcion"].ToString();
                p.Stock = int.Parse(dr["publ_stock"].ToString());
                p.Fecha = DateTime.Parse(dr["publ_Fecha"].ToString());
                p.Vencimiento = DateTime.Parse(dr["Publ_fecha_venc"].ToString());
                p.Precio = decimal.Parse(dr["publ_precio"].ToString());

                VisibilidadController vc = new VisibilidadController();
                int codigoVisi = int.Parse(dr["publ_visibilidad"].ToString());
                p.Visibilidad = vc.Buscar(codigoVisi);

                UsuarioController uc = new UsuarioController();
                int codigoUsuario = int.Parse(dr["publ_usuario"].ToString());
                p.Usuario = uc.BuscarPorId(codigoUsuario);

                PublicacionController pc = new PublicacionController();
                int codigoEstado = int.Parse(dr["publ_estado"].ToString());
                p.Estado = pc.BuscarEstado(codigoEstado);

                int codigoTipo = int.Parse(dr["publ_tipo"].ToString());
                p.Tipo = pc.BuscarTipo(codigoTipo);

                p.Preguntas = bool.Parse(dr["publ_permitir_preguntas"].ToString());

                ////////////////////////////

                RubroController rc = new RubroController();
                p.Rubros = rc.BuscarPorPublicacion(p.Id);

                


                return p;
            }
            else
                return null;
        }
    }
}
