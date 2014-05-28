﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FrbaCommerce.Entity;
using System.Data;

namespace FrbaCommerce.Controller
{
    public class UsuarioController
    {

        public void Agregar(Usuario usuario)
        {
            SqlConexion sql = new SqlConexion("usuario_agregar");
            sql.Command.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = usuario.UserName;
            sql.Command.Parameters.Add("@password", SqlDbType.NVarChar, 64).Value = usuario.Password;
            sql.Command.Parameters.Add("@primera_vez", SqlDbType.Bit).Value = usuario.PrimeraVez;
            sql.Command.Parameters.Add("@tipo", SqlDbType.TinyInt).Value = (int)usuario.Tipo;

            sql.EjecutarSolo();
        }

        public Usuario Buscar(string userName)
        {
            SqlConexion sql = new SqlConexion("Usuario_Buscar");
            sql.Command.Parameters.Add("username", System.Data.SqlDbType.NVarChar, 50).Value = userName;

            return _cargar(sql.Ejecutar());
        }

        private Usuario _cargar(DataTable dt)
        {
            if (dt.Rows.Count > 0)
            {
                Usuario u = new Usuario();

                u.ID = (int)(dt.Rows[0]["Usua_id"]);
                u.UserName = dt.Rows[0]["Usua_UserName"].ToString();
                u.Password = dt.Rows[0]["Usua_Password"].ToString();
                u.Habilitado = (bool)dt.Rows[0]["Usua_habilitado"];

                //u.Tipo = (Usuario.eTipo)dt.Rows[0]["usua_tipo"];

                if (int.Parse(dt.Rows[0]["usua_tipo_usuario"].ToString()) == 1)
                    u.Tipo = Usuario.eTipo.Cliente;
                else
                    u.Tipo = Usuario.eTipo.Empresa;
                /*
                switch (int.Parse(dt.Rows[0]["usua_tipo"].ToString()))
                {
                    case (int)Usuario.eTipo.Empresa:
                        u.Tipo = Usuario.eTipo.Cliente;
                        break;
                    case (int)(Usuario.eTipo.Cliente):
                        u.Tipo  = Usuario.eTipo.Empresa;
                        break;

                    default:
                        break;
                }

                */

                return u;
            }
            else
                return null;
        }

        public bool ValidarLogin(string userName, string password)         
        {
            SqlConexion sql = new SqlConexion("Usuario_ValidarLogin");
                        
            sql.Command.Parameters.Add("username", System.Data.SqlDbType.NVarChar, 50).Value = userName;
            sql.Command.Parameters.Add("password", System.Data.SqlDbType.NVarChar, 64).Value = Usuario.Encriptar(password);
            sql.Command.Parameters.Add("resultado", System.Data.SqlDbType.Bit).Direction = System.Data.ParameterDirection.Output;

            sql.EjecutarSolo();


            return (bool)sql.Command.Parameters["resultado"].Value;
        }
    }
}
