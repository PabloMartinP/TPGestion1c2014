using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace FrbaCommerce.Entity
{
    public class Config
    {

        public static string Get(string key)
        {
            return ConfigurationManager.AppSettings[key];
        }

        public static string FechaSistemaYYYYMMDD
        {
            get
            {
                return Config.FechaSistema.ToString("yyyyMMdd");
            }
        }

        public static DateTime FechaSistema
        {
            get
            {
                DateTime fecha = DateTime.Today;
                var data = Get("fechaSistema");
                if (DateTime.TryParse(data, out fecha))
                {
                    return fecha;
                }

                return DateTime.Today;
            }
        }

        public static string ConnectionString
        {
            //get { return Get("connectionString"); }

            //get { return "server=localhost\\SQLSERVER2008;database=GD2C2012;User Id=gd;Password=gd2012;Trusted_Connection=False"; }
            get { return ConfigurationManager.ConnectionStrings["conexion"].ConnectionString; }
        }
    }
}
