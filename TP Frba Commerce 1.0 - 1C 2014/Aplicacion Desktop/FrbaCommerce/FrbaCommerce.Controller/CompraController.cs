﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controller
{
    public class CompraController
    {
        public void Comprar(int publicacion, decimal cantidad)
        {
            SqlConexion sql = new SqlConexion("Comprar");

            sql.Command.Parameters.Add("@publicacion", SqlDbType.Int).Value = publicacion;

            sql.Command.Parameters.Add("@cantidad", SqlDbType.Decimal).Value = cantidad;
            sql.Command.Parameters["@cantidad"].Precision = 18;
            sql.Command.Parameters["@cantidad"].Scale = 0;

            sql.Command.Parameters.Add("@fecha", SqlDbType.DateTime).Value = Config.FechaSistema;

            sql.Command.Parameters.Add("@usuario", SqlDbType.Int).Value = Sesion.Usuario.ID;
            

            sql.EjecutarSolo();
        }
    }
}
